#!/bin/bash

FILE=$1
PAGES=$(pdfinfo ${FILE} | grep 'Pages:' | sed 's/Pages:\s*//')

GRAYPAGES=""
COLORPAGES=""
DOUBLECOLORPAGES=""

echo "Pages: $PAGES"
N=1
while (test "$N" -le "$PAGES")
do
    COLORSPACE=$( identify -format "%[colorspace]" "$FILE[$((N-1))]" )
    echo "$N: $COLORSPACE"
    if [[ $COLORSPACE == "Gray" ]]
    then
        GRAYPAGES="$GRAYPAGES $N"
    else
        COLORPAGES="$COLORPAGES $N"
        # For double sided documents also list the page on the other side of the sheet:
        if [[ $((N%2)) -eq 1 ]]
        then
            DOUBLECOLORPAGES="$DOUBLECOLORPAGES $N $((N+1))"
            #N=$((N+1))
        else
            DOUBLECOLORPAGES="$DOUBLECOLORPAGES $((N-1)) $N"
        fi
    fi
    N=$((N+1))
done

echo $DOUBLECOLORPAGES
echo $COLORPAGES
echo $GRAYPAGES
#pdftk $FILE cat $COLORPAGES output color_${FILE}.pdf