<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="user_identifiers">
        <xsl:copy>
            <xsl:apply-templates/>
            <xsl:choose>
                <xsl:when test="../contact_info/emails/email[contains(email_types/email_type, 'school')]">
                    <user_identifier>
                        <id_type>OTHER_ID_1</id_type>
                        <value>
                            <xsl:value-of
                                    select="../contact_info/emails/email[contains(email_types/email_type, 'school')]/email_address "/>
                        </value>
                    </user_identifier>
                </xsl:when>
                <xsl:when test="../contact_info/emails/email[contains(email_types/email_type, 'work')]">
                    <user_identifier>
                        <id_type>OTHER_ID_1</id_type>
                        <value>

                            <xsl:value-of
                                    select="../contact_info/emails/email[contains(email_types/email_type, 'work')]/email_address "/>
                        </value>
                    </user_identifier>
                </xsl:when>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>

