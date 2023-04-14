# read xml file and transform it to json

import xml.etree.ElementTree as ET
import json


def parseJson():
    tree = ET.parse('data/organisme.xml')
    root = tree.getroot()
    data = {}
    data['organisme'] = []
    for organisme in root.findall('organisme'):
        organismeData = {}
        organismeData['id'] = organisme.find('id').text
        organismeData['nom'] = organisme.find('nom').text
        organismeData['adresse'] = organisme.find('adresse').text
        organismeData['telephone'] = organisme.find('telephone').text
        organismeData['email'] = organisme.find('email').text
        organismeData['siteWeb'] = organisme.find('siteWeb').text
        organismeData['description'] = organisme.find('description').text
        data['organisme'].append(organismeData)
    print(data)
    return json.dump(data, indent=4, sort_keys=True)
