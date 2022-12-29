file = open('test.dart', 'r')
s = file.read()
newFile = s
newFile = newFile.replace('}', ',"favorite": false}', -1)
file.close()

file = open('test.dart', 'w')
file.write(newFile)