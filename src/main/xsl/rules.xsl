<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" version="2.0" encoding="utf8" indent="no"/>

    <xsl:variable name='newline'>
        <xsl:text>&#10;</xsl:text>
    </xsl:variable>

    <xsl:template match="*:jqassistant-rules">
        <xsl:apply-templates select="*:group" />
        <xsl:apply-templates select="*:concept | *:constraint" />
    </xsl:template>

    <xsl:template match="*:group">
[[<xsl:value-of select="@*:id"/>]]
==== Group&#x00A0;`<xsl:value-of select="@*:id"/>`
        <xsl:if test="*:includeGroup">
Includes groups:
            <xsl:for-each select="*:includeGroup">
* &lt;&lt;<xsl:value-of select="@refId"/>,<xsl:value-of select="@refId"/>&gt;&gt;
            </xsl:for-each>
        </xsl:if>

        <xsl:if test="*:includeConstraint">
Includes constraints:
            <xsl:for-each select="*:includeConstraint">
* &lt;&lt;<xsl:value-of select="@refId"/>,<xsl:value-of select="@refId"/>&gt;&gt;
            </xsl:for-each>
        </xsl:if>

        <xsl:if test="*:includeConcept">
Includes concepts:
            <xsl:for-each select="*:includeConcept">
* &lt;&lt;<xsl:value-of select="@refId"/>,<xsl:value-of select="@refId"/>&gt;&gt;
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xsl:template match="*:concept | *:constraint">
        <xsl:variable name="typeName">
            <xsl:choose>
                <xsl:when test="local-name(.) = 'constraint'">Constraint</xsl:when>
                <xsl:when test="local-name(.) = 'concept'">Concept</xsl:when>
                <xsl:otherwise>
                    <xsl:message terminate="yes">Element
                        <xsl:value-of select="local-name(.)"/> not supported.
                    </xsl:message>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

[[<xsl:value-of select="@*:id"/>]]
==== <xsl:value-of select="$typeName"/>&#x00A0;`<xsl:value-of select="@*:id"/>`
<xsl:value-of select="$newline"/>

        <xsl:if test="*:deprecated">
<xsl:value-of select="$newline"/>
_The rule is deprecated: <xsl:value-of select="*:deprecated"/>_
<xsl:value-of select="$newline"/>
        </xsl:if>

<xsl:value-of select="$newline"/>
<xsl:value-of select="*:description"/>
<xsl:value-of select="$newline"/>
[source,cypher,indent=0]
----
<xsl:value-of select="*:cypher"/>
----

        <xsl:if test="*:requiresConcept">
Required concepts:
            <xsl:for-each select="*:requiresConcept">
* &lt;&lt;<xsl:value-of select="@refId"/>,<xsl:value-of select="@refId"/>&gt;&gt;
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="*:providesConcept">
Provided concepts:
            <xsl:for-each select="*:providesConcept">
* &lt;&lt;<xsl:value-of select="@refId"/>,<xsl:value-of select="@refId"/>&gt;&gt;
            </xsl:for-each>
        </xsl:if>

    </xsl:template>

</xsl:stylesheet>
