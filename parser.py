from xml.dom import minidom
xmldoc = minidom.parse('C:\items.xml')			//xml file with data to parse. 
itemlist = xmldoc.getElementsByTagName('daughter of')	// 'item' is the semantic ID. Change w.r.t. desired output.
s = len(itemlist)
for s in itemlist:
    print s.attributes['name'].value			//all attributes tagged with item ID.