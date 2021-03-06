# UNIGE-DH-GPSR-TEI

Projet de transformation des articles du GPSR en TEI

But : Evaluer la faisabilité de la mise en place d'une ingénierie de transformation d'un article du GPSR au format TEI

Projet réalisé dans le cadre du cours Unige-DH-Edition-2021


## Contenu

* Voir le document ODD : contient toutes les explications et détails du travail réalisé



## Historique des versions
* Version 1.0
	* Mise en place du projet gitHub, de l'arborescence et des fichiers de travail
	* Mise en place de la feuille de style XSL

* Version 1.1
	* Finalisation de la partie variantes phonétique de l'article AGRAFER
		* Balise &lt;usg&gt; et son contenu
		* distinction orth/pron 
	* Préprocessing par une application console java

* Version 2.0
	* Intégration dans XSL des différents types de lemmes
	* Corps de l'article
		* Sens et leur niveau
		* traitement des niveaux S4 et S5 de la hiérarchie des sens (les autres niveaux seront à traiter en mettant en oeuvre des règles xsl similaires)
		* &lt;cit&gt; : Créé globalement pour permettre d'inclure &lt;usg&gt;. Devrait normalement être défini pour chaque citation patoise (identification à faire)
		* &lt;quote&gt;
		* &lt;usg&gt; : identification des références (par une regex balisage en préproc)

* Version 2.1
	* Article GABRIEL --> non valide ODD
		* Je n'arrive pas à traiter correctement la forme type gabri(y)ta (sous-structure dans les variantes phonétiques à analyser et à pouvoir identifier)
		* le reste de l'article est valide
	* Article GRAND-MAMAN
		* Je n'arrive pas à traiter correctement la forme type gran mam (même problème que pour GABRIEL).
		* le reste de l'article est valide
	* Partie "commentaire scientifique" : 
		* pour l'instant dans un seul bloc &lt;etym&gt;
		* &lt;xr&gt; pour la référence au FEW (article GRAND-MAMAN)

Ce projet démontre la difficulté de réaliser une transformation automatisée depuis les fichiers sources XML reçu de Trèves. Les mécanismes techniques mis en oeuvre dans ce projet se révèlent être insuffisants pour réaliser ce travail avec comme attente une qualité de transformation sur les 30'000 articles. La prise en charge avec ces technologies d'une transformation plus complète rendra la chaine d'ingénierie très difficile à maintenir et faire évoluer.
Les règles rédactionnelles du Glossaire (telles que la mise en facteur ou les abréviations) et le fait que les fichiers sources XML de Trèves sont encodés avec une approche principalement typographique rendent l'automatisation de transformation également difficile et imprécise.

## Remarques
* Les articles de références ne sont pas homogènes dans leur modélisation TEI. Par exemple, dans les variantes phonétiques, l'article GABRIEL utilise &lt;placeName&gt;	tandis qu'AGRAFER non.

 

## Ingénierie
* le projet est entièrement téléchargeable avec l'arborescence actuelle.
* Oxygen XML Editor 23.0 a été utilisé comme environnement de travail : projet "gpsr-tei.xpr", rédaction de l'ODD & génération du rnc correspondant, transformation xsl
* Le projet Java console a été développé en utilisant IntelliJ IDEA 2020.1.2. La classe Main.java est totalement compilable avec n'importe quel jdk. Aucune librairie autre que le JDK11 n'a été utilisée.


## Licences
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Licence Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />Mes fichiers sources sont sous licence <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International Licence</a>.

Les données du GPSR sont propriétés exclusives du Glossaire des patois de la Suisse romande et ne peuvent être exploitées de quelconque manière.

## Crédits
L'encodage en TEI des articles de référence a été proposé par Jordan Irrera.

## Citer ce repository
Fabrice Camus,  _UNIGE-DH-GPSR-TEI: transformation des article du GPSR au format TEI_, Genève: Université de Genève, 2020, [https://github.com/fabrice-camus/UNIGE-DH-GPSR-TEI](https://github.com/fabrice-camus/UNIGE-DH-GPSR-TEI).


## Contact
fabrice.camus[at]etu.unige.ch