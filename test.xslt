<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="search_email_type" match="email/email_types" use="email_type" />

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="user_identifiers">
        <xsl:copy>
            <xsl:apply-templates/>
            <xsl:choose>
                <xsl:when test="key('search_email_type', 'school')">
                    <xsl:for-each select="key('search_email_type', 'school')">
                        <user_identifier>
                            <id_type>OTHER_ID_1</id_type>
                            <value>
                                <xsl:value-of select="ancestor::email/email_address"/>
                            </value>
                        </user_identifier>
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test="key('search_email_type', 'work')">
                    <xsl:for-each select="key('search_email_type', 'work')">
                        <user_identifier>
                            <id_type>OTHER_ID_1</id_type>
                            <value>
                                <xsl:value-of select="ancestor::email/email_address"/>
                            </value>
                        </user_identifier>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>


</xsl:stylesheet>

