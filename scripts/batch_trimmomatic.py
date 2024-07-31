#!/usr/bin/env python

"""
Script Name: example.py
Author: Your Name
Date: YYYY-MM-DD
Description: This script demonstrates the basic structure of a Python script.
"""
import os
import subprocess

current_directory = os.getcwd()
files = os.listdir(current_directory)

# Filter files that end with .fastq.gz
fastq_files = [f for f in files if f.endswith('.fastq.gz')]

# Print the list of fastq.gz files
print(fastq_files)


file_path = '/Users/rashmirao/Documents/Sidra_Externship/RNAseq/RNA_seq_analysis/scripts/trial/sample_list.txt'

with open(file_path, 'r') as file:
    sample_list = [line.strip().strip(',') for line in file]

# Print the list
print(sample_list)

for i in sample_list:
    r1 = i + "_1.fastq.gz"
    r2 = i + "_2.fastq.gz"
    if r1 and r2 in fastq_files:
        base_name = os.path.commonprefix([r1, r2]).rsplit('_', 1)[0]
    
        # Define the output file names
        output_forward_paired = f"{base_name}_forward_paired.fq.gz"
        output_forward_unpaired = f"{base_name}_forward_unpaired.fq.gz"
        output_reverse_paired = f"{base_name}_reverse_paired.fq.gz"
        output_reverse_unpaired = f"{base_name}_reverse_unpaired.fq.gz"
        
        # Define the command as a list of arguments
        command = [
            "java", "-jar", "/Applications/software_bioinformatics/Trimmomatic-0.39/trimmomatic-0.39.jar", "PE",
            r1,
            r2,
            output_forward_paired,
            output_forward_unpaired,
            output_reverse_paired,
            output_reverse_unpaired,
            "ILLUMINACLIP:ada.fa:2:30:5:2",
            "HEADCROP:12",
            "SLIDINGWINDOW:5:20",
            "MINLEN:35"
        ]
        
        # Run the command
        result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        
        # Print the output and error (if any)
        print("STDOUT:")
        print(result.stdout.decode('utf-8'))
        print("STDERR:")
        print(result.stderr.decode('utf-8'))


command = "rm *unpaired.fq.gz"

# Execute the command
try:
    subprocess.run(command, shell=True, check=True)
    print("Deletion successful.")
except subprocess.CalledProcessError as e:
    print(f"Error: {e}")