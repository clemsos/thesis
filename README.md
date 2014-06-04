# phD thesis

Clément Renaud phD Thesis (LaTex)

Convert Word to Latex :
- Save as .txt w Open Office
- replace & by blank space


Save as .odt ave OpenOffice puis utiliser word2latex
    
    # doc here : http://writer2latex.sourceforge.net/doc1.2/user-manual14.html
    w2l -config /home/clemsos/phD/thesis/w2l-config.xml 03-CORRIGE-Chapitre3reluGP.odt chapitre3.tex

regexp find quotes
    
    # all parentheses
     \([^([0-9])]+\)  

    \(\D*\d\d\d\d\)

    # date only
    (\()([0-9]+)(\))
    (?<=\()([0-9]+)(?=\)) 

    #format (author, date)

