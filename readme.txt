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


Traités : 
- article
- Variantes phonétiques 
    - Delta : 
        - <bibl> au lieu de <name> pour N Bon., Pier. + 1 seule balise <bibl>
        - les occurrences multiples de variantes phonétiques pour un usage ne sont pas splittées (même niveau de "granularité" que les localisations 
    


Non-traités :
- Partie Variantes phonétiques :
    - <placeName> pour chaque code de localisations, cf certains articles de Jordan
- Partie "corps" de l'article
- Partie "commentaire scientifique" de l'article


Questions sur la modélisation TEI: 
- Pourquoi n'y-a-t-il pas, dans la modélisation de J.Irrera, d'élément <pron> englobant le lemme ? C'est une forme en tant que telle non ?

Questions sur mon ODD :
- Element Entry : Comment faire pour que xml:id soit obligatoire ? est-ce contraire aux principes TEI ?
- Est-ce pertinent de vouloir supprimer tous les attributs (d'un élément) que l'on utilise pas ?
    - Pourquoi certains attributs ne peuvent pas être supprimés même s'ils sont pas utilisés, comme type et opt ?
- J'ai redéfini la valeur de l'attribut @type de l'élément usg, mais cela ne s'affiche pas dans la doc html