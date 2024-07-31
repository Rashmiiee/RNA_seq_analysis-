#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Load Picard if necessary
# module load picard  # Uncomment if you're using a module system to load Picard

# Define variables
#PICARD_JAR="picard.jar"  # Path to the Picard JAR file


# Process all FASTQ files in the current directory
for fastq1 in fastp_*_R1.fastq; do
  # Derive corresponding FASTQ2 file name
  fastq2="${fastq1/_R1.fastq/_R2.fastq}"
  
  # Derive base name (without the suffix)
  base_name="${fastq1%_R1.fastq}"

  # Check if the corresponding FASTQ2 file exists
  if [[ ! -f "$fastq2" ]]; then
    echo "Paired FASTQ file not found for $fastq1"
    continue
  fi

  # Define output uBAM file name
  output_ubam="${base_name}_unmapped.bam"

  # Run Picard FastqToSam
  picard FastqToSam \
    FASTQ="$fastq1" \
    FASTQ2="$fastq2" \
    OUTPUT="$output_ubam" \
    READ_GROUP_NAME="${base_name}_rg" \
    SAMPLE_NAME="$base_name" \
    LIBRARY_NAME="${base_name}_lib" \
    PLATFORM_UNIT="${base_name}_unit" \
    PLATFORM="illumina"

  echo "Converted $fastq1 and $fastq2 to $output_ubam"
done

echo "All FASTQ files processed."
