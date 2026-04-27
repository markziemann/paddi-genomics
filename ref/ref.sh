#!/bin/bash
wget http://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_38/gencode.v38.transcripts.fa.gz
gunzip gencode.v38.transcripts.fa.gz
../sw/kallisto index -i gencode.v38.transcripts.fa.idx gencode.v38.transcripts.fa

grep '>' gencode.v38.transcripts.fa \
| cut -d '|' -f2,6 | tr '|' '\t' \
| sort -u > gencode.v38.genetable.tsv

# chromosomes
zcat gencode.v38.basic.annotation.gtf.gz | grep -w gene | cut -d ';' -f1 \
| cut -f1,9 | sed 's/gene_id "//' | tr -d '"' > chr2gene.tsv

