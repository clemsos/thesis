#!/bin/bash
file="$1"
colorpages=0

# count all pages
totalpages=$(gs -q -dNODISPLAY -c "($1) (r) file runpdfbegin pdfpagecount = quit")
echo "Total pages : $totalpages"

# find pages with colors
for page in $(identify -density 12 -format '%p ' "$file") ; do
 if convert "$file[$((page-1))]" -colorspace RGB -unique-colors txt:- | sed -e 1d | egrep -q -v ': \(\s*([0-9]*),\s*\1,\s*\1' ; then
    colorpages=$((colorpages+1))
    echo $page
 fi
done

#show results
echo "Colors : $colorpages"
echo "B&W : $(($totalpages-$colorpages))"
echo "Total pages : $totalpages"
