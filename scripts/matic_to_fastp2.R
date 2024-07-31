setwd("/Users/rashmirao/Documents/Sidra_Externship/RNAseq/RNA_seq_analysis/raw_data/fastq/res_trimmomatic")

# Load the Rfastp library
library(Rfastp)

# Read in sample list from file
sample_list <- readLines("sample_list2.txt")

# Create a directory for output files if it doesn't exist
output_dir <- "fastp_results"
if (!file.exists(output_dir)) {
  dir.create(output_dir)
}

# Loop through each sample
for (sample in sample_list) {
  if (sample %in% sample_list) {
    # Define input and output file names
    read1 <- paste0(sample, "_forward_paired.fq.gz")
    read2 <- paste0(sample, "_reverse_paired.fq.gz")
    
    # Check if both input files exist
    if (file.exists(read1) && file.exists(read2)) {
      # Define output prefix specific for each sample
      outputPrefix <- paste0("fastp_", sample)
      
      # Define output directory and file names
      output_forward_paired <- file.path(output_dir, paste0(outputPrefix, "_forward_paired.fq.gz"))
      output_reverse_paired <- file.path(output_dir, paste0(outputPrefix, "_reverse_paired.fq.gz"))
      
      # Run the rfastp function
      rfastp(
        read1 = read1,
        read2 = read2,
        outputFastq = outputPrefix,
        trimTailRead1 = 3,
        trimTailRead2 = 3
      )
    } else {
      # Print a message if files do not exist
      message("Files for sample ", sample, " do not exist: ", read1, ", ", read2)
    }
  } else {
    # Print a message if sample is not in sample_list2
    message("Sample ", sample, " is not in sample_list2")
  }
}