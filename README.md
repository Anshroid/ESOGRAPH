# ESOGRAPH
> by Anshul Nema, Zhanqi Wang

> Looking for the original hackathon README? Find it here

Welcome to ESOGRAPH! This is a project that won 2nd Place in the Oxford CompSoc's MT25 Mini Hackathon, where the theme was esolangs. This was incredibly frustrating but incredibly fun to make, so please enjoy!

https://github.com/user-attachments/assets/28dda6c3-3aeb-468e-ae62-15e71af29176

## The Idea
Zhanqi came up with the idea of making a self-modifying language, but one that runs on a graph. This makes the graph very satisfying to look at, and in a way you never know what will happen next. Additionally, we wanted to make the language as simple as possible for maximum effect. Here's how it works:

- Start with a directed graph where every node has outdegree 2. The graph may be cyclic and in particular self-loops are allowed.
- Out of the two edges pointing out of each node $n$, one is denoted$p_0(n)$ and the other is denoted $p_1(n)$.
- Four nodes are always present in the graph: $I$, $O_0$, $O_1$ and $*$. The first three are equipped with I/O operations, while the fourth simply loops back to itself in both $p_0$ and $p_1$ and acts as a sink node.
- To interpret the graph, we start at a node specified in the graph definition file (usually labeled $S$) and we follow its $p_0$ edge to visit $p_0(S)$. Then we visit $p_0(p_0(S))$, and so on.
- If we are at the input node (which is the only special case), we pop a bit of input and follow $p_0$ if it is 0 and $p_1$ if it is 1.
- If we are at $O_0$ we output a 0 and if we are at $O_1$ we output a 1.

On its own, this would be a pretty boring graph. The magic happens when we add operations to the nodes:
- Each node is also equipped with an operation. This operation is either `PUSH x y` or `SWAP x`, where `x` and `y` are statically specified nodes. 
- The PUSH operation will set $p_0(x) := p_1(x)$ and then replace $p_1(x):=y$.
- The SWAP operation will swap $p_0(x)$ and $p_1(x)$.

There's also a "NOP" operation, which is an alias for `SWAP *`, which does nothing at all.

That's all we need! With those simple operations we have enough to make a compiler from Brainfuck, as long as memory is constrained to a (preferably small) number of bytes.

https://github.com/user-attachments/assets/c5f4b570-319f-4670-9507-45684bcac35d

https://github.com/user-attachments/assets/a6ebfda2-e391-408f-b34d-69d14760111c

## Building Logic
One of the most obvious places to start experimenting with this graph is with logic gates. The first thing we did was try to make some, mostly by hand at this point. Here are some demonstrations of XOR and AND gates. These work by defining bits, which are an important building block for everything here. 

The core memory of a bit is defined with three nodes, $b$, $bp0$ and $bp1$. By default we have $p_0(b)=bp0$ and $p_1(b)=bp1$, but if ever we reach the instruction `SWAP b` the bit would be flipped. Then we could simply connect things to $bp0$ and $bp1$ and visit the node $b$ to read the state of the bit. If we need to reset the bit, we simply apply `PUSH b bp0` and `PUSH b bp1`, which will set the state back to 0 regardless of what it currently is.

https://github.com/user-attachments/assets/66d2d109-fd8e-47af-af96-8683bcc12a92

We could easily chain logic gates together to make more complex circuits - half adders, full adders, even logic for entire bytes (and a byte incrementer is as far as we got in the original hackathon):

https://www.youtube.com/watch?v=9eSy7x4UbUg

But to get from here to a full brainfuck implementation we needed a change in perspective. Before we get there, however, let's go through the visualisation.

## Force-directed graphing
I'd always wanted to make a force directed graph, but never got around to it before this! We load in each of the nodes from a file and for each of them apply:
- a gravity force (so that nodes stay towards the centre)
- a resistance force (so that they settle down and don't retain velocity)
- a node repulsion force (so that they don't cluster too much)
- an edge length correction force (so that it actually looks like a graph)
- an edge alignment force (so that long chains look nicer)

and just for fun, I implemented dragging nodes around with the mouse. It soon became very necessary with some of the massive graphs we ended up dealing with!

The next thing to do was to colour in the nodes. A node is grey if it is a NOP, peach if it is a SWAP and mauve if it is a PUSH (thanks catppuccin for the colour scheme!)
A node is also filled in cyan if it is the currently processing node, red if it is the $x$ in the current operation and yellow if it is the $y$ in the current operation.

This makes a very neat looking graph, but it wasn't always so! Here are some in-development images...

<div style="display: flex; flex-direction: row;">
<img width="300" height="400" alt="image" src="https://github.com/user-attachments/assets/ccd879c3-d0a1-4258-9a03-d36830d768ff" />
<img width="300" height="400" alt="image" src="https://github.com/user-attachments/assets/8f751394-16ac-471f-a15b-d4240a0b86c1" />
</div>


## ESOFUCK (post-hackathon)

I had an idea for how to redesign the infrastructure to make a compiler, and I couldn't get it out of my head. So I did the obvious thing and worked on it instead of doing problem sheets!

The new architecture isn't based on logic gates. Instead I designed it from the ground up specifically for brainfuck, and looked at each of the necessary algorithms in turn. I also had an idea for how to fix the main problem we were having with the old method, which was:

Our logic gate algorithms always referred statically to a given bit. Because operations are immutable, running a logic gate with different inputs would require changing the bits that were specifically designated to be inputs to that gate, which causes issues when we need to save bits somewhere else. We were being forced to think in terms of operations on an entire tape, which is clunky and inefficient. 

My idea was to make algorithms that could be connected to an arbitrary byte using strings of PUSH nodes. The way to do this is to use bitwise algorithms instead of logic gates, and use a concept that I call *heads*.

---

### Heads!
A head is a binary tree, where we denote the root node as $p$ (for pointer), its children as $p0$ and $p1$, their children as $p00$, $p01$, $p10$, $p11$ and one more layer below that, giving us 8 leaf nodes. We can PUSH the bits of any byte we like we like onto these leaf nodes, allowing us to enter the tree at $p$ and end up at whichever bit we want depending on the way the pointers are set. This way, we can perform algorithms through $p$ without knowing beforehand _which_ byte we are about to read or write to. This is exactly what we need to make a brainfuck tape. Here are the three heads we need:

### The Bit Head
The bit head is the first of our three heads. For this one we attach the $b$ of each bit to the leaves of the head, and we (statically) connect $bp0$ of every bit to a node $C_0$ and $bp1$ to $C_1$. Then if we enter `bH_p`, we will end up at either $C_0$ or $C_1$ depending on whether the bit at the pointer is set to 0 or 1. This allows us to read arbitrary bits of arbitrary bytes, and we can PUSH connections onto $C_0$ and $C_1$ to do something with the output.

<img width="500" height="840" alt="image" src="https://github.com/user-attachments/assets/35ef4bc4-e809-4644-88cd-1717d33fc7c2" />

### The Flip Head
The flip head works very similarly, where instead of attaching $b$ of each bit we simply attach a SWAP node that flips that bit, which means we can flip arbitrary bits of arbitrary bytes too. We also statically connect all of these flips to a node labelled `ft`, which is the exit node of the head no matter which bit was edited.

### The Inc Head
So far we can read and flip arbitrary bits. We haven't yet specified how we're going to be modifying the bit pointer! It turns out that we can do this very cleanly, since the bitwise algorithms we're going to be using (_increment_, _decrement_, _input_, _output_ and _nor_)  only require us to start the pointer at the left and move right (using big-endian for convenience). Let me give an example by explaining the increment algorithm.

Let's say we want to increment the decimal number 11. We write it as 1101 in big-endian binary. Then:
- Flip the first bit (0101). 
- If this bit is now 1, we return.
- If the bit is instead 0, we need to carry so we move right and go back to step 1 (0001)
	- This loops one more time in this case and we end up with 0011 when we return.

This means we only need to change the bit pointer in one way - incrementing it. We do this with another head, where the leaves of the head refer to SWAP nodes that flip the pointer nodes in all three heads so they all remain synchronised, and return through a common exit node.

If we increment the pointer all the way to the right (representing an overflow or underflow for inc and dec), our pointer can return through a separate exit node so we can detect when this happens.

### Head Reset
This is the final mechanism we need for our heads. This is simply a string of PUSH nodes that reset the bit pointers on all the heads to 0 ready for the next byte operation.

---
We are now ready for our first byte operations! 

### Increment 
Here is the schematic for how to increment a byte using our three heads. The setup block is a list of PUSHes that connect all the heads together in the way we need for this algorithm, which is overwritten each time we do a different algorithm but which allows us to reuse the heads, saving node count.

<img width="594" height="321" alt="image" src="https://github.com/user-attachments/assets/f01bb6be-9fc0-42b5-be20-97588e65d23e" />

### Decrement
The decrement algorithm, funnily enough, is the exact same as the increment algorithm but with C0 and C1 swapped.

### Input
The input algorithm simply loops through the bits of the byte and flips them if the input is 1, and leaves them otherwise. This _does_ assume that the byte is initially 0, but I didn't originally think of that so never mind...

<img width="609" height="328" alt="image" src="https://github.com/user-attachments/assets/1b84a89f-0460-477d-bfa7-1a1321a68ef9" />

### Output
The output algorithm loops through the bits and just connects C0 and C1 to O0 and O1. 

<img width="585" height="341" alt="image" src="https://github.com/user-attachments/assets/508999b4-d93f-4c46-9316-2c26967d638f" />

### NOR
The NOR algorithm will loop through the bits as long as they are all 0. If any one of them is 1 then it will exit immediately, indicating that the value of the byte is greater than 0. If we reach the end of byte exit then we know that all of the bits are 0.

<img width="559" height="392" alt="image" src="https://github.com/user-attachments/assets/f52861fa-1280-4253-9560-2d36e402e593" />

---

That is all of the algorithms! Now we have implemented + - , and . from the brainfuck instruction set. We only need [ ] < and >. The first two are relatively simple, since we don't need an instruction pointer stack - the loops can simply be embedded in the graph at compile time. We just need to go through the NOR algorithm to determine whether we should or shouldn't loop.

To implement < and > we need a byte-level pointer of sorts. Rather than making another binary tree, since we don't change bytes as frequently we do the following:

We create _shr_ and _shl_ nodes, that will have as their $p_0$ a string of PUSHes that will attach the next byte onto the bit and flip heads, and then update which attach script is connected to _shl_ and _shr_. Then we can just call shl or shr to switch bytes and then perform all of our operations on them.

That's it! We can now compile any brainfuck program into ESOGRAPH. The one I tested to demonstrate this was multiplication - ",>,<[->[->+>+<<]>>[-<<+>>]<<<]>>." I decided to multiply 4 and 2. This took an hour and 16 minutes of real time to render due to all of the node lag - 600 nodes!!! but the video is 11 minutes and you can find it here:

---
Thank you for reading all this, if you did! I really enjoyed making this project and it will always be really satisfying to me. I hope you've enjoyed learning about it as much as I did!
