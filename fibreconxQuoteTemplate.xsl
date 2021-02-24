<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo" xpath-default-namespace="http://schemas.dgit.biz/telflow/cim/v3">
    <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
    <xsl:param name="versionParam" select="'1.0'"/>
    <xsl:include href="fibreconxQuoteTemplateHeader.xsl"/>
    <xsl:include href="fibreconxQuoteTemplateFooter.xsl"/>
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="onlyPage" xsl:use-attribute-sets="a4defaultPageFormat">
                    <fo:region-body region-name="xsl-region-body" margin-bottom="1cm" margin-top="7cm"/>
                    <fo:region-before region-name="xsl-region-before-first" space-after="1cm" extent="20cm"/>
                    <fo:region-after region-name="xsl-region-after-last" space-before="1cm" extent="0.3cm"/>
                </fo:simple-page-master>
                <fo:simple-page-master master-name="firstPage" xsl:use-attribute-sets="a4defaultPageFormat">
                    <fo:region-body region-name="xsl-region-body" margin-bottom="1cm" margin-top="7cm"/>
                    <fo:region-before region-name="xsl-region-before-first" extent="200mm"/>
                    <fo:region-after region-name="xsl-region-after" space-before="1cm" extent="0.3cm"/>
                </fo:simple-page-master>
                <fo:simple-page-master master-name="secondPage" xsl:use-attribute-sets="a4defaultPageFormat">
                    <fo:region-body region-name="xsl-region-body" margin-bottom="1cm" margin-top="3.5cm"/>
                    <fo:region-before region-name="xsl-region-before" extent="5in"/>
                    <fo:region-after region-name="xsl-region-after" space-before="1cm" extent="0.3cm"/>
                </fo:simple-page-master>
                <fo:simple-page-master master-name="lastPage" xsl:use-attribute-sets="a4defaultPageFormat">
                    <fo:region-body region-name="xsl-region-body" margin-bottom="1cm" margin-top="3.5cm"/>
                    <fo:region-before region-name="xsl-region-before" extent="5in"/>
                    <fo:region-after region-name="xsl-region-after-last" space-before="1cm" extent="0.3cm"/>
                </fo:simple-page-master>
                <fo:page-sequence-master master-name="telflowProduct">
                    <fo:repeatable-page-master-alternatives>
                        <fo:conditional-page-master-reference page-position="only" master-reference="onlyPage"></fo:conditional-page-master-reference>
                        <fo:conditional-page-master-reference page-position="first" master-reference="firstPage"></fo:conditional-page-master-reference>
                        <fo:conditional-page-master-reference page-position="rest" master-reference="secondPage"></fo:conditional-page-master-reference>
                        <fo:conditional-page-master-reference page-position="last" master-reference="lastPage"></fo:conditional-page-master-reference>
                    </fo:repeatable-page-master-alternatives>
                </fo:page-sequence-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="telflowProduct" initial-page-number="1" language="en">

                <fo:static-content flow-name="xsl-region-before">
                    <xsl:call-template name="headers"></xsl:call-template>
                </fo:static-content>

                <fo:static-content flow-name="xsl-region-before-first">
                    <xsl:call-template name="headersWithSummary"></xsl:call-template>
                </fo:static-content>

                <fo:static-content flow-name="xsl-region-after">
                    <xsl:call-template name="footers"></xsl:call-template>
                </fo:static-content>

                <fo:static-content flow-name="xsl-region-after-last">
                    <xsl:call-template name="footersWithSignature"></xsl:call-template>
                </fo:static-content>

                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="8pt">
                        <fo:block-container>
                            <fo:block font-size="16pt" font-weight="bold">
                                SERVICE ORDER DETAILS
                            </fo:block>
                            <fo:block font-size="8pt" space-after="0.5cm">
                                Note: All Charge are exclusive of GST.
                            </fo:block>
                        </fo:block-container>
                        <fo:table font-size="8pt" table-layout="fixed" width="100%" border-collapse="collapse" border-separation="5mm">
                            <fo:table-column column-width="10%"/>     <!-- Product -->
                            <fo:table-column column-width="14%"/>     <!-- Customer Reference -->
                            <fo:table-column column-width="22%"/>     <!-- Site -->
                            <fo:table-column column-width="8%"/>      <!-- Path -->
                            <fo:table-column column-width="4%"/>      <!-- QTY -->
                            <fo:table-column column-width="4%"/>      <!-- Contract (Monthly) -->
                            <fo:table-column column-width="6%"/>      <!-- TOTAL Once-off -->
                            <fo:table-column column-width="9%"/>      <!-- UnitOnceOff -->
                            <fo:table-column column-width="6%"/>      <!-- Total Monthly Recurring -->
                            <fo:table-column column-width="9%"/>      <!-- UnitMonthly -->
                            <fo:table-column column-width="8%"/>      <!-- TOTAL Contract Charges -->

                            <fo:table-header  background-color="#324c52" display-align="center" space-after="0mm" color="white">
                                <fo:table-row height="15mm">
                                    <fo:table-cell>
                                        <fo:block-container xsl:use-attribute-sets="horizontalTableHeader">
                                            <fo:block>Product</fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block-container xsl:use-attribute-sets="horizontalTableHeader">
                                            <fo:block>Product Order #</fo:block>
                                            <fo:block>(Customer Reference)</fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block-container xsl:use-attribute-sets="horizontalTableHeader">
                                            <fo:block>Site</fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block-container xsl:use-attribute-sets="horizontalTableHeader">
                                            <fo:block>Path</fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block-container xsl:use-attribute-sets="horizontalTableHeader">
                                            <fo:block>Qty</fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block-container xsl:use-attribute-sets="horizontalTableHeader">
                                            <fo:block>Contract (Month)</fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block-container xsl:use-attribute-sets="horizontalTableHeader">
                                            <fo:block>UNIT</fo:block>
                                            <fo:block>Once-off</fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block-container xsl:use-attribute-sets="horizontalTableHeader">
                                            <fo:block>TOTAL</fo:block>
                                            <fo:block>Once-off</fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block-container xsl:use-attribute-sets="horizontalTableHeader">
                                            <fo:block>UNIT</fo:block>
                                            <fo:block>Monthly</fo:block>
                                            <fo:block>Recurring</fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block-container xsl:use-attribute-sets="horizontalTableHeader">
                                            <fo:block>TOTAL</fo:block>
                                            <fo:block>Monthly</fo:block>
                                            <fo:block>Recurring</fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block-container xsl:use-attribute-sets="horizontalTableHeader">
                                            <fo:block>TOTAL Contract Charges</fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-header>

                            <fo:table-body text-align="center" end-indent="0in">
                                <xsl:choose>
                                    <xsl:when test="BusinessInteraction/LineItems/BusinessInteractions">
                                        <xsl:apply-templates select="BusinessInteraction/LineItems/BusinessInteractions"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="BusinessInteraction"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </fo:table-body>
                        </fo:table>

                        <fo:table font-size="8pt" border-collapse="collapse">
                            <fo:table-column column-width="54%"/>      <!-- TOTAL -->
                            <fo:table-column column-width="4%"/>      <!-- QTY -->
                            <fo:table-column column-width="4%"/>      <!-- - -->
                            <fo:table-column column-width="6%"/>      <!-- TOTAL Once-off -->
                            <fo:table-column column-width="9%"/>      <!-- - -->
                            <fo:table-column column-width="6%"/>      <!-- Total Monthly Recurring -->
                            <fo:table-column column-width="9%"/>      <!-- - -->
                            <fo:table-column column-width="8%"/>      <!-- TOTAL Contract Charges -->

                            <fo:table-body>
                                <fo:table-row display-align="center" keep-together.within-page="always" text-align="center">
                                    <fo:table-cell text-align="left" padding="1mm">
                                        <fo:block font-weight="bold"> <!-- TOTAL -->
                                            Total
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell xsl:use-attribute-sets="tableBorder"> <!-- Qty -->
                                        <fo:block>
                                            <xsl:value-of select="count(BusinessInteraction/LineItems/BusinessInteractions/BusinessInteraction)"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell xsl:use-attribute-sets="tableBorder"> <!-- - -->
                                        <fo:block></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell xsl:use-attribute-sets="tableBorder"> <!-- - -->
                                        <fo:block></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell xsl:use-attribute-sets="tableBorder"> <!-- TOO -->
                                        <fo:block>
                                            $
                                            <xsl:value-of select="format-number(sum(BusinessInteraction/LineItems/BusinessInteractions/BusinessInteraction/ContractSummary/ChargeGroups/ChargeGroup[Name='Upfront']/TotalPrice), '#,##0.00')"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell xsl:use-attribute-sets="tableBorder"> <!-- - -->
                                        <fo:block></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell xsl:use-attribute-sets="tableBorder"> <!-- TMR -->
                                        <fo:block>
                                            $
                                            <xsl:value-of select="format-number(sum(BusinessInteraction/LineItems/BusinessInteractions/BusinessInteraction/ContractSummary/ChargeGroups/ChargeGroup[Name='Monthly']/TotalPrice), '#,##0.00')"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell xsl:use-attribute-sets="tableBorder"> <!-- Total -->
                                        <fo:block>
                                            $
                                            <xsl:value-of select="format-number(sum(BusinessInteraction/LineItems/BusinessInteractions/BusinessInteraction/ContractSummary/TotalContractValue), '#,##0.00')"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                    <fo:block page-break-inside="avoid">
                        <fo:block font-size="16pt" font-weight="bold" space-after="0.2cm" space-before="1cm">
                            TERMS AND CONDITIONS
                        </fo:block>
                        <fo:block font-size="8pt" space-after="1cm">
                            <xsl:choose>
                                <xsl:when test="BusinessInteraction/NotificationProperties/NotificationProperty[Key='termsAndConditions']/Value">
                                    <xsl:value-of select="BusinessInteraction/NotificationProperties/NotificationProperty[Key='termsAndConditions']/Value"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    This Service Order, the FibreconX Master Services Agreement, and the relevant Service Schedule, read together, set out the terms of supply for the FibreconX Service.
                                </xsl:otherwise>
                            </xsl:choose>
                        </fo:block>
                        <fo:block font-size="16pt" font-weight="bold" space-after="0.2cm">
                            ORDER CONTACT DETAILS
                        </fo:block>
                        <fo:block font-size="8pt" space-after="0.2cm">
                            Order status updates will be provided to:
                        </fo:block>
                        <fo:block font-size="8pt" space-after="0.04cm">
                            <xsl:choose>
                                <xsl:when test="BusinessInteraction/BusinessInteractionInvolves/PartyInteractionRole[InteractionRoleType='NotificationOwner']/PartyRole/Party/Name">
                                    &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="BusinessInteraction/BusinessInteractionInvolves/PartyInteractionRole[InteractionRoleType='NotificationOwner']/PartyRole/Party/Name"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Order contact details not set.
                                </xsl:otherwise>
                            </xsl:choose>
                        </fo:block>
                        <fo:block font-size="8pt" space-after="0.2cm">
                            <xsl:choose>
                                <xsl:when test="BusinessInteraction/BusinessInteractionInvolves/PartyInteractionRole[InteractionRoleType='NotificationOwner']/PartyRole/ContactMediums/ContactMedium[Type='Contact']/EmailAddress">
                                    &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="BusinessInteraction/BusinessInteractionInvolves/PartyInteractionRole[InteractionRoleType='NotificationOwner']/PartyRole/ContactMediums/ContactMedium[Type='Contact']/EmailAddress"/>
                                </xsl:when>
                            </xsl:choose>
                        </fo:block>
                        <fo:block font-size="8pt" space-after="1cm">
                            Please note: Your order notification contact can be updated at any time via the FibreconX Fusion Portal at <fo:basic-link internal-destination="https://fusion.fibreconx.com.au" color="blue">https://fusion.fibreconx.com.au</fo:basic-link>
                            <!-- <fo:inline color="#3c76f2"></fo:inline>. -->
                        </fo:block>
                        <fo:block font-size="16pt" font-weight="bold" space-after="0.2cm">
                            FIBRECONX CONTACT DETAILS
                        </fo:block>
                        <fo:block font-size="8pt" space-after="0.2cm">
                            For queries relating to this Service Order, please contact
                        </fo:block>
                        <fo:block font-size="8pt" space-after="0.04cm">
                            &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sales@fibreconx.com.au
                        </fo:block>
                        <fo:block font-size="8pt" space-after="0.2cm">
                            &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;1300 064 405
                        </fo:block>
                        <fo:block font-size="8pt" space-after="0.6cm">
                            Order progress updates are available on FibreconX Fusion Portal at <fo:basic-link internal-destination="https://fusion.fibreconx.com.au" color="blue">https://fusion.fibreconx.com.au</fo:basic-link>
                        </fo:block>
                        <fo:block font-size="8pt" space-after="0.2cm">
                            The FibreconX Fusion Portal is also the source for all other information for your FibreconX interactions:
                        </fo:block>
                        <fo:block font-size="8pt" space-after="0.02cm">
                            &#160;&#160;&#160;&#160;- Service qualification, quoting &#38; ordering
                        </fo:block>
                        <fo:block font-size="8pt" space-after="0.02cm">
                            &#160;&#160;&#160;&#160;- Invoicing &#38; payments
                        </fo:block>
                        <fo:block font-size="8pt" space-after="0.02cm">
                            &#160;&#160;&#160;&#160;- Documentation &#38; reporting
                        </fo:block>
                        <fo:block font-size="8pt" space-after="0.02cm">
                            &#160;&#160;&#160;&#160;- Network status
                        </fo:block>
                        <fo:block font-size="8pt" space-after="0.02cm">
                            &#160;&#160;&#160;&#160;- Raising &#38; managing service incidents
                        </fo:block>
                        <fo:block font-size="8pt" space-after="0.02cm">
                            &#160;&#160;&#160;&#160;- Portal administration can also manage all portal user accounts
                        </fo:block>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="BusinessInteraction/LineItems/BusinessInteractions/BusinessInteraction">
        <xsl:call-template name="tableRows"></xsl:call-template>
    </xsl:template>

    <xsl:template match="BusinessInteraction">
        <xsl:call-template name="tableRows"></xsl:call-template>
    </xsl:template>

    <xsl:template match="BusinessInteractionComprisedOf//BusinessInteractionItem/ItemInvolvesLocations/PlaceInteractionRole/Place">
        <fo:table-row keep-together.within-column="always" xsl:use-attribute-sets="tableRowHeight">
            <fo:table-cell xsl:use-attribute-sets="childTableBorder">
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="Name">
                            <xsl:value-of select="Name"/>&#160;
                        </xsl:when>
                    </xsl:choose>
                </fo:block>
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="RoadNumber1">
                            <xsl:value-of select="RoadNumber1"/>&#160;
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="RoadName">
                            <xsl:value-of select="RoadName"/>&#160;
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="RoadTypeCode">
                            <xsl:value-of select="RoadTypeCode"/>&#160;
                        </xsl:when>
                    </xsl:choose>
                </fo:block>
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="DescribedBy/CharacteristicValue[Characteristic/ID='suburb']/Value">
                            <xsl:value-of select="DescribedBy/CharacteristicValue[Characteristic/ID='suburb']/Value"/>&#160;
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="DescribedBy/CharacteristicValue[Characteristic/ID='city']/Value">
                            <xsl:value-of select="DescribedBy/CharacteristicValue[Characteristic/ID='city']/Value"/>&#160;
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="DescribedBy/CharacteristicValue[Characteristic/ID='state']/Value">
                            <xsl:value-of select="DescribedBy/CharacteristicValue[Characteristic/ID='state']/Value"/>&#160;
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="Postcode">
                            <xsl:value-of select="Postcode"/>&#160;
                        </xsl:when>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="ContractSummary">
        <xsl:value-of select="ChargeGroups[Name='Upfront']/TotalPrice"/>
    </xsl:template>

    <xsl:template name="tableRows">
        <fo:table-row text-align="center" display-align="center" keep-together.within-page="always" xsl:use-attribute-sets="tableRowHeight" border-bottom="solid 0.2mm #324c52">
            <fo:table-cell xsl:use-attribute-sets="tableBorder" text-align="left"> <!-- Product -->
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="OfferingName">
                            <xsl:value-of select="OfferingName"/>
                        </xsl:when>
                        <xsl:otherwise>
                            _
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="tableBorder" text-align="left"> <!-- PO# (Cutomer Reference) -->
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="ID">
                            <xsl:value-of select="ID"/>
                        </xsl:when>
                        <xsl:otherwise>
                            _
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="CustomerReference">
                            (<xsl:value-of select="CustomerReference"/>)
                        </xsl:when>
                        <xsl:otherwise>
                            _
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="siteTableBorder" text-align="left"> <!-- Site -->
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="BusinessInteractionComprisedOf//BusinessInteractionItem/ItemInvolvesLocations/PlaceInteractionRole/Place">
                            <fo:table>
                                <fo:table-column column-width="100%"/>
                                <fo:table-body>
                                    <xsl:apply-templates select="BusinessInteractionComprisedOf//BusinessInteractionItem/ItemInvolvesLocations/PlaceInteractionRole/Place"/>
                                </fo:table-body>
                            </fo:table>
                        </xsl:when>
                        <xsl:otherwise>
                            –
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="tableBorder"> <!-- Path -->
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="DescribedBy/CharacteristicValue[Characteristic/ID='pathSelected']/CharacteristicValueReferences/CharacteristicValue[Characteristic/ID='pathType']/Value">
                            <xsl:value-of select="DescribedBy/CharacteristicValue[Characteristic/ID='pathSelected']/CharacteristicValueReferences/CharacteristicValue[Characteristic/ID='pathType']/Value"/>
                        </xsl:when>
                        <xsl:otherwise>
                            _
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="tableBorder" text-align="center"> <!-- Qty -->
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="BusinessInteractionComprisedOf/BusinessInteractionItem/Quantity">
                            <xsl:value-of select="BusinessInteractionComprisedOf/BusinessInteractionItem/Quantity"/>
                        </xsl:when>
                        <xsl:otherwise>
                            _
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="tableBorder"> <!-- Contract (Monthly)-->
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="ContractSummary/ContractTerm/Term">
                            <xsl:value-of select="ContractSummary/ContractTerm/Term"/>
                        </xsl:when>
                        <xsl:otherwise>
                            -
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="tableBorder"> <!-- UNIT Once-off-->
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="ContractSummary/ChargeGroups/ChargeGroup[Name='Upfront']/TotalPrice and BusinessInteractionComprisedOf/BusinessInteractionItem/Quantity">
                            $
                            <xsl:value-of select="format-number(ContractSummary/ChargeGroups/ChargeGroup[Name='Upfront']/TotalPrice div BusinessInteractionComprisedOf/BusinessInteractionItem/Quantity, '#,##0.00')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            -
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="tableBorder"> <!-- TOTAL Once-off-->
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="ContractSummary/ChargeGroups/ChargeGroup[Name='Upfront']/TotalPrice">
                            $
                            <xsl:value-of select="format-number(ContractSummary/ChargeGroups/ChargeGroup[Name='Upfront']/TotalPrice, '#,##0.00')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            -
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="tableBorder"> <!-- UNIT Monthly -->
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="ContractSummary/ChargeGroups/ChargeGroup[Name='Monthly']/TotalPrice and BusinessInteractionComprisedOf/BusinessInteractionItem/Quantity">
                            $
                            <xsl:value-of select="format-number(ContractSummary/ChargeGroups/ChargeGroup[Name='Monthly']/TotalPrice div BusinessInteractionComprisedOf/BusinessInteractionItem/Quantity, '#,##0.00')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            -
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="tableBorder"> <!-- Total Monthly Recurring -->
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="ContractSummary/ChargeGroups/ChargeGroup[Name='Monthly']/TotalPrice">
                            $
                            <xsl:value-of select="format-number(ContractSummary/ChargeGroups/ChargeGroup[Name='Monthly']/TotalPrice, '#,##0.00')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            –
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="tableBorder"  text-align="center"> <!-- TOTAL Contract Charges -->
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="ContractSummary/TotalContractValue">
                            $
                            <xsl:value-of select="format-number(ContractSummary/TotalContractValue, '#,##0.00')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            –
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>

        </fo:table-row>
    </xsl:template>

    <xsl:variable name="currency">
        $
    </xsl:variable>

    <xsl:attribute-set name="a4defaultPageFormat">
        <xsl:attribute name="page-height">210mm</xsl:attribute>
        <xsl:attribute name="page-width">297mm</xsl:attribute>
        <xsl:attribute name="margin-top">0.5cm</xsl:attribute>
        <xsl:attribute name="margin-bottom">0.5cm</xsl:attribute>
        <xsl:attribute name="margin-left">0.5cm</xsl:attribute>
        <xsl:attribute name="margin-right">0.5cm</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="tableBorder">
        <xsl:attribute name="border">transparent</xsl:attribute>
        <xsl:attribute name="padding">2mm</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="tableRowHeight">
        <xsl:attribute name="height">1cm</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="siteTableBorder">
        <xsl:attribute name="border">transparent</xsl:attribute>
        <xsl:attribute name="height">100&#37;</xsl:attribute>
        <!-- <xsl:attribute name="border-bottom-style">none</xsl:attribute>
        <xsl:attribute name="border-top-style">solid</xsl:attribute>
        <xsl:attribute name="border-left-style">solid</xsl:attribute>
        <xsl:attribute name="border-right-style">solid</xsl:attribute> -->
    </xsl:attribute-set>
    <xsl:attribute-set name="childTableBorder">
        <xsl:attribute name="border">transparent</xsl:attribute>
        <xsl:attribute name="height">100&#37;</xsl:attribute>
        <xsl:attribute name="padding">2mm</xsl:attribute>
        <!-- <xsl:attribute name="border-bottom-style">none</xsl:attribute>
        <xsl:attribute name="border-top-style">solid</xsl:attribute>
        <xsl:attribute name="border-left-style">hidden</xsl:attribute>
        <xsl:attribute name="border-right-style">hidden</xsl:attribute> -->
    </xsl:attribute-set>
    <xsl:attribute-set name="transparentWithPadding">
        <xsl:attribute name="border">transparent</xsl:attribute>
        <xsl:attribute name="padding">0.7mm</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="transparentBorder">
        <xsl:attribute name="border">transparent</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="tableBorderTop">
        <xsl:attribute name="border">transparent</xsl:attribute>
        <xsl:attribute name="padding">0.7mm</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="logo">
        <xsl:attribute name="src">Fibreconx_Logo_Primary.png</xsl:attribute>
        <xsl:attribute name="content-height">scale-to-fit</xsl:attribute>
        <xsl:attribute name="width">50mm</xsl:attribute>
        <!-- <xsl:attribute name="height">1in</xsl:attribute> -->
    </xsl:attribute-set>
    <xsl:attribute-set name="horizontalTableHeader">
        <xsl:attribute name="padding">1mm</xsl:attribute>
        <xsl:attribute name="reference-orientation">0</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="start-indent">1mm</xsl:attribute>
        <xsl:attribute name="end-indent">1mm</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="verticalTableHeader">
        <xsl:attribute name="padding">2mm</xsl:attribute>
        <xsl:attribute name="reference-orientation">90</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="width">18mm</xsl:attribute>
        <xsl:attribute name="display-align">center</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="signatureAttributes">
        <xsl:attribute name="border-top-width">2pt</xsl:attribute>
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-bottom-color">black</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="space-before">0mm</xsl:attribute>
        <xsl:attribute name="margin-left">5mm</xsl:attribute>
        <xsl:attribute name="margin-right">5mm</xsl:attribute>
    </xsl:attribute-set>
</xsl:stylesheet>