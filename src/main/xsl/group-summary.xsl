<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" version="2.0" encoding="utf8" indent="no"/>

    <xsl:template match="*:jqassistant-rules">
        <xsl:for-each select="*:group">
* &lt;&lt;<xsl:value-of select="@*:id"/>&gt;&gt;
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
