# phD thesis

Clément Renaud phD Thesis (LaTex)

## Convert Word to Latex

Save as .odt with OpenOffice then use [Writer2LaTeX](http://writer2latex.sourceforge.net)
    
    # doc here : http://writer2latex.sourceforge.net/doc1.2/user-manual14.html
    w2l -config ./scripts/w2l-config.xml chapitre-xxx.odt chapters/chapitre-xxx.tex

## Convert citations into latex format

Support : (Nivre et al., 2007) , (Sagae and Tsujii 2007), Nivre (2007), (Chen et al., 2007; Dredze et al., 2007).

    # edit file name in the script
    python ./scripts/quotes.py
    


