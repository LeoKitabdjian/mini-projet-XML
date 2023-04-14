<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" extension-element-prefixes="xsl">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <xsl:text>{</xsl:text>
        <xsl:text>"clients":[</xsl:text>
        <xsl:apply-templates select="//client"/>
        <xsl:text>],</xsl:text>
        <xsl:text>"accompagnateurs":[</xsl:text>
        <xsl:apply-templates select="//accompagnateurs"/>
        <xsl:text>]}</xsl:text>
    </xsl:template>

    <xsl:template match="client">
        <xsl:text>{"id":</xsl:text>
        <xsl:value-of select="@id"/>
        <xsl:text>,"nom":"</xsl:text>
        <xsl:value-of select="@nom"/>
        <xsl:text>","prenom":"</xsl:text>
        <xsl:value-of select="@prenom"/>
        <xsl:text>","email":"</xsl:text>
        <xsl:value-of select="@email"/>
        <xsl:text>","telephone":"</xsl:text>
        <xsl:value-of select="@telephone"/>
        <xsl:text>","typePublic":"</xsl:text>
        <xsl:value-of select="@typePublic"/>
        <xsl:text>"}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>



    <xsl:template match="accompagnateur">
        <xsl:text>{"id":</xsl:text>
        <xsl:value-of select="@id"/>
        <xsl:text>,"nom":"</xsl:text>
        <xsl:value-of select="@nom"/>
        <xsl:text>","prenom":"</xsl:text>
        <xsl:value-of select="@prenom"/>
        <xsl:text>","email":"</xsl:text>
        <xsl:value-of select="@email"/>
        <xsl:text>","telephone":"</xsl:text>
        <xsl:value-of select="@telephone"/>
        <xsl:text>"}</xsl:text>
        <xsl:if test="position() != last()">
            <xsl:text>,</xsl:text>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>