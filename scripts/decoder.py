design = ""

f = open("algarrobo2025.c")

for line in f.readlines():
	if not line[:2] == "0x":
		continue

	row = line.replace("0xff", "").strip().split(", ")

	for color in row:
		design += color[4:6] + color[2:4] + color[0:2]

f.close()

print("0x" + design)