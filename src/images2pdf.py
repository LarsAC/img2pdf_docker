import img2pdf
import sys, os, os.path

input_dir = sys.argv[1]
output_file = sys.argv[2]

directory = os.fsencode(input_dir).decode('utf-8')
print(directory)

a4inpt = (img2pdf.mm_to_pt(210), img2pdf.mm_to_pt(297))
layout_fun = img2pdf.get_layout_fun(a4inpt)

with open(output_file, "wb") as f:
    for file in os.listdir(directory):
        filename = os.fsdecode(file)
        if filename.endswith(".jpg"):
            fullname = os.path.join(directory, filename)
            f.write(img2pdf.convert(fullname, layout_fun=layout_fun))
