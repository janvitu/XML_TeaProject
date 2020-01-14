<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" xpath-default-namespace="urn:x-vitj07:schemas:tea:1.0">

    <xsl:output name="html" version="5" encoding="UTF-8" />
    <xsl:variable name="imgFolder" select="'Web/img/'" />
    <xsl:template match="/">
        <xsl:result-document href="Web/HTML/index.html" format="html">
            <html>
                <head>
                    <link rel="stylesheet" type="text/css" href="../CSS/style.css" />
                    <title>Tea Selection</title>
                </head>
                <body>
                    <div class="heading">
                        <h1>Tea Collection</h1>
                    </div>
                    <div class="container">
                        <xsl:apply-templates />
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="caj">
        <h1>
            <xsl:value-of select="@nazev" />
        </h1>
    </xsl:template>

    <xsl:template match="caje/caj">
        <xsl:variable name="imgName" select="@nazevIMG" />
        <div class="card">
            <xsl:if test="typ='matcha'">
                <div class="face face1 matcha">
                    <div class="content">
                        <img src="../img/matcha.png" />
                        <h3>
                            <xsl:value-of select="@nazev" />
                        </h3>
                    </div>
                </div>
            </xsl:if>
            <xsl:if test="typ='sekany'">
                <div class="face face1 sekany">
                    <div class="content">
                        <img src="../img/sekany.png" />
                        <h3>
                            <xsl:value-of select="@nazev" />
                        </h3>
                    </div>
                </div>
            </xsl:if>
            <xsl:if test="typ='celolisty'">
                <div class="face face1 celolisty">
                    <div class="content">
                        <img src="../img/celolisty.png" />
                        <h3>
                            <xsl:value-of select="@nazev" />
                        </h3>
                    </div>
                </div>
            </xsl:if>

            <div class="face face2">
                <div class="content">
                    <p>
                        <xsl:value-of select="popis" />
                    </p>
                    <a href="{generate-id(.)}.html">Read more</a>
                </div>
            </div>
        </div>

        <xsl:result-document href="Web/HTML/{generate-id(.)}.html" format="html">
            <html>
                <head>
                    <link rel="stylesheet" type="text/css" href="../CSS/teaStyle.css" />
                    <title>
                        <xsl:value-of select="@nazev" />
                    </title>
                </head>
                <body>
                    <div class="topWithIMG">
                        <img src="../img/teas/{$imgName}" />
                        <section class="teaTop">
                            <h1>
                                <xsl:value-of select="@nazev" />
                            </h1>
                            <xsl:if test="@ceskyNazev!=''">
                                <h2>
                                    <xsl:value-of select="@ceskyNazev" />
                                </h2>
                            </xsl:if>
                        </section>
                    </div>


                    <section class="teaCenter">
                        <div class="container">
                            <div class="genInfo">
                                <div class="topRow">
                                    <h3>
                                        Typ:
                                        <xsl:value-of select="typ" />
                                    </h3>
                                    <h3>
                                        Druh:
                                        <xsl:value-of select="druh" />
                                    </h3>
                                </div>
                                <div class="origin">
                                    <h3>Původ</h3>
                                    <ul>
                                        <li>
                                            Země původu:
                                            <xsl:value-of select="puvod/zeme" />
                                        </li>
                                        <li>
                                            Oblast původu:
                                            <xsl:value-of select="puvod/oblast" />
                                        </li>
                                    </ul>
                                </div>
                                <div class="growth">
                                    <h3>Pěstování</h3>
                                    <ul>
                                        <li>
                                            <xsl:if test="pestovani/nadmorskaVyska != ''">
                                                Nadmořská výška:
                                                <xsl:value-of select="pestovani/nadmorskaVyska" />
                                                nm
                                            </xsl:if>
                                        </li>
                                    </ul>
                                    <div class="growth tree">
                                        <p>Strom</p>
                                        <ul>
                                            <li>
                                                Druh stromu:
                                                <xsl:if test="pestovani/strom/druhStromu != ''">
                                                    <xsl:value-of select="pestovani/strom/druhStromu" />
                                                </xsl:if>
                                            </li>
                                            <li>
                                                Věk stromu:
                                                <xsl:if test="pestovani/strom/vek != ''">
                                                    <xsl:value-of select="pestovani/strom/vek" />
                                                </xsl:if>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="production">
                                    <h3>Výroba</h3>
                                    <ul>
                                        <li>
                                            Sklizeň:
                                            <xsl:if test="vyroba/sklizen != ''">
                                                <xsl:value-of select="vyroba/sklizen" />
                                            </xsl:if>
                                        </li>
                                        <li>
                                            Fermentace:
                                            <xsl:if test="vyroba/fermentace != ''">
                                                <xsl:value-of select="vyroba/fermentace" />
                                            </xsl:if>
                                        </li>
                                        <li>
                                            Oxidace:
                                            <xsl:if test="vyroba/oxidace != ''">
                                                <xsl:value-of select="vyroba/oxidace" />
                                            </xsl:if>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="prep">
                                <h3>Příprava Čaje</h3>
                                <ul>
                                    <li>
                                        Množství:
                                        <xsl:value-of select="priprava/mnozstvi" />
                                        <xsl:value-of select="priprava/mnozstvi/@jednotky" />
                                    </li>
                                </ul>
                                <h3>Voda</h3>
                                <ul>
                                    <li>
                                        Množství:
                                        <xsl:value-of select="priprava/voda/mnozstvi" />
                                        <xsl:value-of select="priprava/voda/mnozstvi/@jednotky" />
                                    </li>
                                    <li>
                                        Teplota:
                                        <xsl:value-of select="priprava/voda/teplota" />
                                        <xsl:value-of select="priprava/voda/teplota/@jednotky" />
                                    </li>
                                </ul>
                                <h3>Nalevy</h3>

                                <ul>
                                    <xsl:for-each select="./priprava/cas/nalev">
                                        <li>
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
                                        </li>

                                    </xsl:for-each>
                                </ul>
                                <h3>Nádobí</h3>
                                <ul>
                                    <li>
                                        Materiál:
                                        <xsl:value-of select="priprava/druhNadobi/material" />
                                    </li>
                                    <li>
                                        Kalíšek
                                        <ul>
                                            <li>
                                                Průměr:
                                                <xsl:value-of select="priprava/druhNadobi/kalisek/prumer" />
                                                <xsl:value-of select="priprava/druhNadobi/kalisek/prumer/@jednotky" />
                                            </li>
                                            <li>
                                                Hloubka:
                                                <xsl:value-of select="priprava/druhNadobi/kalisek/hloubka" />
                                                <xsl:value-of select="priprava/druhNadobi/kalisek/hloubka/@jednotky" />
                                            </li>
                                            <li>
                                                Objem:
                                                <xsl:value-of select="priprava/druhNadobi/kalisek/objem" />
                                                <xsl:value-of select="priprava/druhNadobi/kalisek/objem/@jednotky" />
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        Konvička
                                        <ul>
                                            <li>
                                                Objem:
                                                <xsl:value-of select="priprava/druhNadobi/konvicka/objem" />
                                                <xsl:value-of select="priprava/druhNadobi/konvicka/objem/@jednotky" />
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </section>
                    <div class="btnBox">
                        <a href="index.html">
                            <div class="btn-one">
                                <span>VRÁTIT SE</span>
                            </div>
                        </a>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>