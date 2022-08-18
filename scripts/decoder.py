import binascii


design  = "0000000000000000"
design += "0000000000000000"
design += "0000000001111000"
design += "0000000011111100"
design += "0000000012222100"
design += "0000000004242110"
design += "0000000002222210"
design += "0011100002662110"
design += "0124200025555000"
design += "0122600000555000"
design += "7755552777332777"
design += "7725577777333777"
design += "7755577777484887"
design += "7728288777788887"
design += "7778888777777777"
design += "7777777777777777"

output = ""

palette = [(19,69,94), (89,171,179), (255, 199, 159), (245,249,250), (40, 40, 40), (220,114,105), (227, 175, 138), (14,64,89), (12,62,87)]

for i in design:
        output += "".join([("%0.2X" % x) for x in palette[int(i)]])

print(output)