import os
from lxml import etree


def generate_all_html():
    entries = os.listdir('scenarios')
    for entry in entries:
        # if entry is a directory
        if os.path.isdir('scenarios/' + entry):
            files = os.listdir('scenarios/' + entry)
            for file in files:
                if file.endswith('.xsl'):
                    html = render('scenarios/' + entry + '/' + file)
                    with open('scenarios/' + entry + '/' + file[:-4] + '.html', 'wb') as f:
                        f.write(html)


def render(xls_file):
    xslt_doc = etree.parse(xls_file)
    xslt_transformer = etree.XSLT(xslt_doc)

    source_doc = etree.parse("data/organisme.xml")
    output_doc = xslt_transformer(source_doc)
    return etree.tostring(output_doc, pretty_print=True)
