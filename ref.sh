#!/bin/bash
wget http://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_38/gencode.v38.transcripts.fa.gz
gunzip gencode.v38.transcripts.fa.gz
../sw/kallisto index -i gencode.v38.transcripts.fa.idx gencode.v38.transcripts.fa
