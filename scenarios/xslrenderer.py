import json
import os
from lxml import etree


def generate():
    entries = os.listdir('scenarios')
    for entry in entries:
        if os.path.isdir('scenarios/' + entry):
            files = os.listdir('scenarios/' + entry)
            for file in files:
                if file.endswith('.xsl'):
                    file_link = 'scenarios/' + entry + '/' + file
                    html = render(file_link)
                    file_link_no_ext = file_link[:-4]
                    if entry == "new_structure":
                        with open(file_link_no_ext + '.xml', 'wb') as f:
                            f.write(html)
                    elif entry == "json":
                        with open(file_link_no_ext + '.json', 'w') as f:
                            f.write(html)
                    else:
                        with open(file_link_no_ext + '.html', 'wb') as f:
                            f.write(html)


def render(xls_file):
    xml = etree.parse("data/organisme.xml")
    xsl = etree.parse(xls_file)
    transformer = etree.XSLT(xsl)
    output = transformer(xml)

    if xls_file.endswith('json.xsl'):

        return json.dumps(json.loads(str(output)), indent=4, sort_keys=True)
    return etree.tostring(output, pretty_print=True)
