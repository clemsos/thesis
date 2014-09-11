# phD thesis

Clément Renaud phD Thesis (LaTex)


## Packages

on Debian 

    sudo apt-get install texlive-latex-base latex-cjk-common texlive-language-french texlive-language-chinese texlive-science


## Convert Word to Latex

Save as .odt with OpenOffice then use [Writer2LaTeX](http://writer2latex.sourceforge.net)
    
    # doc here : http://writer2latex.sourceforge.net/doc1.2/user-manual14.html
    w2l -config ./scripts/w2l-config.xml chapitre-xxx.odt chapters/chapitre-xxx.tex

## Convert citations into latex format

Support : (Nivre et al., 2007) , (Sagae and Tsujii 2007), Nivre (2007), (Chen et al., 2007; Dredze et al., 2007).

    # edit file name in the script
    python ./scripts/quotes.py
    

## Count pages with colors in PDF

Useful for printing 
    
    # on Unix command line
    chmod +x ./scripts/coloredpages.sh
    ./scripts/coloredpages.sh thesis.pdf

