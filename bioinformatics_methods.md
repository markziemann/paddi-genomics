## Bioinformatics analysis

Initially fastq file checksums were generated.

Validate fastq file with validatefastq v0.1.1.

Sequence quality was assessed using FastQC v0.11.9.

To assess rRNA contamination, 1 million reads were mapped to a set of human rRNA contigs using BWA v0.7.17.

For transcriptome analysis, read pairs underwent 3' trimming with Skewer with a minimum sequence quality score of 10, followed by mapping to the Gencode v38 cDNA sequences with Kallisto.

