<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo" xpath-default-namespace="http://schemas.dgit.biz/telflow/cim/v3">
    <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
    <xsl:param name="headerVersionParam" select="'1.0'"/>
    <xsl:template name="headers">
        <fo:block-container width="290mm" height="210mm" left="65mm" right="0mm" position="absolute" >
            <fo:block>
                <xsl:choose>
                    <xsl:when test="(BusinessInteraction/InteractionStatus/Type = 'Draft') or (//NotificationProperties/NotificationProperty[Key='BiHasExecption']/Value = 'true')">
                        <fo:external-graphic>
                            <xsl:attribute name="src">etc/notify/templates/telflow/images/draft.png</xsl:attribute>
                            <xsl:attribute name="height">105mm</xsl:attribute>
                            <xsl:attribute name="content-width">145mm</xsl:attribute>
                            <xsl:attribute name="scaling">uniform</xsl:attribute>
                        </fo:external-graphic>
                    </xsl:when>
                    <xsl:otherwise/>
                </xsl:choose>
            </fo:block>
        </fo:block-container>
        <fo:block font-size="7pt" space-before="0mm" space-after="0mm">
            <fo:table table-layout="fixed" width="100%" border-collapse="collapse" color="#000000">
                <fo:table-column column-width="20%"/>
                <fo:table-column column-width="60%"/>
                <fo:table-column column-width="20%"/>
                <fo:table-body>
                    <fo:table-row display-align="center">
                        <fo:table-cell xsl:use-attribute-sets="tableBorderTop">
                            <fo:block font-weight="bold" font-size="20" color="#324c52">
                                QUOTE
                            </fo:block>
                            <fo:block font-size="12pt" font-weight="bold" text-align="left">
                                <fo:inline color="#737477">
                                    <xsl:choose>
                                        <xsl:when test="BusinessInteraction/ContractSummary/Version">
                                            Version <xsl:value-of select="BusinessInteraction/ContractSummary/Version"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            –
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </fo:inline>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell xsl:use-attribute-sets="tableBorderTop">
                            <fo:block font-size="8pt" text-align="center"><fo:inline color="#000000">FibreconX Pty Ltd (ABN) 82 637 460 425</fo:inline></fo:block>
                        </fo:table-cell>
                        <fo:table-cell xsl:use-attribute-sets="tableBorderTop">
                            <fo:block font-size="14pt" font-weight="bold" text-align="right">
                                <fo:external-graphic xsl:use-attribute-sets="logo"></fo:external-graphic>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
            <fo:block>
                <fo:leader leader-length="100%" leader-pattern="rule" rule-thickness="2pt" color="#afe2e3"/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template name="headersWithSummary">
        <xsl:call-template name="headers"></xsl:call-template>

        <fo:block font-size="8pt"  space-after="4mm">
            <fo:table table-layout="fixed" width="100%" border-collapse="collapse" color="transparent" border-separation="4pt">
                <fo:table-column column-width="50%"/>
                <fo:table-column column-width="50%"/>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell xsl:use-attribute-sets="tableBorderTop">
                            <fo:block/>
                        </fo:table-cell>
                        <fo:table-cell xsl:use-attribute-sets="tableBorderTop">
                            <fo:block text-align="right" font-size="16pt" font-weight="bold" font-family="Montserrat Light">
                                SERVICE ORDER
                                <xsl:choose>
                                    <xsl:when test="BusinessInteraction/ID">
                                        <xsl:value-of select="BusinessInteraction/ID"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        -
                                    </xsl:otherwise>
                                </xsl:choose>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell xsl:use-attribute-sets="tableBorderTop">
                            <fo:block font-weight="bold" space-after="0.1cm">
                                <xsl:choose>
                                    <xsl:when test="BusinessInteraction/BusinessInteractionInvolves/PartyInteractionRole[InteractionRoleType='CommerciallyResponsible']/PartyRole/Party/OrganisationName">
                                        <xsl:value-of select="BusinessInteraction/BusinessInteractionInvolves/PartyInteractionRole[InteractionRoleType='CommerciallyResponsible']/PartyRole/Party/OrganisationName"/>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                            </fo:block>
                            <fo:block space-after="0.2cm">
                                ABN
                                <xsl:choose>
                                    <xsl:when test="/BusinessInteraction/BusinessInteractionInvolves/PartyInteractionRole[InteractionRoleType='CommerciallyResponsible']/PartyRole/Party/BusinessNumber">
                                        <xsl:value-of select="/BusinessInteraction/BusinessInteractionInvolves/PartyInteractionRole[InteractionRoleType='CommerciallyResponsible']/PartyRole/Party/BusinessNumber"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        -
                                    </xsl:otherwise>
                                </xsl:choose>
                            </fo:block>
                            <fo:block>
                                <xsl:choose>
                                    <xsl:when test="BusinessInteraction/NotificationProperties/NotificationProperty[Key='commerciallyResponsibleFormattedAddressLine1']/Value">
                                        <xsl:value-of select="BusinessInteraction/NotificationProperties/NotificationProperty[Key='commerciallyResponsibleFormattedAddressLine1']/Value"/>
                                    </xsl:when>
                                </xsl:choose>
                            </fo:block>
                            <fo:block>
                                <xsl:choose>
                                    <xsl:when test="BusinessInteraction/NotificationProperties/NotificationProperty[Key='commerciallyResponsibleFormattedAddressLine2']/Value">
                                        <xsl:value-of select="BusinessInteraction/NotificationProperties/NotificationProperty[Key='commerciallyResponsibleFormattedAddressLine2']/Value"/>
                                    </xsl:when>
                                </xsl:choose>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell xsl:use-attribute-sets="tableBorderTop">
                            <fo:block>
                                <fo:table table-layout="fixed" width="100%" border-collapse="collapse" color="transparent">
                                    <fo:table-column column-width="50%"/>
                                    <fo:table-column column-width="25%"/>
                                    <fo:table-column column-width="25%"/>
                                    <fo:table-body>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block/>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block text-align="left">
                                                    Account Number
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block text-align="right">
                                                    <xsl:choose>
                                                        <xsl:when test="BusinessInteraction/BusinessInteractionInvolves/PartyInteractionRole[InteractionRoleType='CommerciallyResponsible']/PartyRole/BillingAccountID">
                                                            <xsl:value-of select="BusinessInteraction/BusinessInteractionInvolves/PartyInteractionRole[InteractionRoleType='CommerciallyResponsible']/PartyRole/BillingAccountID"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            -
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block/>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block text-align="left">
                                                    Quote Number
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block text-align="right">
                                                    <xsl:choose>
                                                        <xsl:when test="BusinessInteraction/ID">
                                                            <xsl:value-of select="BusinessInteraction/ID"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            -
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block/>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block text-align="left">
                                                    Customer Order Ref
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block text-align="right">
                                                    <xsl:choose>
                                                        <xsl:when test="BusinessInteraction/CustomerReference">
                                                            <xsl:value-of select="BusinessInteraction/CustomerReference"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            -
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block/>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block text-align="left">
                                                    Quote Expiry
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block text-align="right">
                                                    <xsl:value-of select="format-dateTime(BusinessInteraction/ContractSummary/ExpiryDate, '[D1] [MNn] [Y0001]')"/>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block/>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block text-align="left">
                                                    Currency
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block text-align="right">
                                                    AUD
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </fo:table-body>
                                </fo:table>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
        <fo:block font-size="8pt">
            Terms and conditions for this Service Order are outlined in the associated Master Service Agreement and Service Schedule (or equivalent). By Submitting this order through the FibreconX portal (or API), or providing written approval to progress with this Sales Order to a FibreconX representative, you agree to terms and condition in this Service Order.
        </fo:block>
    </xsl:template>
</xsl:stylesheet>