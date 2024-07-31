#!/bin/bash

# Directory containing BAM files
bam_dir="/Users/rashmirao/Documents/Sidra_Externship/RNAseq/RNA_seq_analysis/raw_data/fastq/res_trimmomatic/fastp_results/fastas/alignments"
# Path to the annotation file
annotation_file="/Users/rashmirao/Documents/Sidra_Externship/RNAseq/RNA_seq_analysis/raw_data/fastq/res_trimmomatic/fastp_results/fastas/alignments/real_yeast.gtf "
# Output file
output_file="FeatureCounts.txt"

# Collect all BAM files in the directory
bam_files=$(ls $bam_dir/*.bam)

# Run featureCounts on all BAM files
/Applications/software_bioinformatics/subread-2.0.2-macOS-x86_64/bin/featureCounts -T 8 -p -a $annotation_file -o $output_file $bam_files
