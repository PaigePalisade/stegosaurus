import nimPNG
import math


proc writeByte(data: var string, imagepos: var int, b: char) =
  for i in countdown(7, 0):
    data[imagepos] = chr(ord(data[imagepos]) div 2 * 2 + ((ord(b) div 2^i) mod 2)) 
    imagepos += 1

proc hide*(imageName: string, filename: string, output: string = "output.png"): bool =
  let image = loadPNG24(imagename)
  if image == nil:
    echo "Unable to load image"
    return false
  var data = image.data
  let width = image.width
  let height = image.height
  let maxFileSize = ((3 * width * height) div 8) - sizeof(filename)
  var file: File
  try:
    file = open(filename)
  except:
    echo "Unable to open file"
    return false

  if sizeof(file) > maxFileSize:
    echo "File too big to hide in image"
    return false

  var imagepos = 0

  var header = filename & "\n" & $file.getFileSize() & "\n"

  for c in header:
    data.writeByte(imagepos, c)

  var fileData = file.readAll()
  for c in fileData:
    data.writeByte(imagepos, c)

  return savePNG24(output, data, width, height)

when isMainModule:
  import cligen
  dispatch(hide, help = {"imageName": "filename for the source image (must be PNG)",
  "filename": "filename for the file to hide in the source image",
  "output": "output image filename (\"output.png\" by default)"})