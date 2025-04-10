from util import seed
import os

files = os.listdir("seed")
files.sort()
for i, obj in enumerate(files):
    files[i] = "seed/" + obj

for file in files:
    seed(file)