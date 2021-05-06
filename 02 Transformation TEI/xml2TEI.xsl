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

	
	<xsl:template name="usg" >
		<xsl:param name="node" />
		<usg type="geographic">	
				<xsl:choose>
					<!-- Beurk. A améliorer pour factoriser le traitement du foreach -->
					<xsl:when test="count($node/following-sibling::i)>0">
						<xsl:for-each select="$node/following-sibling::node()  intersect $node/following-sibling::i[1]/preceding-sibling::node()">
							<xsl:choose>
								<xsl:when test="self::c|self::bibl"><bibl><xsl:value-of select="."/></bibl></xsl:when>
								<xsl:when test="self::b|self::pc"></xsl:when>
								<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="$node/following-sibling::node()">
							<xsl:choose>
								<xsl:when test="self::c|self::bibl"><bibl><xsl:value-of select="."/></bibl></xsl:when>
								<xsl:when test="self::b|self::pc"></xsl:when>
								<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>			
					</xsl:otherwise>
				</xsl:choose>
		</usg>				
	</xsl:template>


	<xsl:template match="//varpho/i">
		<xsl:if test="count(./b)>0">	
			<form type="typePatois">
				<xsl:choose>
					<xsl:when test="count(./preceding-sibling::b[text()='Fr.'])>0"><orth><xsl:value-of select="./b"/></orth></xsl:when>
					<xsl:otherwise><pron><xsl:value-of select="./b"/></pron></xsl:otherwise>
				</xsl:choose>
			
				<xsl:if test="count(./text())=0">		
					<xsl:call-template name="usg">
						<xsl:with-param name="node" select = "." />
					</xsl:call-template>
				</xsl:if>
			</form>
		</xsl:if>
		<xsl:if test="count(./text())>0">
			<form type="variant">
				<xsl:choose>
					<xsl:when test="count(./preceding-sibling::b[text()='Fr.'])>0"><orth><xsl:value-of select="text()"/></orth></xsl:when>
					<xsl:otherwise><pron><xsl:value-of select="text()"/></pron></xsl:otherwise>
				</xsl:choose>
				
				<xsl:call-template name="usg">
					<xsl:with-param name="node" select = "." />
				</xsl:call-template>
			</form>
		</xsl:if>
	</xsl:template>
	

	<xsl:template match="//varpho/b/text()">
		<lbl><xsl:value-of select="."/></lbl>
	</xsl:template>	
	
	<!-- on court-circuite ces types de noeuds car ils sont traités dans le traitement du //varpho/i -->
	<xsl:template match="//varpho/text()"/>
	<xsl:template match="//varpho/c"/>
	<xsl:template match="//varpho/bibl"/>
	<xsl:template match="//pc">
		<pc><xsl:value-of select="."/></pc>
	</xsl:template>
	
	<!-- A traiter. Pour l'instant exclu du résultat -->
	<xsl:template match="//semx"/>
	<xsl:template match="//hist"/>
	<xsl:template match="//sup"/>
</xsl:stylesheet>
