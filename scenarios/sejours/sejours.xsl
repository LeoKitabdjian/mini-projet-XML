<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xml:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Liste des séjours</title>
                <link rel="stylesheet" type="text/css" href="../../style/sejours.css"/>
            </head>
            <body>
                <main>
                    <section>
                        <h1>Liste des séjours</h1>
                        <div class="articles">
                            <article>
                                <h2>Immersion en famille</h2>
                                <xsl:apply-templates select="organisme/sejours">
                                    <xsl:with-param name="typeS">immersion_en_famille</xsl:with-param>
                                </xsl:apply-templates>
                            </article>
                            <article>
                                <h2>Stage linguistique</h2>
                                <xsl:apply-templates select="organisme/sejours">
                                    <xsl:with-param name="typeS">stage_linguistique</xsl:with-param>
                                </xsl:apply-templates>
                            </article>
                            <article>
                                <h2>Colonie de vacances</h2>
                                <xsl:apply-templates select="organisme/sejours">
                                    <xsl:with-param name="typeS">colonie_de_vacances</xsl:with-param>
                                </xsl:apply-templates>
                            </article>
                        </div>
                    </section>
                </main>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="organisme/sejours">
        <xsl:param name="typeS"/>
        <xsl:for-each select="sejour[@typeSejour=$typeS]">
            <ul>
                <li>
                    Destination :
                    <xsl:value-of select="@destination"/>
                </li>
                <li>Nombre de places :
                    <xsl:value-of select="@nbPlaces"/>
                </li>
                <li>Du
                    <xsl:value-of select="@dateDebut"/> au
                    <xsl:value-of select="@dateFin"/>
                </li>
                <li>Prix : <xsl:value-of select="@prix"/>€
                </li>
                <li>
                    Destiné à :
                    <ul>
                        <xsl:for-each select="typePublic">
                            <xsl:sort/>
                            <li>
                                <xsl:value-of select="."/>
                            </li>
                        </xsl:for-each>
                    </ul>
                </li>
                <li>
                    Langues :
                    <ul>
                        <xsl:for-each select="langue">
                            <xsl:sort/>
                            <li>
                                <xsl:value-of select="."/>
                            </li>
                        </xsl:for-each>
                    </ul>
                </li>
                <xsl:if test="accompagnateur">
                    <li>
                        Accompagnateurs :
                        <ul>
                            <xsl:for-each select="accompagnateur">
                                <li>
                                    <xsl:apply-templates select="/organisme/accompagnateurs">
                                        <xsl:with-param name="id">
                                            <xsl:value-of select="@id"/>
                                        </xsl:with-param>
                                    </xsl:apply-templates>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </li>
                </xsl:if>
                <xsl:if test="enseignant">
                    <li>
                        Enseignants :
                        <ul>
                            <xsl:for-each select="enseignant">
                                <li>
                                    <xsl:apply-templates select="/organisme/enseignants">
                                        <xsl:with-param name="id">
                                            <xsl:value-of select="@id"/>
                                        </xsl:with-param>
                                    </xsl:apply-templates>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </li>
                </xsl:if>
                <xsl:if test="activite">
                    <li>
                        Activités :
                        <ul>
                            <xsl:for-each select="activite">
                                <xsl:sort select="@prix"/>
                                <li>
                                    <xsl:value-of select="@description"/>
                                    <br/>
                                    <xsl:value-of select="@typeActivite"/>
                                    <br/>
                                    <xsl:value-of select="@prix"/>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </li>
                </xsl:if>
                <xsl:if test="cours">
                    <li>
                        Cours :
                        <ul>
                            <xsl:for-each select="cours">
                                <xsl:sort select="@nom"/>
                                <li>
                                    <xsl:value-of select="@nom"/>
                                    <br/>
                                    <xsl:value-of select="@niveau"/>
                                    <!-- REDONDANT AVEC LE NOM
                                        <br/>
                                        <xsl:value-of select="@langue"/>
                                    -->
                                    <br/>
                                    <xsl:if test="@test='TEST'">
                                        <img src="./test.png" alt="test"/>
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </li>
                </xsl:if>
            </ul>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="organisme/accompagnateurs">
        <xsl:param name="id"/>
        <ul>
            <li>
                <span class="material-symbols-outlined">person</span>
                <xsl:value-of select="accompagnateur[@id=$id]/@prenom"/>&#160;<xsl:value-of
                    select="accompagnateur[@id=$id]/@nom"/>
            </li>
            <li>
                <span class="material-symbols-outlined">mail</span>
                <xsl:value-of select="accompagnateur[@id=$id]/@email"/>
            </li>
            <li>
                <span class="material-symbols-outlined">call</span>
                <xsl:value-of select="accompagnateur[@id=$id]/@telephone"/>
            </li>
        </ul>
    </xsl:template>

    <xsl:template match="organisme/enseignants">
        <xsl:param name="id"/>
        <ul>
            <li>
                <span class="material-symbols-outlined">person</span>
                <xsl:value-of select="enseignant[@id=$id]/@prenom"/>&#160;<xsl:value-of
                    select="enseignant[@id=$id]/@nom"/>
            </li>
            <li>
                <span class="material-symbols-outlined">mail</span>
                <xsl:value-of select="enseignant[@id=$id]/@email"/>
            </li>
            <li>
                <span class="material-symbols-outlined">call</span>
                <xsl:value-of select="enseignant[@id=$id]/@telephone"/>
            </li>

            <!-- PEUT ETRE MOINS UTILE ? -->
            <li>
                <ul>
                    <xsl:for-each select="enseignant[@id=$id]/langue">
                        <xsl:sort/>
                        <li>
                            <xsl:value-of select="."/>
                        </li>
                    </xsl:for-each>
                </ul>
            </li>
        </ul>
    </xsl:template>

</xsl:stylesheet>