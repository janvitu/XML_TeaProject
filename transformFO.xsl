<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="xs" version="2.0" xpath-default-namespace="urn:x-vitj07:schemas:tea:1.0">

    <xsl:template match="/">
        <fo:root>
            <!-- Definice layoutu stránky -->
            <fo:layout-master-set>
                <!-- Rozměry stránky a její okraje -->
                <fo:simple-page-master master-name="page" page-width="210mm" margin="1in">
                    <!-- Tiskové zrcadlo - oblast pro samotný obsah stránky -->
                    <fo:region-body margin-bottom="15mm" margin-top="15mm" />
                    <!-- Oblast pro patu stránky -->
                    <fo:region-before extent="20mm" />
                    <fo:region-after extent="10mm" />
                </fo:simple-page-master>
            </fo:layout-master-set>

            <!-- Definice obsahu stránky -->
            <fo:page-sequence master-reference="page">
                <!-- Společný obsah všech stránek v patě stránky -->
                <fo:static-content flow-name="xsl-region-before" color="grey" font-size="10pt">
                    <fo:block text-align-last="right" text-decoration="underline">
                        <fo:basic-link internal-destination="start">Seznam Caju</fo:basic-link>
                    </fo:block>
                </fo:static-content>

                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center" color="grey" font-size="9pt">
                        <xsl:text>Strana </xsl:text>
                        <fo:page-number />
                    </fo:block>
                </fo:static-content>
                <!-- Samotný text dokumentu -->
                <fo:flow flow-name="xsl-region-body">
                    <!-- Zpracování všech elementů zdrojového dokumentu -->
                    <xsl:apply-templates mode="list" />
                    <xsl:apply-templates mode="content" />
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="/caje" mode="list">
        <fo:block id="start" text-align="center" font-size="10mm" font-weight="bold" margin-bottom="15mm">Prehled caju</fo:block>
        <fo:table border="solid" margin-bottom="1cm">
            <fo:table-header>
                <fo:table-row border-bottom="solid">
                    <fo:table-cell>
                        <fo:block text-align="center" font-weight="bold" padding="3mm">Nazev Caje</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="center" font-weight="bold" padding="3mm">Cesky nazev caje</fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                <xsl:for-each select="./caj">
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block padding="3mm" text-align="center" text-decoration="underline">
                                <fo:basic-link internal-destination="{generate-id(@nazev)}">
                                    <xsl:value-of select="@nazev" />
                                </fo:basic-link>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block padding="3mm" text-align="center">
                                <xsl:value-of select="@ceskyNazev" />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </xsl:for-each>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <xsl:template match="/caje/caj" mode="content">
        <fo:block id="{generate-id(@nazev)}" padding="3mm" border-style="solid" border-color="Gainsboro">
            <fo:table>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                                Nazev:
                                <xsl:value-of select="@nazev" />
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block>
                                Cesky název:
                                <xsl:value-of select="@ceskyNazev" />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                                Zeme puvodu:
                                <xsl:value-of select="./puvod/zeme" />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                                Oblast puvodu:
                                <xsl:value-of select="./puvod/oblast" />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block font-weight="bold">
                                <fo:block>Pestovani</fo:block>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <xsl:if test="./pestovani/nadmorskaVyska != ''">
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>
                                    Nadmorská vyska:
                                    <xsl:value-of select="./pestovani/nadmorskaVyska" />
                                    mnm
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </xsl:if>
                    <xsl:if test="./pestovani/strom/druh != ''">
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>
                                    Druh stromu:
                                    <xsl:value-of select="./pestovani/strom/druh" />
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </xsl:if>
                    <xsl:if test="./pestovani/strom/vek != ''">
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block>
                                    Vek stromu:
                                    <xsl:value-of select="./pestovani/strom/vek" />
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </xsl:if>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block font-weight="bold">
                                Vyroba
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                                Sklizen:
                                <xsl:value-of select="./vyroba/sklizen" />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                                Fermentace:
                                <xsl:value-of select="./vyroba/fermentace" />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                                Oxidace:
                                <xsl:value-of select="./vyroba/oxidace" />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block font-weight="bold">
                                Priprava                 
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                                Mnozstvi caje:
                                <xsl:value-of select="./priprava/mnozstvi" />
                                <xsl:value-of select="./priprava/mnozstvi/@jednotky" />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                                Mnozstvi vody:
                                <xsl:value-of select="./priprava/voda/mnozstvi" />
                                <xsl:value-of select="./priprava/voda/mnozstvi/@jednotky" />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                                Teplota vody:
                                <xsl:value-of select="./priprava/voda/teplota" />
                                <xsl:value-of select="./priprava/voda/teplota/@jednotky" />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>Nalevy:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <xsl:for-each select="./priprava/cas/nalev">
                                <fo:block>
                                    <xsl:if test="count(../nalev) = 1">
                                        vsechny nalevy
                                        <xsl:value-of select="." />
                                        <xsl:value-of select="../@jednotky" />
                                        .
                                    </xsl:if>
                                    <xsl:if test="count(../nalev) > 1">
                                        <xsl:if test="position() = last()">
                                            dalsi nalevy
                                            <xsl:value-of select="." />
                                            <xsl:value-of select="../@jednotky" />
                                            .
                                        </xsl:if>
                                        <xsl:if test="position() != last()">
                                            <xsl:value-of select="@poradi" />
                                            . nalev
                                            <xsl:value-of select="." />
                                            <xsl:value-of select="../@jednotky" />
                                            ,
                                        </xsl:if>
                                    </xsl:if>
                                </fo:block>
                            </xsl:for-each>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>Nadobi:</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                                Material:
                                <xsl:value-of select="./priprava/druhNadobi/material" />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>Kalisek</fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block>Konvicka</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                                Objem:
                                <xsl:value-of select="./priprava/druhNadobi/kalisek/objem" />
                                <xsl:value-of select="./priprava/druhNadobi/kalisek/objem/@jednotky" />
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block>
                                Objem:
                                <xsl:value-of select="./priprava/druhNadobi/konvicka/objem" />
                                <xsl:value-of select="./priprava/druhNadobi/konvicka/objem/@jednotky" />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                                Prumer:
                                <xsl:value-of select="./priprava/druhNadobi/kalisek/prumer" />
                                <xsl:value-of select="./priprava/druhNadobi/kalisek/prumer/@jednotky" />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                                Hloubka:
                                <xsl:value-of select="./priprava/druhNadobi/kalisek/hloubka" />
                                <xsl:value-of select="./priprava/druhNadobi/kalisek/hloubka/@jednotky" />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>
</xsl:stylesheet>