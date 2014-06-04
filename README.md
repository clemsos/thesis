# phD thesis

Clément Renaud phD Thesis (LaTex)

Convert Word to Latex :
- Save as .txt w Open Office
- replace & by blank space


Save as .odt ave OpenOffice puis utiliser word2latex

    w2l 02-CORRIGE-Chapitre2reluGP.odt chapitre2.tex

regexp find quotes
    
    # all parentheses
     \([^([0-9])]+\)  

    \(\D*\d\d\d\d\)

    # date only
    (\()([0-9]+)(\))
    (?<=\()([0-9]+)(?=\)) 

    #format (author, date)

