#!/bin/bash

# Define the main directory
main_dir="/Users/rashmirao/Documents/Sidra_Externship/RNAseq/RNA_seq_analysis/results/1_fastqc"

# Define the new folder path
adapters_dir="$main_dir/adapters"

# Create the new folder if it doesn't exist
mkdir -p "$adapters_dir"
# Find all files named 'fastqc_data.txt' and move them to the adapters folder
find "$main_dir" -type f -name 'fastqc_data.txt' -exec mv {} "$adapters_dir" \;

# Find all zipped files containing 'fastqc_data.txt', unzip them, and move them to the adapters folder
find "$main_dir" -type f -name '*.zip' | while read -r zipfile; do
    if unzip -l "$zipfile" | grep -q 'fastqc_data.txt'; then
        unzip -p "$zipfile" '*fastqc_data.txt' > "$adapters_dir/$(basename "$zipfile" .zip)_fastqc_data.txt"
    fi
done

# Process each file in the adapters folder
for file_path in "$adapters_dir"/*fastqc_data.txt; do
    echo "Processing file: $file_path"
    
    # Extract the content between the specified phrases and print to terminal
    awk '
    />>Overrepresented sequences/{flag=1; next}
    />>END_MODULE/{flag=0}
    flag
    ' "$file_path"
    
    echo "-----------------------------------------"
done

# Delete unzipped files in the main_dir that do not end with .html
find "$main_dir" -type f ! -name '*.zip' ! -name '*.html' -delete
