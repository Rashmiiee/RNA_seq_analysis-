setwd("/Users/rashmirao/Documents/Sidra_Externship/RNAseq/RNA_seq_analysis/results/DEseq2_3")
# Load the count data
countdata <- read.table("FeatureCounts.txt", header=TRUE, row.names=1)

countdata <- countdata[ ,6:ncol(countdata)]
new_colnames <- c("SRR18396491", "SRR18396493", "SRR18396494", "SRR18396495", "SRR18396500", "SRR18396512")
colnames(countdata) <- new_colnames

# Convert count data to matrix
countdata <- as.matrix(countdata)

# Identify non-numeric values
# Create a logical matrix where TRUE indicates non-numeric values
is_non_numeric <- !sapply(countdata, is.numeric)

# Extract non-numeric values
non_numeric_values <- countdata[is_non_numeric]

# Print non-numeric values and their locations
if (any(is_non_numeric)) {
  print("Non-numeric values found in countdata:")
  non_numeric_locations <- which(is_non_numeric, arr.ind = TRUE)
  for (loc in 1:nrow(non_numeric_locations)) {
    row <- non_numeric_locations[loc, 1]
    col <- non_numeric_locations[loc, 2]
    print(paste("Row:", row, "Column:", col, "Value:", countdata[row, col]))
  }
} else {
  print("All values in countdata are numeric.")
}

countdata_df <- as.data.frame(countdata)

# Save the data frame to a CSV file
write.csv(countdata_df, file = "/Users/rashmirao/Documents/Sidra_Externship/RNAseq/RNA_seq_analysis/results/DEseq2_3/countdata.csv", row.names = TRUE)

