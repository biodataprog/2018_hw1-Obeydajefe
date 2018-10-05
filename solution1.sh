#!/bin/bash

# code should go here to download file https://biodataprog.github.io/programming-intro/data/Ecoli-vs-Yersinia.BLASTP.tab.gz

echo "hi"
ssh -X gloga001@biocluster.ucr.edu
Echo "Then I would enter my password"
curl -O https://biodataprog.github.io/2018_programming-intro/data/Ecoli-vs-Yersinia.BLASTP.tab.gz
ll -h
echo "compressed file is 485 Kb"
gunzip Ecoli-vs-Yersinia.BLASTP.tab
ll -h
echo "uncompressed file is 2.1 Mb"
head -n 25 Ecoli-vs-Yersinia.BLASTP.tab
tail -n 3 Ecoli-vs-Yersinia.BLASTP.tab
cat Ecoli-vs-Yersinia.BLASTP.tab
echo "or, if you were asking how many lines there were in the file, do the following;"
cat Ecoli-vs-Yersinia.BLASTP.tab | wc -l
echo "uncompressed file has 20777 lines"
echo "now on to the next file"
curl -O https://biodataprog.github.io/2018_programming-intro/data/Nc3H.expr.tab
less Nc3H.expr.tab
echo "I did the less command so that I could see the columns and column headers. RPKM column is column 5"
sort -g -k 5,5 Nc3H.expr.tab
shift+G
echo "I found that the two above commands effectively sorted the file, using the numerical values in column 5 (and only column 5), then pulled me to the bottom of the list so that I could see the last 10 values on the list"
echo "this should result in NCU08638 - 08642, and NCU10027 - 10031"
echo "now on to the next file"
curl -O https://biodataprog.github.io/2018_programming-intro/data/D_mel.63B12.gbk
ll -h
echo "I was a bit confused about what you meant by the number of CDS features in the file, so I first grep'd for CDS and just counted every one I could find, then I looked for the number of times it said CDS"
grep "CDS" D_mel.63B12.gbk
echo "counting the regions found by this search, I found 36 different CDS's"
grep -c "CDS" D_mel.63B12.gbk
sort -g -k 3,3 Ecoli-vs-Yersinia.BLASTP.tab
echo "this sort revealed 2 100% identical sequences in the file"
grep -c -E -e 9[0-9][.][0-9]{2} Ecoli-vs-Yersinia.BLASTP.tab
echo "I looked up some tools on how to narrow down this search, so I'm sorry if this isn't the way you would have preferred I search. Nonetheless, this resulted in 179 sequences with 90% or higher sequence identity, which comes to 181 when you include the 2 100% identities"
echo "Now on to the last file of the homework"
curl -O https://biodataprog.github.io/2018_programming-intro/data/codon_table.txt
ll
grep -E -e [A-Z][a-z]+ -o codon_table.txt | sort | uniq -c
echo "this one also took a bit of research, but I think the first command helps me sort by the last column, while the uniq command helps me consolidate the redundant amino acid names into singular values, the combination of which spits out how many times each amino acid was repeated, i.e. the number of codons that code for each amino acid"
