import lxml.etree as ET			// uses lxml for parsing
content = "data.xml"
doc = ET.fromstring(content)
data = doc.find('data of interest')		//tag that defines source of data
print(data.text)
info = doc.find('information')			//tag that defines metadata
print(info.tail)
outfile = "test.txt"
FILE.close