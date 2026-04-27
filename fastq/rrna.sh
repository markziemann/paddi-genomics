#!/bin/bash

set -x

REF=/home/ziemannm/paddi/ref/rrna.fa

FQT=/home/ziemannm/paddi/sw/fastq_quality_trimmer

for FQZ in *_R1_001.fastq.gz ; do
  echo $FQZ
  FQ=`echo $FQZ | sed 's/.gz//'`
  zcat $FQZ | head -4000000 | $FQT -t 30 -l 20 -Q33 \
  | tee $FQ | bwa aln -t 8 $REF - | bwa samse $REF - $FQ \
  | samtools view -uSh - \
  | samtools sort -o ${FQ}.bam -
done

for i in *bam ; do samtools index $i & done ; wait

for i in *bam ; do samtools flagstat $i > ${i}.stats & done ; wait
