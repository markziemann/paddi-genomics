#!/bin/bash

ls *fastq.gz | parallel -j12 md5sum {} > checksums.txt
ls *fastq.gz | parallel -j12 /home/ziemannm/paddi/sw/FastQC/./fastqc {}

for FQZ1 in *R1_001.fastq.gz ; do
  FQZ2=$(echo $FQZ1 | sed 's/_R1_/_R2_/')
  java -jar /home/ziemannm/paddi/sw/validatefastq-assembly-0.1.1.jar \
  -l info \
  --fastq1 $FQZ1 --fastq2 $FQZ2 \
   > $FQZ1.val  2>&1
done

multiqc .
