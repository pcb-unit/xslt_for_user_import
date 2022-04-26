<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
    <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyzàáâãäåæçèéêëìíîïðñòóôõöøùúûüýþÿžšœ'"/>
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞŸŽŠŒ'"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="user_identifiers">
        <xsl:copy>
            <xsl:apply-templates/>
            <xsl:variable name="emailSchool"
                          select="../contact_info/emails/email[contains(translate(email_types/email_type, $uppercase, $lowercase), 'school')]/email_address"/>
            <xsl:variable name="emailWork"
                          select="../contact_info/emails/email[contains(translate(email_types/email_type, $uppercase, $lowercase), 'work')]/email_address"/>
            <xsl:choose>
                <xsl:when
                        test="(count(user_identifier[value/text() = $emailSchool]) = 0) and (count(user_identifier[value/text() = $emailWork]) = 0)">
                    <xsl:choose>
                        <xsl:when
                                test="../contact_info/emails/email[contains(translate(email_types/email_type, $uppercase, $lowercase), 'school')]">
                            <user_identifier>
                                <id_type>OTHER_ID_1</id_type>
                                <value>
                                    <xsl:value-of
                                            select="../contact_info/emails/email[contains(translate(email_types/email_type, $uppercase, $lowercase), 'school')]/email_address "/>
                                </value>
                            </user_identifier>
                        </xsl:when>
                        <xsl:when
                                test="../contact_info/emails/email[contains(translate(email_types/email_type, $uppercase, $lowercase), 'work')]">
                            <user_identifier>
                                <id_type>OTHER_ID_1</id_type>
                                <value>
                                    <xsl:value-of
                                            select="../contact_info/emails/email[contains(translate(email_types/email_type, $uppercase, $lowercase), 'work')]/email_address "/>
                                </value>
                            </user_identifier>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>

