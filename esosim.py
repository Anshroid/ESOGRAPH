import re

def load():
    recording = False
    SIMSCALE = 1

    C = 0

    # ===== GRAPH SETUP =====
    labels = ["I", "O0", "O1", "*"]
    edges = []
    instructions = []

    inp = []

    with open("graph.glf", "r") as file:
        tmp = [("SWAP *", "I", "I", ""), ("SWAP *", "O0", "O0", ""), ("SWAP *", "O1", "O1", ""), ("SWAP *", "*", "*", "")]
        for line in file.read().splitlines():
            if line == "":
                continue

            if line.startswith("NODE"):
                m = re.match(r"NODE (.*)\((.*)\) (.+?) (.+?)(?: (.*))?$", line)
                labels.append(m.group(1))
                tmp.append((m.group(2), m.group(3), m.group(4), m.group(5)))

            if line.startswith("CUR"):
                n = labels.index(line.split("=")[1].strip())

            if line.startswith("INPUT"):
                inp = [int(x) for x in line.split("=")[1].strip()]

        for i, (instr, p0, p1, others) in enumerate(tmp):
            edges.append((i, labels.index(p0), True))
            edges.append((i, labels.index(p1), False))

            instruction = instr.split()

            if instruction[0] == "PUSH":
                instructions.append(("PUSH", labels.index(instruction[1]), labels.index(instruction[2])))
            else:
                instructions.append(("SWAP", labels.index(instruction[1])))

    I = 0
    O0 = 1
    O1 = 2

    output = [[]]

    def step(n, inp, output):
            p0 = next(edge for edge in edges if edge[0] == n and edge[2] == True)
            p1 = next(edge for edge in edges if edge[0] == n and edge[2] == False)

            if n == I:
                x = inp.pop(0) if len(inp) > 0 else 0
                n = p1[1] if x else p0[1]
                return (n, inp, output)

            elif n == O0:
                output[-1].append(0)

            elif n == O1:
                output[-1].append(1)

            else:
                current = instructions[n]

                xp0 = next(edge for edge in edges if edge[0] == current[1] and edge[2] == True)
                xp1 = next(edge for edge in edges if edge[0] == current[1] and edge[2] == False)
                edges.remove(xp0)
                edges.remove(xp1)

                if current[0] == "PUSH":
                    edges.append((xp1[0], xp1[1], True))
                    edges.append((xp1[0], current[2], False))
                
                else:
                    edges.append((xp1[0], xp1[1], True))
                    edges.append((xp0[0], xp0[1], False))

            if len(output[-1]) == 8:
                output.append(int("".join([str(i) for i in output.pop()][::-1   ]), 2))
                output.append([])

            newn = p0[1]
            p0 = next(edge for edge in edges if edge[0] == n and edge[2] == True)
            p1 = next(edge for edge in edges if edge[0] == n and edge[2] == False)

            return (newn, inp, output)

    while n != 3:
        C += 1
        (n, inp, output) = step(n, inp, output)
        # if re.search(r"\d_[+\-,.><\[\]](?![tp])", labels[n]) or "and_eq" in labels[n]:
        #     print(labels[n], inp, output, labels[next(edge for edge in edges if edge[0] == n and edge[2] == True)[1]])

    print(output, C)

load()