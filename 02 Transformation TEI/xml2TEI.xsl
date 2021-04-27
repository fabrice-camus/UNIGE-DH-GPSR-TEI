<?xml version="1.0"?>
<!--
	
	Fabrice Camus
	27.04.2021
	Unige/DH/Edition : Projet GPSR-TEI

-->

<xsl:stylesheet version="2.0" xmlns="http://www.tei-c.org/ns/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" encoding="UTF-8"/>

	<!--Structure de base-->
	<xsl:template match="//xml">
		<xsl:processing-instruction name="xml-model">
       	href="../03-Odd/out/GPSR-TEI-FCA.rnc" 
       	type="application/relax-ng-compact-syntax"
		</xsl:processing-instruction>
		<TEI>
			<teiHeader>
				<fileDesc>
					<titleStmt>
						<title>Projet Unige-DH-Edition-GPSR-TEI : Encodage des articles du Glossaire</title>
						<author xml:id="FCA">
							<name>Fabrice Camus</name>
						</author>
						<author xml:id="JIR">
							<name>Jordan Irrera</name>
						</author>
					</titleStmt>
					<publicationStmt>
						<publisher>Université de Genève</publisher>
						<availability status="restricted" n="cc-by">
							<licence target="https://creativecommons.org/licenses/by/4.0"/>
						</availability>
					</publicationStmt>
					<notesStmt>
						<note>Projet dans le cadre du cours Edition numérique DH-UniGe 2021</note>
					</notesStmt>
					<sourceDesc>					
						<bibl>
							<author>Glossaire des patois de la Suisse Romande</author>
							<title>Glossaire des patois de la Suisse Romande</title>
							<pubPlace>Genève</pubPlace>
							<publisher>Librairie Droz</publisher>
						</bibl>
					</sourceDesc>
				</fileDesc>
			</teiHeader>
			<text>
				<body>
					<xsl:apply-templates/>
				</body>
			</text>
		</TEI>
	</xsl:template>
	
	<!-- Un article -->
	<xsl:template match="//art">
		<entry>
			<xsl:attribute name="xml:id">
				<xsl:value-of select="concat('GPSR.',(@tome*100000000) + number(replace(substring-before(@ln,'.'),'E','')) * 1000 + number(substring-after(@ln,'.')))"/>
			</xsl:attribute>
			<xsl:apply-templates/>
		</entry>
	</xsl:template>

	

	<!--Lemme-->
	<!-- Français -->
	<xsl:template match="//lem1/AN/b/text()">
		<form type="lemma" subtype="français"><xsl:value-of select="."/></form>
	</xsl:template>
	
	<xsl:template match="//varpho/i/text()">
		<form type="variant"><pron><xsl:value-of select="."/></pron></form>
	</xsl:template>
	<xsl:template match="//varpho/text()">
		<usg type="geo"><xsl:value-of select="."/></usg>
	</xsl:template>	
	<xsl:template match="//varpho/c">
		<usg type="geographic"><bibl><xsl:value-of select="."/></bibl></usg>
	</xsl:template>	
	<xsl:template match="//varpho/i/b/text()|//varpho/b/i/text()">
		<form type="typePatois"><pron><xsl:value-of select="."/></pron></form>
	</xsl:template>
	<xsl:template match="//varpho/b/text()">
		<lbl><xsl:value-of select="."/></lbl>
	</xsl:template>	

	<!-- A traiter. Pour l'instant exclu du résultat -->
	<xsl:template match="//varpho/text()"/>
	<xsl:template match="//semx"/>
	<xsl:template match="//hist"/>
	<xsl:template match="//sup"/>
</xsl:stylesheet>
