<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <student-trip>
            <xsl:apply-templates select="organisme"/>
        </student-trip>
    </xsl:template>

    <xsl:template match="organisme">
        <sejours>
            <xsl:apply-templates select="sejours/sejour"/>
        </sejours>
        <clients>
            <xsl:apply-templates select="clients/client"/>
        </clients>
        <enseignants>
            <xsl:apply-templates select="enseignants/enseignant"/>
        </enseignants>
    </xsl:template>

    <xsl:template match="sejour">
        <sejour>
            <id><xsl:value-of select="@id"/></id>
            <typeSejour><xsl:value-of select="@typeSejour"/></typeSejour>
            <destination><xsl:value-of select="@destination"/></destination>
            <nbPlaces><xsl:value-of select="@nbPlaces"/></nbPlaces>
            <dateDebut><xsl:value-of select="@dateDebut"/></dateDebut>
            <dateFin><xsl:value-of select="@dateFin"/></dateFin>
            <prix><xsl:value-of select="@prix"/></prix>
        </sejour>
    </xsl:template>

    <xsl:template match="client">
        <client>
            <id><xsl:value-of select="@id"/></id>
            <nom><xsl:value-of select="@nom"/></nom>
            <prenom><xsl:value-of select="@prenom"/></prenom>
            <email><xsl:value-of select="@email"/></email>
            <telephone><xsl:value-of select="@telephone"/></telephone>
            <typePublic><xsl:value-of select="@typePublic"/></typePublic>
        </client>
    </xsl:template>

    <xsl:template match="enseignant">
        <enseignant>
            <id><xsl:value-of select="@id"/></id>
            <nom><xsl:value-of select="@nom"/></nom>
            <prenom><xsl:value-of select="@prenom"/></prenom>
            <email><xsl:value-of select="@email"/></email>
            <telephone><xsl:value-of select="@telephone"/></telephone>
            <langues>
                <xsl:apply-templates select="langue"/>
            </langues>
        </enseignant>
    </xsl:template>

    <xsl:template match="langue">
        <langue>
            <xsl:value-of select="."/>
        </langue>
    </xsl:template>

</xsl:stylesheet>
