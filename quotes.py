#!/usr/bin/python

# convert citations into latex format
# 
#   (Nivre et al., 2007) 
#   (Sagae and Tsujii 2007)
#    Nivre (2007) 
#   (Chen et al., 2007; Dredze et al., 2007).
#
#  \cite{Nivre2007}

import fileinput
import re
import os

myfile="chapters/_chapitre3.tex"

# with open(myfile,"rw") as chap:
for line in fileinput.input(myfile, inplace=True):
    # for line in chap:

        # Regexp from http://stackoverflow.com/a/16826935/887594
        author = "(?:[A-Z][A-Za-z'`-]+)"
        etal = "(?:et al.?)"
        additional = "(?:,? (?:(?:and |& )?" + author + "|" + etal + "))"
        year_num = "(?:19|20)[0-9][0-9]"
        page_num = "(?:, p.? [0-9]+)?"  # Always optional
        year = "(?:, *"+year_num+page_num+"| *\("+year_num+page_num+"\))"
        regex = "(" + author + additional+"*" + year + ")"

        matches = re.findall(regex, line)
        l=""
        if len(matches):
            for quote in matches:
                if len(quote.split(','))!=1: 
                    q="("+quote+")"
                    c="\cite{"+quote.split(',')[0]+quote.split(',')[1][1:]+"}"
                    # print(c,q)
                    l=line.replace(q, c)
                line=l

        print line,

print "quote converted to Latex"