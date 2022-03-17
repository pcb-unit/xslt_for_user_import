<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!--    <xsl:template match="/">-->
    <!--        <xsl:variable name="myVariable" select="./email_address"/>-->
    <!--        <xsl:value-of select="$myVariable"/>-->

    <!--        <xsl:apply-templates/>-->
    <!--    </xsl:template>-->


    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="email/email_types[email_type='work']">
        <xsl:variable name="myVariable" select="/user/primary_id"/>
        <xsl:value-of select="$myVariable"></xsl:value-of>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:text>BJARNE!</xsl:text>
        </xsl:copy>
        <xsl:call-template name="PROMP">
            <xsl:with-param name="myVariable" select="/user/primary_id"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="PROMP" match="user_identifiers">
        <xsl:param name="myVariable"/>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <user_identifier>
                <id_type>OTHER_ID_1</id_type>
                <value>
                    <xsl:value-of select="$myVariable"/>
                </value>
            </user_identifier>
        </xsl:copy>
    </xsl:template>


    <!--More specific template for Node766 that provides custom behavior -->
    <!--    <xsl:template match="email">-->
    <!--        <xsl:copy>-->
    <!--            <xsl:apply-templates select="@*|node()"/>-->
    <!--            &lt;!&ndash;Do something special for my node&ndash;&gt;-->
    <!--        </xsl:copy>-->
    <!--    </xsl:template>-->

//****************
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="email/email_types[email_type='work']">
        <xsl:call-template name="PROMP">
            <xsl:with-param name="myVariable" select="ancestor::email/email_address"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="PROMP" match="user_identifiers">
        <xsl:param name="myVariable"/>
        <xsl:copy>
            <user_identifier>
                <id_type>PCB</id_type>
                <value>
                    <xsl:value-of select="$myVariable"/>
                </value>
            </user_identifier>
        </xsl:copy>
    </xsl:template>


</xsl:stylesheet>

