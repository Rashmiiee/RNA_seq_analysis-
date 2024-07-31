#!/bin/bash

# Loop through all .bam files in the current directory
for bam_file in *.bam; do
  # Generate BAM index (.bai) file using samtools
  samtools index "$bam_file"
done
