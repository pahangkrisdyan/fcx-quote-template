<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo" xpath-default-namespace="http://schemas.dgit.biz/telflow/cim/v3" >
    <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
    <xsl:param name="footerVersionParam" select="'1.0'"/>
    <xsl:template name="footers">
        <fo:table >
            <fo:table-column column-width="50%"/>
            <fo:table-column column-width="50%"/>      <!-- Page -->
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block font-size="5pt">
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block font-size="5pt" text-align="end">Page <fo:page-number/> of <fo:page-number-citation ref-id="tableFlow"/></fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <xsl:template name="footersWithSignature">
        <fo:block id="tableFlow">
        </fo:block>
        <xsl:call-template name="footers"></xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
