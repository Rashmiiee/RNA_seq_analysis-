#!/bin/bash

# Path to the reference BED file
REF_BED="/Users/rashmirao/Documents/Sidra_Externship/RNAseq/RNA_seq_analysis/raw_data/S288C_reference_genome_R64-5-1_20240529/yeast.bed"

# Output file to save the combined results
OUTPUT_FILE="combined_infer_experiment_output.txt"

# Clear the output file if it exists
> "$OUTPUT_FILE"

# Loop through all .bam files in the current directory
for bam_file in *.bam; do
  echo "Processing $bam_file" >> "$OUTPUT_FILE"
  # Run infer_experiment.py and append the output to the file
  infer_experiment.py -i "$bam_file" -r "$REF_BED" >> "$OUTPUT_FILE"
  echo "Finished processing $bam_file" >> "$OUTPUT_FILE"
  echo "----" >> "$OUTPUT_FILE"
done

