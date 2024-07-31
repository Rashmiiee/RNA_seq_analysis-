#!/bin/bash

export JAVA_OPTS="-Xms32m -Xmx3000M"

# Loop through all .bam files in the current directory
for file in *.bam
do
  # Extract the base name of the file (without extension)
  base_name=$(basename "$file" .bam)
  
  # Run qualimap for each .bam file
  /Applications/software_bioinformatics/qualimap_v2.3/qualimap rnaseq -bam "$file" -gtf real_yeast.gtf -outdir "rnaseq_qc_results_$base_name"
done
