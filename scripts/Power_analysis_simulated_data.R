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

# Function to simulate RNA-seq data based on a DESeqDataSet object
simulate_data <- function(dds, effect_size, n_simulations) {
  results_list <- list()
  
  for (i in 1:n_simulations) {
    # Simulate counts based on the negative binomial distribution
    counts <- matrix(nrow=nrow(dds), ncol=ncol(dds))
    for (j in 1:nrow(dds)) {
      mu <- counts(dds)[j, ]
      disp <- dispersions(dds)[j]
      # Handle infinite or NA dispersion values
      if (is.infinite(disp) || is.na(disp)) {
        disp <- 1
      }
      # Simulate counts, adding effect size for condition B
      counts[j, ] <- rnbinom(ncol(dds), mu=mu * effect_size, size=1/disp)
    }
    
    # Ensure no NA values in counts
    counts[is.na(counts)] <- 0
    
    # Create a new DESeqDataSet object with simulated counts
    col_data <- colData(dds)
    sim_dds <- DESeqDataSetFromMatrix(countData=counts, colData=col_data, design=design(dds))
    sim_dds <- estimateSizeFactors(sim_dds)
    sim_dds <- estimateDispersions(sim_dds)
    sim_dds <- DESeq(sim_dds)
    
    # Store results
    res <- results(sim_dds)
    results_list[[i]] <- res
  }
  
  return(results_list)
}

# Function to calculate power
calculate_power <- function(results_list, alpha, effect_size) {
  detected <- 0
  for (res in results_list) {
    res$padj[is.na(res$padj)] <- 1
    detected <- detected + sum(res$padj < alpha & abs(res$log2FoldChange) > log2(effect_size))
  }
  power <- detected / (length(results_list) * nrow(res))
  return(power)
}

# Parameters for power analysis
effect_size <- 1.5  # Expected fold change
n_simulations <- 100
alpha <- 0.05

# Simulate data and calculate power
simulated_results <- simulate_data(dds, effect_size, n_simulations)
power_result <- calculate_power(simulated_results, alpha, effect_size)

print(paste("Estimated power:", power_result))

