#!usr/bin/bash

cutadapt \
    -a file:adapters.txt \
    -A file:adapters.txt \
    -o SRR18396491_1.trimmed.fastq.gz \
    -p SRR18396491_2.trimmed.fastq.gz \
    /Users/rashmirao/Documents/Sidra_Externship/RNAseq/RNA_seq_analysis/raw_data/fastq/SRR18396491_1.fastq.gz \
    /Users/rashmirao/Documents/Sidra_Externship/RNAseq/RNA_seq_analysis/raw_data/fastq/SRR18396491_2.fastq.gz. \
    > cutadapt.log