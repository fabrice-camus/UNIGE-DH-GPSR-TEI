Projet de transformation des articles du GPSR en TEI
Projet r�alis� dans le cadre du cours Unige-DH-Edition
Fabrice Camus

Version 1.0
- Mise en place du projet gitHub, de l'arborescence et des fichiers de travail
- Mise en place de la feuille de style XSL

Trait�s : 
- article
- Formes type

Non-finalis�s/probl�matiques 
- Balisage des localisations (--> usg) non int�gr� dans l'�l�ment form
- les sources bibl sont balis�es dans leur propre balise <usg> --> merger les balises <usg> cons�cutives et concernant la m�me variante phon�tique
- le texte mis en exposant n'est pas int�gr� dans le texte environnant
- les variantes se trouvant apr�s "Fr." doivent �tre balis�es <orth> et pas <pron>
- R�f�rences biblio comme Dict. et Bibl. balis�es <pron> (m�me typographie...)

Non-trait�s :
- splitter chaque variante phon�tique englob�e dans la balise <pron>
- exposant
- Partie "corps" de l'article
- Partie "commentaire scientifique" de l'article


Questions sur la mod�lisation TEI: 
- Pourquoi n'y-a-t-il pas, dans la mod�lisation de J.Irrera, d'�l�ment <pron> englobant le lemme ? C'est une forme en tant que telle non ?

Questions sur mon ODD :
- Element Entry : Comment faire pour que xml:id soit obligatoire ? est-ce contraire aux principes TEI ?
- Est-ce pertinent de vouloir supprimer tous les attributs (d'un �l�ment) que l'on utilise pas ?
    - Pourquoi certains attributs ne peuvent pas �tre supprim�s m�me s'ils sont pas utilis�s, comme type et opt ?
- J'ai red�fini la valeur de l'attribut @type de l'�l�ment usg, mais cela ne s'affiche pas dans la doc html