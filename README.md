# Stegosaurus
A simple program for hiding files of any filetype inside of PNG images.

# Build: 
Requires:
- nim and nimble: https://nim-lang.org/install.html
- nimpng
- cligen

To build:
```nimble build```

To install:
```nimble install```

# Usage:
Hide an image:
```steghide -i srcImage.png -f fileToHide.zip -o output.png```
creates an image file called output.png that includes the entirety of fileToHide.zip in pixel data

Reveal file from image:
```stegreveal -i output.png```
recreates fileToHide.zip from output.png
