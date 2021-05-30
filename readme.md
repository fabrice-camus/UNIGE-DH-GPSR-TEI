# UNIGE-DH-GPSR-TEI

Projet de transformation des articles du GPSR en TEI

But : Evaluer la faisabilité de la mise en place d'une ingénierie de transformation d'un article du GPSR au format TEI

Projet réalisé dans le cadre du cours Unige-DH-Edition


## Contenu

* Voir le document ODD : contient toutes les explications et détails du travail réalisé


## Historique des versions
* Version 1.0
	* Mise en place du projet gitHub, de l'arborescence et des fichiers de travail
	* Mise en place de la feuille de style XSL

* Version 1.1
	* Finalisation de la partie variantes phonétique de l'article AGRAFER
		* Balise <usg> et son contenu
		* distinction orth/pron 
	* Préprocessing par une application console java

* Version 2.0
	* Intégration dans XSL des différents types de lemmes
	* Corps de l'article
		* Sens et leur niveau
		* def
		* <cit> : Créé globalement pour permettre d'inclure <usg>. Devrait normalement être défini pour chaque citation patoise (difficulté technique pour le faire; piste --> en postproc, remplacer </usg> par </usg><cit> ? autre piste, piloter xsl par <usg> et récupérer les noeuds précédents (mais avant le précédent usg))  
		* quote
		* usg : identification des références (par une regex balisage en préproc)

* Version 2.1
	* Article GABRIEL --> non valide ODD
		* Je n'arrive pas à traiter correctement la forme type gabri(y)ta
	* Article GRAND-MAMAN
		* Je n'arrive pas à traiter correctement la forme type gran mam (même problème que pour GABRIEL),  mais les autres ok....
	* Partie "commentaire scientifique" : 
		* pour l'instant dans un seul bloc <etym>
		* <xr> pour la référence au FEW (article GRAND-MAMAN)

Ce projet démontre la difficulté de réaliser une transformation automatisée depuis les fichiers sources XML reçu de Trèves. Les mécanismes techniques mis en oeuvre dans ce projet se révèlent être insuffisant pour réaliser ce travail avec comme attente une qualité de transformation sur les 30'000 articles. La prise en charge avec ces technologies d'une transformation plus complète rendra la chaine d'ingénierie très difficile à maintenir et faire évoluer.
Les règles rédactionnelles du Glossaire et le fait que les fichiers sources XML de Trèves sont encodés avec une approche principalement typographique rendent l'automatisation de transformation également difficile et imprécise. 

## Licences
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Licence Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />Mes fichiers sources sont sous licence <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International Licence</a>.

Les données du GPSR sont propriétés exclusives du Glossaire des patois de la Suisse romande et ne peuvent être exploitées de quelconque manière.

## Citer ce repository
Fabrice Camus,  _UNIGE-DH-GPSR-TEI: transformation des article du GPSR au format TEI_, Genève: Université de Genève, 2020, [https://github.com/fabrice-camus/UNIGE-DH-GPSR-TEI](https://github.com/fabrice-camus/UNIGE-DH-GPSR-TEI).


## Contact
fabrice.camus[at]etu.unige.ch