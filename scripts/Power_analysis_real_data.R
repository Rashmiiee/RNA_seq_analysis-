# Set working directory
setwd("/Users/rashmirao/Documents/Sidra_Externship/RNAseq/RNA_seq_analysis/results/DEseq2_3")

# Load count data
countdata <- read.table("FeatureCounts.txt", header=TRUE, row.names=1)
countdata <- countdata[ ,6:ncol(countdata)]
new_colnames <- c("SRR18396491", "SRR18396493", "SRR18396494", "SRR18396495", "SRR18396500", "SRR18396512")
colnames(countdata) <- new_colnames

# Convert count data to matrix and remove NA values
countdata <- as.matrix(countdata)
countdata[is.na(countdata)] <- 0

# Print the first few rows and dimensions to verify
head(countdata)
dim(countdata)

# Define condition factor
condition <- factor(c("w/o BRCA2", "w/o BRCA2", "with BRCA2", "w/o BRCA2", "w/o BRCA2", "with BRCA2"))

# Print the conditions to verify
print(condition)

# Load DESeq2 library
library(DESeq2)

# Create DESeq2 coldata and DESeqDataSet object
coldata <- data.frame(row.names=colnames(countdata), condition)
dds <- DESeqDataSetFromMatrix(countData=countdata, colData=coldata, design=~condition)

# Run DESeq2 analysis
dds <- DESeq(dds)

# Check if DESeq2 analysis is completed
if (!"results" %in% ls()) {
  stop("DESeq2 analysis did not complete successfully.")
}

# Perform differential expression analysis
res <- results(dds)

# Print summary of results to verify
print(summary(res))

# Function to calculate power based on actual data
calculate_power_from_real_data <- function(res, alpha, effect_size) {
  # Ensure no NA values in adjusted p-values
  res$padj[is.na(res$padj)] <- 1
  
  # Calculate the number of detected differentially expressed genes
  detected <- sum(res$padj < alpha & abs(res$log2FoldChange) > log2(effect_size))
  
  # Calculate power
  power <- detected / nrow(res)
  
  return(power)
}

power_result <- calculate_power_from_real_data(res, alpha, effect_size)

power_result





