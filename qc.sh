#!/bin/bash
ls *fastq.gz | parallel -j12 md5sum {} > checksums.txt
ls *fastq.gz | parallel -j12 fastqc {}
