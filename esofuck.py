ALLNODES = []

class METANODE():
	def __init__(self, name):
		self.name = name
		self.instruction = f"SWAP *"
		self.p0 = self
		self.p1 = self

SINK = METANODE("*")
I = METANODE("I")
O0 = METANODE("O0")
O1 = METANODE("O1")


class NODE():
	def __init__(self, name, instruction, p0, p1):
		ALLNODES.append(self)
		self.name = name
		self.instruction = instruction
		self.p0 = p0
		self.p1 = p1
		self.bonds = []

	@classmethod
	def PUSH(cls, x, y, name, p0=SINK, p1=SINK):
		return cls(name, f"PUSH {x.name} {y.name}", p0, p1)

	@classmethod
	def SWAP(cls, x, name, p0=SINK, p1=SINK):
		return cls(name, f"SWAP {x.name}", p0, p1)

	@classmethod
	def NOP(cls, name, p0=SINK, p1=SINK):
		return cls(name, f"SWAP *", p0, p1)

	def connect0(self, p0):
		self.p0 = p0

	def connect1(self, p1):
		self.p1 = p1

	def bond(self, other):
		self.bonds.append(other)


class BIT():
	def __init__(self, name):
		self.name = name

		self.bp0 = NODE.NOP(f"{name}_p0")
		self.bp1 = NODE.NOP(f"{name}_p1")
		self.b = NODE.NOP(f"{name}_b", p0=self.bp0, p1=self.bp1)

	def FLIP(self, name):
		return NODE.SWAP(self.b, f"{self.name}_f_{name}")

	def RESET(self, name):
		r1 = NODE.PUSH(self.b, self.bp1, f"{self.name}_r1_{name}")
		r0 = NODE.PUSH(self.b, self.bp0, f"{self.name}_r0_{name}", r1)

		return (r0, r1)


class HEAD():
	def __init__(self, l):
		self.l = l
		self.p_l3 = [NODE.NOP(f"{l}H_p{bin(i)[2:].rjust(3, "0")}") for i in range(8)]
		self.p_l2 = [NODE.NOP(f"{l}H_p{bin(i)[2:].rjust(2, "0")}", self.p_l3[2*i], self.p_l3[2*i+1]) for i in range(4)]
		self.p_l1 = [NODE.NOP(f"{l}H_p{bin(i)[2:]}", self.p_l2[2*i], self.p_l2[2*i+1]) for i in range(2)]
		self.p = NODE.NOP(f"{l}H_p", self.p_l1[0], self.p_l1[1])

	def RESET(self, name):
		l = self.l
		string = [(r1 := NODE.PUSH(self.p_l2[3], self.p_l3[7], f"{l}H_11_r1_{name}")), NODE.PUSH(self.p_l2[3], self.p_l3[6], f"{l}H_11_r0_{name}", r1)]

		for i in range(2,-1,-1):
			string.append(NODE.PUSH(self.p_l2[i], self.p_l3[2*i+1], f"{l}H_{bin(i)[2:].rjust(2, "0")}_r1_{name}", string[-1]))
			string.append(NODE.PUSH(self.p_l2[i], self.p_l3[2*i], f"{l}H_{bin(i)[2:].rjust(2, "0")}_r0_{name}", string[-1]))

		for i in range(1,-1,-1):
			string.append(NODE.PUSH(self.p_l1[i], self.p_l2[2*i+1], f"{l}H_{bin(i)[2:]}_r1_{name}", string[-1]))
			string.append(NODE.PUSH(self.p_l1[i], self.p_l2[2*i], f"{l}H_{bin(i)[2:]}_r0_{name}", string[-1]))

		string.append(NODE.PUSH(self.p, self.p_l1[1], f"{l}H_p_r1_{name}", string[-1]))
		string.append(NODE.PUSH(self.p, self.p_l1[0], f"{l}H_p_r0_{name}", string[-1]))

		return string[::-1]


class BITHEAD(HEAD):
	def __init__(self):
		super().__init__("b")

		self.C0 = NODE.NOP("C0")
		self.C1 = NODE.NOP("C1")

	def ATTACH(self, byte, name):
		string = [(a_111_1 := NODE.PUSH(self.p_l3[7], SINK, f"bH_111_a1_{name}")), NODE.PUSH(self.p_l3[7], byte[7].b, f"bH_111_a0_{name}", a_111_1)]
		
		for i in range(6,-1,-1):
			string.append(NODE.PUSH(self.p_l3[i], SINK, f"bH_{bin(i)[2:].rjust(3, "0")}_a1_{name}", string[-1]))
			string.append(NODE.PUSH(self.p_l3[i], byte[i].b, f"bH_{bin(i)[2:].rjust(3, "0")}_a0_{name}", string[-1]))

			# self.p_l3[i].bond(byte[i].b)

		return string[::-1]


class FLIPHEAD(HEAD):
	def __init__(self):
		super().__init__("f")

		self.ft = NODE.NOP("ft")

	def ATTACH(self, byte, name):
		l = self.l
		string = [(a_111_1 := NODE.PUSH(self.p_l3[7], SINK, f"fH_111_a1_{name}")), NODE.PUSH(self.p_l3[7], byte[7], f"fH_111_a0_{name}", a_111_1)]
		
		for i in range(6,-1,-1):
			string.append(NODE.PUSH(self.p_l3[i], SINK, f"fH_{bin(i)[2:].rjust(3, "0")}_a1_{name}", string[-1]))
			string.append(NODE.PUSH(self.p_l3[i], byte[i], f"fH_{bin(i)[2:].rjust(3, "0")}_a0_{name}", string[-1]))

			# self.p_l3[i].bond(byte[i])

		return string[::-1]


class INCHEAD(HEAD):
	def __init__(self, bithead, fliphead):
		super().__init__("i")

		self.bithead = bithead
		self.fliphead = fliphead
		
		self.e = NODE.NOP(f"iH_e")
		self.t = NODE.NOP(f"iH_t")

		self.chains = [self._swapchain(i) for i in range(8)]
		for p, chain in zip(self.p_l3, self.chains):
			p.connect0(chain[-1])


	def _swapchain(self, i):
		if i == 7:
			return [self.e]

		if i == 3:
			sb = NODE.SWAP(self.bithead.p, f"iH_p{bin(i)[2:].rjust(3, "0")}_sb", self.t)
			sf = NODE.SWAP(self.fliphead.p, f"iH_p{bin(i)[2:].rjust(3, "0")}_sf", sb)
			si = NODE.SWAP(self.p, f"iH_p{bin(i)[2:].rjust(3, "0")}_si", sf)

		elif i % 4 == 1:
			sb = NODE.SWAP(self.bithead.p_l1[(i-1) // 4], f"iH_p{bin(i)[2:].rjust(3, "0")}_sb", self.t)
			sf = NODE.SWAP(self.fliphead.p_l1[(i-1) // 4], f"iH_p{bin(i)[2:].rjust(3, "0")}_sf", sb)
			si = NODE.SWAP(self.p_l1[(i-1) // 4], f"iH_p{bin(i)[2:].rjust(3, "0")}_si", sf)

		else:
			sb = NODE.SWAP(self.bithead.p_l2[i // 2], f"iH_p{bin(i)[2:].rjust(3, "0")}_sb", self.t)
			sf = NODE.SWAP(self.fliphead.p_l2[i // 2], f"iH_p{bin(i)[2:].rjust(3, "0")}_sf", sb)
			si = NODE.SWAP(self.p_l2[i // 2], f"iH_p{bin(i)[2:].rjust(3, "0")}_si", sf)

		return [sb,sf,si]


class HEADRESET():
	def __init__(self, bithead, fliphead, inchead):
		rbH = bithead.RESET("rbH")
		rfH = fliphead.RESET("rfH")
		riH = inchead.RESET("riH")
		
		self.s = NODE.NOP("Hr_s", rbH[0])
		self.t = NODE.NOP("Hr_t")

		rbH[-1].connect0(rfH[0])
		rfH[-1].connect0(riH[0])
		riH[-1].connect0(self.t)


class INCREMENT():
	def __init__(self, bithead, fliphead, inchead, headreset):

		# 																   [->] iH.e -> x
		# s -> [setup] -> lo -> fH.p [->] fH.ft -> bH.p [->] bH.C0 -> iH.p [->] iH.t -> lo
		#												[->] bH.C1 -> x
		# x -> Hr.s [->] Hr.t -> t

		self.t = NODE.NOP(f"inc_t")

		p1_Hr = NODE.PUSH(headreset.t, SINK, f"inc_p1_Hr", fliphead.p)
		p0_Hr = NODE.PUSH(headreset.t, self.t, f"inc_p0_Hr", p1_Hr)
		
		p1_C1 = NODE.PUSH(bithead.C1, SINK, f"inc_p1_C1", p0_Hr)
		p0_C1 = NODE.PUSH(bithead.C1, headreset.s, f"inc_p0_C1", p1_C1)

		p1_iH = NODE.PUSH(inchead.t, SINK, f"inc_p1_iH", p0_C1)
		p0_iH = NODE.PUSH(inchead.t, fliphead.p, f"inc_p0_iH", p1_iH)

		p1_C0 = NODE.PUSH(bithead.C0, SINK, f"inc_p1_C0", p0_iH)
		p0_C0 = NODE.PUSH(bithead.C0, inchead.p, f"inc_p0_C0", p1_C0)

		p1_ft = NODE.PUSH(fliphead.ft, SINK, f"inc_p1_ft", p0_C0)
		p0_ft = NODE.PUSH(fliphead.ft, bithead.p, f"inc_p0_ft", p1_ft)

		p1_e = NODE.PUSH(inchead.e, SINK, f"inc_p1_e", p0_ft)
		p0_e = NODE.PUSH(inchead.e, headreset.s, f"inc_p0_e", p1_e)
		
		self.s = NODE.NOP(f"inc_s", p0_e)


class DECREMENT():
	def __init__(self, bithead, fliphead, inchead, headreset):

		# s -> [setup] -> lo -> fH.p [->] fH.ft -> bH.p [->] bH.C0 -> x
		#												[->] bH.C1 -> iH.p [->] iH.t -> lo
		# 																   [->] iH.e -> x
		# x -> Hr.s [->] Hr.t -> t

		self.t = NODE.NOP(f"dec_t")

		p1_Hr = NODE.PUSH(headreset.t, SINK, f"dec_p1_Hr", fliphead.p)
		p0_Hr = NODE.PUSH(headreset.t, self.t, f"dec_p0_Hr", p1_Hr)
		
		p1_C0 = NODE.PUSH(bithead.C0, SINK, f"dec_p1_C0", p0_Hr)
		p0_C0 = NODE.PUSH(bithead.C0, headreset.s, f"dec_p0_C0", p1_C0)

		p1_iH = NODE.PUSH(inchead.t, SINK, f"dec_p1_iH", p0_C0)
		p0_iH = NODE.PUSH(inchead.t, fliphead.p, f"dec_p0_iH", p1_iH)

		p1_C1 = NODE.PUSH(bithead.C1, SINK, f"dec_p1_C1", p0_iH)
		p0_C1 = NODE.PUSH(bithead.C1, inchead.p, f"dec_p0_C1", p1_C1)

		p1_ft = NODE.PUSH(fliphead.ft, SINK, f"dec_p1_ft", p0_C1)
		p0_ft = NODE.PUSH(fliphead.ft, bithead.p, f"dec_p0_ft", p1_ft)

		p1_e = NODE.PUSH(inchead.e, SINK, f"dec_p1_e", p0_ft)
		p0_e = NODE.PUSH(inchead.e, headreset.s, f"dec_p0_e", p1_e)
		
		self.s = NODE.NOP(f"dec_s", p0_e)


class NOR():
	def __init__(self, bithead, inchead, headreset):

		# 												[->] ih.e -> x
		# s -> [setup] -> lo -> bH.p [->] bH.C0 -> iH.p [->] iH.t -> lo
		#							 [->] bH.C1 -> c_zf -> x
		# x -> Hr.s [->] Hr.t -> t

		self.eq = NODE.NOP(f"noreq")
		self.gt = NODE.NOP(f"norgt")

		c_zf = NODE.SWAP(headreset.t, f"c_zf", headreset.s)

		p1_Hr = NODE.PUSH(headreset.t, self.gt, f"norp1_Hr", bithead.p)
		p0_Hr = NODE.PUSH(headreset.t, self.eq, f"norp0_Hr", p1_Hr)
		
		p1_C1 = NODE.PUSH(bithead.C1, SINK, f"norp1_C1", p0_Hr)
		p0_C1 = NODE.PUSH(bithead.C1, c_zf, f"norp0_C1", p1_C1)

		p1_iH = NODE.PUSH(inchead.t, SINK, f"norp1_iH", p0_C1)
		p0_iH = NODE.PUSH(inchead.t, bithead.p, f"norp0_iH", p1_iH)

		p1_C0 = NODE.PUSH(bithead.C0, SINK, f"norp1_C0", p0_iH)
		p0_C0 = NODE.PUSH(bithead.C0, inchead.p, f"norp0_C0", p1_C0)

		p1_e = NODE.PUSH(inchead.e, SINK, f"norp1_e", p0_C0)
		p0_e = NODE.PUSH(inchead.e, headreset.s, f"norp0_e", p1_e)		

		self.s = NODE.NOP(f"nors", p0_e)


class OUTPUT():
	def __init__(self, bithead, inchead, headreset):

		# s -> [setup] -> lo -> bH.p [->] bH.C0 -> O0 -> c
		#					         [->] bH.C1 -> O1 -> c
		# c -> iH.p [->] iH.t -> lo
		#           [->] iH.e -> Hr.s [->] Hr.t -> t

		self.t = NODE.NOP(f"out_t")

		p1_Hr = NODE.PUSH(headreset.t, SINK, f"out_p1_Hr", bithead.p)
		p0_Hr = NODE.PUSH(headreset.t, self.t, f"out_p0_Hr", p1_Hr)
		
		p1_e = NODE.PUSH(inchead.e, SINK, f"out_p1_e", p0_Hr)
		p0_e = NODE.PUSH(inchead.e, headreset.s, f"out_p0_e", p1_e)

		p1_iH = NODE.PUSH(inchead.t, SINK, f"out_p1_iH", p0_e)
		p0_iH = NODE.PUSH(inchead.t, bithead.p, f"out_p0_iH", p1_iH)

		p1_O0 = NODE.PUSH(O0, SINK, f"out_p1_O0", p0_iH)
		p0_O0 = NODE.PUSH(O0, inchead.p, f"out_p0_O0", p1_O0)

		p1_O1 = NODE.PUSH(O1, SINK, f"out_p1_O1", p0_O0)
		p0_O1 = NODE.PUSH(O1, inchead.p, f"out_p0_O1", p1_O1)

		p1_C1 = NODE.PUSH(bithead.C1, SINK, f"out_p1_C1", p0_O1)
		p0_C1 = NODE.PUSH(bithead.C1, O1, f"out_p0_C1", p1_C1)

		p1_C0 = NODE.PUSH(bithead.C0, SINK, f"out_p1_C0", p0_C1)
		p0_C0 = NODE.PUSH(bithead.C0, O0, f"out_p0_C0", p1_C0)
		
		self.s = NODE.NOP(f"out_s", p0_C0)


class INPUT():
	def __init__(self, fliphead, inchead, headreset):

		# s -> [setup] -> lo -> I ->0 c
		#					      ->1 fH.p [->] fH.ft -> c
		# c -> iH.p [->] iH.t -> lo
		#           [->] iH.e -> Hr.s [->] Hr.t -> t

		self.t = NODE.NOP(f"in_t")

		p1_Hr = NODE.PUSH(headreset.t, SINK, f"in_p1_Hr", I)
		p0_Hr = NODE.PUSH(headreset.t, self.t, f"in_p0_Hr", p1_Hr)
		
		p1_e = NODE.PUSH(inchead.e, SINK, f"in_p1_e", p0_Hr)
		p0_e = NODE.PUSH(inchead.e, headreset.s, f"in_p0_e", p1_e)

		p1_iH = NODE.PUSH(inchead.t, SINK, f"in_p1_iH", p0_e)
		p0_iH = NODE.PUSH(inchead.t, I, f"in_p0_iH", p1_iH)

		p1_O1 = NODE.PUSH(fliphead.ft, SINK, f"in_p1_O1", p0_iH)
		p0_O1 = NODE.PUSH(fliphead.ft, inchead.p, f"in_p0_O1", p1_O1)

		p1_I = NODE.PUSH(I, fliphead.p, f"in_p1_I", p0_O1)
		p0_I = NODE.PUSH(I, inchead.p, f"in_p0_I", p1_I)
		
		self.s = NODE.NOP(f"in_s", p0_I)


class BYTE():
	def __init__(self, C0, C1, ft, name):
		self.bits = [BIT(f"{name}_{i}") for i in range(8)]
		self.flips = [bit.FLIP(f"fh") for bit in self.bits]

		self.name = name

		self.oC0 = NODE.NOP(f"{name}_oC0", C0)
		self.oC1 = NODE.NOP(f"{name}_oC1", C1)
		self.oft = NODE.NOP(f"{name}_oft", ft)

		for bit in self.bits:
			bit.bp0.connect0(self.oC0)
			bit.bp1.connect0(self.oC1)

		for flip in self.flips:
			flip.connect0(self.oft)

	def ATTACH(self):
		ab = bH.ATTACH(self.bits, f"{self.name}_ab")
		af = fH.ATTACH(self.flips, f"{self.name}_af")

		ab[-1].connect0(af[0])

		return ab + af


class BYTEMANAGER():
	def __init__(self, n, C0, C1, ft):
		bytes = [BYTE(C0, C1, ft, f"B{i}") for i in range(n)]

		self.shl = NODE.NOP("shl")
		self.shr = NODE.NOP("shr")

		self.t = NODE.NOP("t")

		ABs = [byte.ATTACH() for byte in bytes]

		for i in range(n):
			ABs[i] += [
				NODE.PUSH(self.shl, ABs[i-1][0], f"B{i}_p0_shl"),
				NODE.PUSH(self.shl, SINK, f"B{i}_p1_shl"),
				NODE.PUSH(self.shr, ABs[(i+1) % n][0], f"B{i}_p0_shr"),
				NODE.PUSH(self.shr, SINK, f"B{i}_p1_shr", self.t)
			]

			ABs[i][-5].connect0(ABs[i][-4])
			ABs[i][-4].connect0(ABs[i][-3])
			ABs[i][-3].connect0(ABs[i][-2])
			ABs[i][-2].connect0(ABs[i][-1])

		self.ABs = ABs

S=NODE.NOP("S")

bH = BITHEAD()
fH = FLIPHEAD()
iH = INCHEAD(bH, fH)
Hr = HEADRESET(bH, fH, iH)

inc = INCREMENT(bH, fH, iH, Hr)
dec = DECREMENT(bH, fH, iH, Hr)
inp = INPUT(fH, iH, Hr)
out = OUTPUT(bH, iH, Hr)
nor = NOR(bH, iH, Hr)

Bm = BYTEMANAGER(4, bH.C0, bH.C1, fH.ft)

S.connect0(Bm.ABs[0][0])

code = ",>,<[->[->+>+<<]>>[-<<+>>]<<<]>>."

istack = []
cnodes = []
for i, instr in enumerate(code):
	match instr:
		case "+":
			_t = NODE.NOP(f"{i}_+t")
			_s = NODE.NOP(f"{i}_+s", inc.s)
			_p1 = NODE.PUSH(inc.t, SINK, f"{i}_+p1", _s)
			_p0 = NODE.PUSH(inc.t, _t, f"{i}_+p0", _p1)

			cnodes.append([_p0, _p1, _s, _t])

		case "-":
			_t = NODE.NOP(f"{i}_-t")
			_s = NODE.NOP(f"{i}_-s", dec.s)
			_p1 = NODE.PUSH(dec.t, SINK, f"{i}_-p1", _s)
			_p0 = NODE.PUSH(dec.t, _t, f"{i}_-p0", _p1)

			cnodes.append([_p0, _p1, _s, _t])

		case ",":
			_t = NODE.NOP(f"{i}_,t")
			_s = NODE.NOP(f"{i}_,s", inp.s)
			_p1 = NODE.PUSH(inp.t, SINK, f"{i}_,p1", _s)
			_p0 = NODE.PUSH(inp.t, _t, f"{i}_,p0", _p1)

			cnodes.append([_p0, _p1, _s, _t])

		case ".":
			_t = NODE.NOP(f"{i}_.t")
			_s = NODE.NOP(f"{i}_.s", out.s)
			_p1 = NODE.PUSH(out.t, SINK, f"{i}_.p1", _s)
			_p0 = NODE.PUSH(out.t, _t, f"{i}_.p0", _p1)

			cnodes.append([_p0, _p1, _s, _t])

		case ">":
			_t = NODE.NOP(f"{i}_>t")
			_s = NODE.NOP(f"{i}_>s", Bm.shr)
			_p1 = NODE.PUSH(Bm.t, SINK, f"{i}_>p1", _s)
			_p0 = NODE.PUSH(Bm.t, _t, f"{i}_>p0", _p1)

			cnodes.append([_p0, _p1, _s, _t])

		case "<":
			_t = NODE.NOP(f"{i}_<t")
			_s = NODE.NOP(f"{i}_<s", Bm.shl)
			_p1 = NODE.PUSH(Bm.t, SINK, f"{i}_<p1", _s)
			_p0 = NODE.PUSH(Bm.t, _t, f"{i}_<p0", _p1)

			cnodes.append([_p0, _p1, _s, _t])

		case "[":
			istack.append(i)

			cnodes.append([NODE.NOP(f"{i}_[")])

		case "]":
			_t = NODE.NOP(f"{i}_]t")
			_s = NODE.NOP(f"{i}_]s", nor.s)
			_p11 = NODE.PUSH(nor.gt, SINK, f"{i}_]p11", _s)
			_p10 = NODE.PUSH(nor.gt, cnodes[istack.pop()][-1], f"{i}_]p10", _p11)
			_p01 = NODE.PUSH(nor.eq, SINK, f"{i}_]p01", _p10)
			_p00 = NODE.PUSH(nor.eq, _t, f"{i}_]p00", _p01)

			cnodes.append([_p00, _p01, _p10, _p11, _s, _t])


for i in range(len(cnodes)):
	(cnodes[i][-1] if i > 0 else Bm.t).connect0(cnodes[i][0])
	cnodes[i][-1].connect0(cnodes[i+1][0] if (i+1) < len(cnodes) else SINK)

print([list(map(lambda e: (e.name, e.p0.name), xs)) for xs in cnodes])

_input="00100000" + "01000000"

with open("graph.glf", "w") as f:
	for node in ALLNODES:
		try:
			f.write(f"NODE {node.name}({node.instruction}) {node.p0.name} {node.p1.name} {" ".join([e.name for e in node.bonds])}\n")
		except AttributeError:
			print(node.p0)

	f.write(f"\nEND\nCUR = {S.name}\nINPUT = {_input}\n")

	f.writelines([
		"SIMSCALE = 3"
	])