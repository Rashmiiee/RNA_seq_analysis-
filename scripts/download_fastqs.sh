#!/bin/bash

# Define the directory where you want to save the files
output_dir="/Users/rashmirao/Desktop/RNA seq analysis"

# Function to download a file if it does not exist
download_if_not_exists() {
    local url=$1
    local file_name=$(basename "$url")
    local output_file="$output_dir/$file_name"
    
    if [ ! -f "$output_file" ]; then
        curl -o "$output_file" "$url"
    else
        echo "File $output_file already exists, skipping download."
    fi
}

# List of URLs to download
urls=(
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR183/093/SRR18396493/SRR18396493_2.fastq.gz"
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR183/000/SRR18396500/SRR18396500_2.fastq.gz"
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR183/095/SRR18396495/SRR18396495_1.fastq.gz"
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR183/095/SRR18396495/SRR18396495_2.fastq.gz"
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR183/000/SRR18396500/SRR18396500_1.fastq.gz"
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR183/012/SRR18396512/SRR18396512_1.fastq.gz"
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR183/094/SRR18396494/SRR18396494_2.fastq.gz"
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR183/093/SRR18396493/SRR18396493_1.fastq.gz"
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR183/091/SRR18396491/SRR18396491_1.fastq.gz"
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR183/091/SRR18396491/SRR18396491_2.fastq.gz"
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR183/094/SRR18396494/SRR18396494_1.fastq.gz"
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR183/012/SRR18396512/SRR18396512_2.fastq.gz"
)

# Create the output directory if it does not exist
mkdir -p "$output_dir"

# Download each file if it does not exist
for url in "${urls[@]}"; do
    download_if_not_exists "$url"
done

 
