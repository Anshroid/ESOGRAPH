stack = [0,0,0,0,0,0,0,0]

def run(x, stack):
	i = 0; cur = 0; eol = [None]; ipst = []

	while True:
		if i == len(x):
			break

		print("".join([str(i) for i in stack]), x, eol, ipst)
		print((" "*cur + "^").ljust(len(stack)), (" "*i + "^").ljust(len(x)))

		if x[i] == "]":
			if eol[-1]:
				eol.pop()
				i += 1
			else:
				i = ipst.pop()
			continue

		if eol[-1]:
			i += 1
			continue

		if x[i] == ">":
			cur += 1
		elif x[i] == "<":
			cur -= 1
		elif x[i] == "+":
			stack[cur] = 1 - stack[cur]
		elif x[i] == "[":
			if stack[cur] == 0:
				eol.append(True)
			else:
				ipst.append(i)
		
		i += 1

	print("".join([str(i) for i in stack]))