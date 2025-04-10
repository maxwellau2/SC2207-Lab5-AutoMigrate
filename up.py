from util import create_table
import os

files = os.listdir("tables")
files.sort()
for i, obj in enumerate(files):
    files[i] = "tables/" + obj

for file in files:
    create_table(file)
