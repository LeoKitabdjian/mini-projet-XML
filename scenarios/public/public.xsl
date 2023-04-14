<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xml:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Répartition du type de clients</title>
                <link rel="stylesheet" type="text/css" href="../../style/public.css"/>
            </head>
            <body>
                <main>
                    <section>
                        <h1>Répartition du type de clients</h1>
                        <ul>
                            <li>
                                <span>Nombre d'adultes</span>
                                <span>
                                    <xsl:value-of select="count(organisme/clients/client[@typePublic='adulte'])"/>
                                </span>
                            </li>
                            <li>
                                <span>Nombre de familles</span>
                                <span>
                                    <xsl:value-of select="count(organisme/clients/client[@typePublic='famille'])"/>
                                </span>
                            </li>
                            <li>
                                <span>Nombre d'enfants/adolescents</span>
                                <span>
                                    <xsl:value-of select="count(organisme/clients/client[@typePublic='enfant_adolescent'])"/>
                                </span>
                            </li>
                        </ul>
                    </section>
                </main>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>