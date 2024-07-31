
#!/bin/bash

# Define variables
GENOME_DIR="/Users/rashmirao/Documents/Sidra_Externship/RNAseq/RNA_seq_analysis/raw_data/S288C_reference_genome_R64-5-1_20240529/index"
GTF_FILE="/Users/rashmirao/Documents/Sidra_Externship/RNAseq/RNA_seq_analysis/raw_data/S288C_reference_genome_R64-5-1_20240529/yeast.gtf"
OUT_PREFIX="alignments/output_"
THREADS=4
FILES=(
    "fastp_SRR18396491_R1.fastq fastp_SRR18396491_R2.fastq"
    "fastp_SRR18396493_R1.fastq fastp_SRR18396493_R2.fastq"
    "fastp_SRR18396494_R1.fastq fastp_SRR18396494_R2.fastq"
    "fastp_SRR18396495_R1.fastq fastp_SRR18396495_R2.fastq"
    "fastp_SRR18396500_R1.fastq fastp_SRR18396500_R2.fastq"
    "fastp_SRR18396512_R1.fastq fastp_SRR18396512_R2.fastq"
)

# Loop through file pairs
for i in "${!FILES[@]}"; do
    PAIR=(${FILES[$i]})
    R1=${PAIR[0]}
    R2=${PAIR[1]}
    PREFIX="${OUT_PREFIX}${i}_"

    echo "Processing pair: $R1 $R2"
    /Applications/software_bioinformatics/STAR/bin/MacOSX_x86_64/STAR --genomeDir "$GENOME_DIR" \
        --readFilesIn "$R1" "$R2" \
        --sjdbGTFfile "$GTF_FILE" \
        --outFileNamePrefix "$PREFIX" \
        --runThreadN "$THREADS" \
        --outSAMtype BAM SortedByCoordinate
done
