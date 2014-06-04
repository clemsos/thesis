#!/usr/bin/python
# URL that generated this code:
# http://txt2re.com/index-python.php3?s=(autor,2012)&3&20&6&18&19

import fileinput
import re
import os

myfile="chapters/_chapitre2.tex"

quotes=[]
# with open(myfile,"rw") as chap:
for line in fileinput.input(myfile, inplace=True):
    # for line in chap:
        author = "(?:[A-Z][A-Za-z'`-]+)"
        etal = "(?:et al.?)"
        additional = "(?:,? (?:(?:and |& )?" + author + "|" + etal + "))"
        year_num = "(?:19|20)[0-9][0-9]"
        page_num = "(?:, p.? [0-9]+)?"  # Always optional
        year = "(?:, *"+year_num+page_num+"| *\("+year_num+page_num+"\))"
        regex = "(" + author + additional+"*" + year + ")"

        matches = re.findall(regex, line)
        
        print line

        if len(matches):
            for quote in matches:
                if len(quote.split(','))!=1: 
                    q="("+quote+")"
                    c="\cite{"+quote.split(',')[0]+quote.split(',')[1][1:]+"}"
                    # print(c,q)
                    print line.replace(q, c),
print "quote converted to Latex"


# for line in fileinput.input(myfile, inplace=True):
    # print line.replace("foo", "bar")
    # print "%d: %s" % (fileinput.filelineno(), line),