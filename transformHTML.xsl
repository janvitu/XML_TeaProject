<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    >
    
    <xsl:output name="html" version="5" encoding="UTF-8"/>
    <xsl:variable name="imgFolder" select="'Web/img/'"/>
    <xsl:template match="/">
        <xsl:result-document href="Web/HTML/index.html" format="html">
            <html>
                <head>
                    <link rel="stylesheet" type="text/css" href="../CSS/style.css"/>
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
        <h1><xsl:value-of select="@nazev"/></h1>
    </xsl:template>
<!--    
    <div class="card">
        <div class="face face1">
            <div class="content">
                
                <img src="img/sketch.png">
                    <h3>Design</h3>
            </div>
        </div>
        <div class="face face2">
            <div class="content">
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Perspiciatis, autem.</p>
                <a href="#">Read more</a>
            </div>
        </div>
    </div>
-->
    <xsl:template match="caje/caj">  
        <div class="card">
            <xsl:if test="typ='matcha'">
                <div class="face face1 matcha">
                    <div class="content">
                        <img src="../img/matcha.png"/>
                        <h3>
                            <xsl:value-of select="@nazev"/>
                        </h3>
                    </div>
                </div>
            </xsl:if>
            <xsl:if test="typ='sekany'">
                <div class="face face1 sekany">
                    <div class="content">
                        <img src="../img/sekany.png"/>
                        <h3>
                            <xsl:value-of select="@nazev"/>
                        </h3>
                    </div>
                </div>
            </xsl:if>
            <xsl:if test="typ='celolisty'">
                <div class="face face1 celolisty">
                    <div class="content">
                        <img src="../img/celolisty.png"/>
                        <h3>
                            <xsl:value-of select="@nazev"/>
                        </h3>
                    </div>
                </div>
            </xsl:if>
            
            <div class="face face2">
                <div class="content">
                    <p><xsl:value-of select="popis"/></p>
                    <a href="{generate-id(.)}.html">Read more</a>
                </div>
            </div>
        </div>
        
        <xsl:result-document href="Web/HTML/{generate-id(.)}.html" format="html">
            <html>
                <head>
                    <link rel="stylesheet" type="text/css" href="../CSS/teaStyle.css"/>
                    <title><xsl:value-of select="@nazev"/></title>
                </head>
                <body>
                    <section class="teaTop">
                        <h1><xsl:value-of select="@nazev"/></h1>
                        <xsl:if test="@ceskyNazev!=''">
                            <h2><xsl:value-of select="@ceskyNazev"/></h2>
                        </xsl:if>
                    </section>
                    
                    <section class="teaCenter">
                        <div class="container">
                            <div class="genInfo">
                                <div class="genInfo topRow">
                                    <h3>Typ: <xsl:value-of select="typ"/></h3>
                                    <h3>Druh: <xsl:value-of select="druh"/></h3>
                                </div>
                                <div class="genInfo origin">
                                    <h3>Původ</h3>
                                    <p>Země původu: <xsl:value-of select="puvod/zeme"/></p>
                                    <p>Země původu: <xsl:value-of select="puvod/oblast"/></p>
                                </div>
                                <div class="genInfo growth">
                                    <h3>Pěstování</h3>
                                    <p>Nadmořská výška: <xsl:value-of select="pestovani/nadmorskaVyska"/> nm</p>
                                    <div class="genInfo growth tree">
                                        <p>Strom</p>
                                        <p>Druh stromu: <xsl:value-of select="pestovani/strom/druhStromu"/></p>
                                        <p>Věk stromu: <xsl:value-of select="pestovani/strom/vek"/></p>
                                    </div>
                                </div>
                                <div class="genInfo production">
                                    <h3>Výroba</h3>
                                    <p>Sklizeň: <xsl:value-of select="vyroba/sklizen"/></p>
                                    <p>Fermentace: <xsl:value-of select="vyroba/fermentace"/></p>
                                    <p>Oxidace: <xsl:value-of select="vyroba/oxidace"/></p>
                                </div>
                            </div>
                            <div class="prep">
                                <h3>Příprava Čaje</h3>
                                <p>Množství: <xsl:value-of select="priprava/mnozstvi"/> <xsl:value-of select="priprava/mnozstvi/@jednotky"/></p>
                                <h3>Voda</h3>
                                <ul>
                                    <li>Množství: <xsl:value-of select="priprava/voda/mnozstvi"/> <xsl:value-of select="priprava/voda/mnozstvi/@jednotky"/></li>
                                    <li>Teplota: <xsl:value-of select="priprava/voda/teplota"/> <xsl:value-of select="priprava/voda/teplota/@jednotky"/></li>
                                </ul>
                                
                                <h3>Nádobí</h3>
                                <ul>
                                    <li>Materiál: <xsl:value-of select="priprava/druhNadobi/material"/></li>
                                    <li>Kalíšek
                                        <ul>
                                            <li>Průměr: <xsl:value-of select="priprava/druhNadobi/kalisek/prumer"/> <xsl:value-of select="priprava/druhNadobi/kalisek/prumer/@jednotky"/></li>
                                            <li>Hloubka: <xsl:value-of select="priprava/druhNadobi/kalisek/hloubka"/> <xsl:value-of select="priprava/druhNadobi/kalisek/hloubka/@jednotky"/></li>
                                            <li>Objem: <xsl:value-of select="priprava/druhNadobi/kalisek/objem"/> <xsl:value-of select="priprava/druhNadobi/kalisek/objem/@jednotky"/></li>
                                        </ul>
                                    </li>
                                    <li>Konvička 
                                        <p>Objem: <xsl:value-of select="priprava/druhNadobi/konvicka/objem"/> <xsl:value-of select="priprava/druhNadobi/konvicka/objem/@jednotky"/></p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </section>
                    <div class="footer">
                        <a href="index.html">GO BACK</a>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    
    
</xsl:stylesheet>
