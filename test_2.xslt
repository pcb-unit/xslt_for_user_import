<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:output normalization-form="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>


    <xsl:template match="user/contact_info/emails/email[contains(email_types/email_type, 'school')]">
        <xsl:variable name="skole-epost" select="email_address"/>
        <xxx>
            <xsl:value-of select="$skole"/>
            <xsl:call-template name="per">
                <xsl:with-param name="myParam" select="email_address"/>
            </xsl:call-template>
        </xxx>
    </xsl:template>

    <xsl:template name="per">
        <xsl:param name="myParam"/>

        <xsl:copy>
            <xsl:apply-templates/>
            <user_identifier>
                <id_type>PCB</id_type>
                <value>
                    <xsl:value-of select="$myParam"/>
                </value>
            </user_identifier>
        </xsl:copy>

    </xsl:template>


</xsl:stylesheet>

