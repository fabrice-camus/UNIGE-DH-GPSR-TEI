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

Version 2.1
- Article GABRIEL --> non valide ODD
    - Je n'arrive pas à traiter correctement la forme type gabri(y)ta
- Article GRAND-MAMAN
    - Je n'arrive pas à traiter correctement la forme type gran mam (même problème que pour GABRIEL),  mais les autres ok....
- Partie "commentaire scientifique" : 
    - pour l'instant dans un seul bloc <etym>
    - <xr> pour la référence au FEW (article GRAND-MAMAN)


  
        
TODO
    - In TEI Lex-0, <sense> has a mandatory xml:id. (https://dariah-eric.github.io/lexicalresources/pages/TEILex0/TEILex0.html#senses)
    - identifier les sources humaines et papier ?
  

Remarques : 
     - les articles de Jordan ne sont pas homogènes dans la modélisation (ex : entre agrafer et gabriel, dans les varpho, il y a l'utilisation de placename)
     - Les choix technologiques ne sont clairement pas suffisant pour envisager de transformer des articles au format TEI. Une analyse plus approfondie du texte doit être faite --> intelligence artificielle, arbre syntaxique, ???
     - La qualité et le type de rétrodigitalisation effectuée ne favorise pas une automatisation de la transformation...

Questions sur la modélisation TEI: 
- Pourquoi n'y-a-t-il pas, dans la modélisation de J.Irrera, d'élément <pron> englobant le lemme ? C'est une forme en tant que telle non ?

Questions sur mon ODD :
- Element Entry : Comment faire pour que xml:id soit obligatoire ? est-ce contraire aux principes TEI ?
- Est-ce pertinent de vouloir supprimer tous les attributs (d'un élément) que l'on utilise pas ?
    - Pourquoi certains attributs ne peuvent pas être supprimés même s'ils sont pas utilisés, comme type et opt ?
- J'ai redéfini la valeur de l'attribut @type de l'élément usg, mais cela ne s'affiche pas dans la doc html