import nimPNG
import strutils
import math


proc getChar(data: string, imagePos: var int): int =
    for i in countdown(7, 0):
        result += (ord(data[imagePos]) mod 2) * 2^i
        imagePos += 1

proc reveal*(imageName: string): bool = 
    let image = loadPNG24(imageName)
    if image == nil:
        echo "Unable to load image"
        return false
    let data = image.data

    var c = ' '
    var filename = ""
    var imagePos = 0

    try:
        while c != '\n':
            c = chr(data.getChar(imagePos))
            filename &= c
        filename.removeSuffix('\n')

        c = ' '
        var filesizeString = ""
        while c != '\n':
            c = chr(data.getChar(imagePos))
            filesizeString &= c
        filesizeString.removeSuffix('\n')
        var filesize = parseInt(filesizeString)

        var fileData = ""

        for i in 0..<filesize:
            fileData &= chr(data.getChar(imagePos))

        let file = open(filename, fmWrite)
        file.write(fileData)
        return true
    except:
        echo "No file hidden in image"
        return false

when isMainModule:
    import cligen
    dispatch(reveal, help = {"imageName": "image with file hidden inside of it"
    })