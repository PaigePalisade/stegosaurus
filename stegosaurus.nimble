# Package

version       = "1"
author        = "Patrick West"
description   = "Hides and reveals files inside of png images."
license       = "MIT"
srcDir        = "src"
bin           = @["stegreveal", "steghide"]



# Dependencies

requires "nim >= 1.2.4"
requires "nimpng >= 0.3.1"
requires "cligen >= 1.2.0"
