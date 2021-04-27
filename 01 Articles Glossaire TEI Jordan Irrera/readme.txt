Projet de transformation des articles du GPSR en TEI
Projet réalisé dans le cadre du cours Unige-DH-Edition
Fabrice Camus

Version 1.0
- Mise en place du projet gitHub, de l'arborescence et des fichiers de travail
- Mise en place de la feuille de style XSL

Traités : 
- article
- Formes type

Non-finalisés/problématiques 
- Balisage des localisations (--> usg) non intégré dans l'élément form
- les sources bibl sont balisées dans leur propre balise <usg> --> merger les balises <usg> consécutives et concernant la même variante phonétique
- le texte mis en exposant n'est pas intégré dans le texte environnant
- les variantes se trouvant après "Fr." doivent être balisées <orth> et pas <pron>
- Références biblio comme Dict. et Bibl. balisées <pron> (même typographie...)

Non-traités :
- splitter chaque variante phonétique englobée dans la balise <pron>
- exposant
- Partie "corps" de l'article
- Partie "commentaire scientifique" de l'article


Questions sur la modélisation TEI: 
- Pourquoi n'y-a-t-il pas, dans la modélisation de J.Irrera, d'élément <pron> englobant le lemme ? C'est une forme en tant que telle non ?

Questions sur mon ODD :
- Element Entry : Comment faire pour que xml:id soit obligatoire ? est-ce contraire aux principes TEI ?
- Est-ce pertinent de vouloir supprimer tous les attributs (d'un élément) que l'on utilise pas ?
    - Pourquoi certains attributs ne peuvent pas être supprimés même s'ils sont pas utilisés, comme type et opt ?
- J'ai redéfini la valeur de l'attribut @type de l'élément usg, mais cela ne s'affiche pas dans la doc html