<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xml:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Possible affectation des professeurs</title>
                <link rel="stylesheet" type="text/css" href="../../style/affectation.css"/>
            </head>
            <body>
                <main>
                    <section>
                        <h1>Possible affectation des professeurs</h1>
                        <ul>
                            <!-- Pour chaque séjour -->
                            <xsl:for-each select="organisme/sejours/sejour">
                                <li>
                                Séjour <xsl:value-of select="@id"/>
                                <xsl:variable name="sejour"><xsl:value-of select="@id"/></xsl:variable>
                                <ul>
                                    <!-- Pour chaque langue du séjour -->
                                    <xsl:for-each select="langue">
                                        <xsl:variable name="langue"><xsl:value-of select="."/></xsl:variable>
                                        <li><xsl:value-of select="$langue"/></li>
                                        <ul>
                                            <!-- Pour chaque enseignant -->
                                            <xsl:for-each select="/organisme/enseignants/enseignant">
                                                <xsl:variable name="enseignant"><xsl:value-of select="@id"/></xsl:variable>
                                                <!-- Pour chaque langue de cet enseignant -->
                                                <xsl:for-each select="langue">
                                                    <!-- Si la langue de l'enseignant correspond à la langue du séjour -->
                                                    <xsl:if test=". = $langue">
                                                        <!-- On le rajoute -->
                                                        <li><xsl:value-of select="../@prenom"/>&#160;<xsl:value-of select="../@nom"/>
                                                        <!-- On vérifie si l'enseignant est déjà présent sur le séjour -->
                                                        <xsl:for-each select="/organisme/sejours/sejour[@id = $sejour]/enseignant">
                                                            <xsl:if test="@id = $enseignant">
                                                                <present/>
                                                            </xsl:if>
                                                        </xsl:for-each>
                                                        </li>
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </ul>
                                    </xsl:for-each>
                                </ul>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </section>
                </main>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>