#!/bin/bash

# code should go here to download file https://biodataprog.github.io/programming-intro/data/Ecoli-vs-Yersinia.BLASTP.tab.gz

echo "hi"
ssh -X gloga001@biocluster.ucr.edu
# Then I would enter my password
curl -O https://biodataprog.github.io/2018_programming-intro/data/Ecoli-vs-Yersinia.BLASTP.tab.gz
du -h
# compressed file is 485 Kb
gunzip Ecoli-vs-Yersinia.BLASTP.tab
du -h
# uncompressed file is 2.1 Mb
head -n 25 Ecoli-vs-Yersinia.BLASTP.tab
tail -n 3 Ecoli-vs-Yersinia.BLASTP.tab
wc -l Ecoli-vs-Yersinia.BLASTP.tab
# uncompressed file has 20777 lines
# now on to the next file
curl -O https://biodataprog.github.io/2018_programming-intro/data/Nc3H.expr.tab
less Nc3H.expr.tab
# I did the less command so that I could see the columns and column headers. RPKM column is column 6. then I did the neat trick you taught us in class to move the header.
head -n 1 Nc3H.expr.tab && tail -n +2 Nc3H.expr.tab |sort -r -k 6,6 Nc3H.expr.tab
# now on to the next file
curl -O https://biodataprog.github.io/2018_programming-intro/data/D_mel.63B12.gbk
du -h
# I have again updated this to use the trick you taught us about copying CDS + the space in front to grep with
grep -c "     CDS" D_mel.63B12.gbk
sort -g -k 3,3 Ecoli-vs-Yersinia.BLASTP.tab
# this sort revealed 2 100% identical sequences in the file
grep -c -E -e 9[0-9][.][0-9]{2} Ecoli-vs-Yersinia.BLASTP.tab
# I looked up some tools on how to narrow down this search, so I'm sorry if this isn't the way you would have preferred I search. Nonetheless, this resulted in 179 sequences with 90% or higher sequence identity, which comes to 181 when you include the 2 100% identities
# Now on to the last file of the homework
curl -O https://biodataprog.github.io/2018_programming-intro/data/codon_table.txt
ll
grep -E -e [A-Z][a-z]+ -o codon_table.txt | sort | uniq -c
# this one also took a bit of research, but I think the first command helps me sort by the last column, while the uniq command helps me consolidate the redundant amino acid names into singular values, the combination of which spits out how many times each amino acid was repeated, i.e. the number of codons that code for each amino acid

