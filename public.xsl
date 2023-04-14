<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xml:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <body>
                <h1>Répartition du type de clients</h1>
                <ul>
                    <li>
                        Nombre d'adultes : <xsl:value-of select="count(organisme/clients/client[@typePublic='adulte'])"/>
                    </li>
                    <li>
                        Nombre de familles : <xsl:value-of select="count(organisme/clients/client[@typePublic='famille'])"/>
                    </li>
                    <li>
                        Nombre d'enfants/adolescents : <xsl:value-of select="count(organisme/clients/client[@typePublic='enfant_adolescent'])"/>
                    </li>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>