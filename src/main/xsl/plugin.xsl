<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" version="1.0" encoding="utf8" indent="no"/>

    <xsl:param name="groupId"/>
    <xsl:param name="artifactId"/>

    <xsl:variable name="pluginName">
        <xsl:value-of select="/child::node()/@name"/>
    </xsl:variable>

    <xsl:variable name='newline'>
        <xsl:text>&#10;</xsl:text>
    </xsl:variable>

    <xsl:template match="*:jqassistant-plugin">

[id=<xsl:value-of select="@*:id"/>]
= <xsl:value-of select="@name"/>
<xsl:value-of select="$newline"/>
        <xsl:apply-templates select="*:description"/>
<xsl:value-of select="$newline"/>
        <xsl:apply-templates select="*:scanner"/>
        <xsl:apply-templates select="*:rules"/>
        <xsl:apply-templates select="*:report"/>
    </xsl:template>

    <xsl:template match="*:description">
        <xsl:value-of select="$newline"/>
        <xsl:value-of select="text()"/>
    </xsl:template>

    <!-- Finding a scanner element is taken as signal that
     !   there is a written documentation in a file scanner.adoc
     !   Yes, this is questionable.
     !   Oliver B. Fischer, 2016-02-26
     !-->
    <xsl:template match="*:scanner">
        <xsl:value-of select="$newline"/>
include::{docRoot}/<xsl:value-of select="$groupId"/>/<xsl:value-of select="$artifactId"/>/asciidoc/scanner.adoc[]
    </xsl:template>

    <xsl:template match="*:rules">
        <xsl:value-of select="$newline"/>
== Rules provided by the <xsl:value-of select="$pluginName"/>

        <xsl:for-each select="*:resource">
include::{docRoot}/<xsl:value-of select="$groupId"/>/<xsl:value-of select="$artifactId"/>/asciidoc/jqassistant-rules/<xsl:value-of select="text()"/>-group-summary.adoc[]
        </xsl:for-each>

        <xsl:for-each select="*:resource">
include::{docRoot}/<xsl:value-of select="$groupId"/>/<xsl:value-of select="$artifactId"/>/asciidoc/jqassistant-rules/<xsl:value-of select="text()"/>-constraint-summary.adoc[]
        </xsl:for-each>

        <xsl:for-each select="*:resource">
include::{docRoot}/<xsl:value-of select="$groupId"/>/<xsl:value-of select="$artifactId"/>/asciidoc/jqassistant-rules/<xsl:value-of select="text()"/>-concept-summary.adoc[]
        </xsl:for-each>

        <xsl:for-each select="*:resource">
            <xsl:value-of select="$newline"/>
include::{docRoot}/<xsl:value-of select="$groupId"/>/<xsl:value-of select="$artifactId"/>/asciidoc/jqassistant-rules/<xsl:value-of select="text()"/>.adoc[]
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="*:report">
        <xsl:value-of select="$newline"/>
include::{docRoot}/<xsl:value-of select="$groupId"/>/<xsl:value-of select="$artifactId"/>/asciidoc/report.adoc[]
    </xsl:template>
</xsl:stylesheet>
