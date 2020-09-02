import src/steghide
import src/stegreveal
import os

var e: ref IOError
new(e)

if not hide("tests/steg.png", "tests/wiki.zip", "tests/output.png"):
    raise e

movefile("tests/wiki.zip", "tests/input.zip")

if not reveal("tests/output.png"):
    raise e