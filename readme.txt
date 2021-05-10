Projet de transformation des articles du GPSR en TEI
Projet réalisé dans le cadre du cours Unige-DH-Edition
Fabrice Camus

Version 1.0
- Mise en place du projet gitHub, de l'arborescence et des fichiers de travail
- Mise en place de la feuille de style XSL

Version 1.1
- Finalisation de la partie variantes phonétique de l'article AGRAFER
    - Balise <usg> et son contenu
    - distinction orth/pron 
- Préprocessing par une application console java

Version 2.0
- Intégration dans XSL des différents types de lemmes
- Corps de l'article
    - Sens et leur niveau
    - def
    - <cit> : Créé globalement pour permettre d'inclure <usg>. Devrait normalement être défini pour chaque citation patoise (difficulté technique pour le faire; piste --> en postproc, remplacer </usg> par </usg><cit> ? autre piste, piloter xsl par <usg> et récupérer les noeuds précédents (mais avant le précédent usg))  
    - quote
    - usg : identification des références (par une regex balisage en préproc)

Traités : 
- article
- Variantes phonétiques 
    - Delta : 
        - <bibl> au lieu de <name> pour N Bon., Pier. + 1 seule balise <bibl>
        - les occurrences multiples de variantes phonétiques pour un usage ne sont pas splittées (même niveau de "granularité" que les localisations 
    
TODO
    In TEI Lex-0, <sense> has a mandatory xml:id. (https://dariah-eric.github.io/lexicalresources/pages/TEILex0/TEILex0.html#senses)

Non-traités ou non-fonctionnel :
- Article
    - composés/composants/sous-article
- lemmes : 
    - signes entourant les lemmes reconstruits ( [ ] ) ou reproduisant la graphie de la source (« »)
- Partie Variantes phonétiques :
    - <placeName> pour chaque code de localisations, cf certains articles de Jordan
    - distinction orth / pron --> ok avec article AGRAFER, ko avec GABRIEL (il y a une "sous-structure cachée" avec les formes types)
- Partie "corps" de l'article :
    - il n'est pas possible de distinguer une citation patoise d'un simple mot ou une référence biblio ("chez nous", "agrafé"). "Chez nous" peut évt être détecté en preproc. On peut évt détecter une balise <i> avec plus d'un mot
    - Une citation patoise (en italique) peut être "décomposée" en plusieurs séquences <i>. Il faudrait merger les éléments <i> qui sont consécutifs
- Partie "commentaire scientifique" de l'article




Questions sur la modélisation TEI: 
- Pourquoi n'y-a-t-il pas, dans la modélisation de J.Irrera, d'élément <pron> englobant le lemme ? C'est une forme en tant que telle non ?

Questions sur mon ODD :
- Element Entry : Comment faire pour que xml:id soit obligatoire ? est-ce contraire aux principes TEI ?
- Est-ce pertinent de vouloir supprimer tous les attributs (d'un élément) que l'on utilise pas ?
    - Pourquoi certains attributs ne peuvent pas être supprimés même s'ils sont pas utilisés, comme type et opt ?
- J'ai redéfini la valeur de l'attribut @type de l'élément usg, mais cela ne s'affiche pas dans la doc html