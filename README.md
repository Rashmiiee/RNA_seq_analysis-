
12th Jun 2024

An end -to-end RNAseq data analysis template for Differential Gene Expression analysis.

Data description: Transcriptome profiles of yeast cells transformed with plasmid containing BRCA2 gene and Yeast cells transformed with a control plasmid (pYes) lacking the BRCA2 gene.

Data is taken from study doi:10.3389/fonc.2022.908442

Analysis guide : https://github.com/Rashmiiee/RNA_seq_analysis-/blob/main/RNAseq%20map.pdf

The version of tools and software used is stored in scripts/tools_and_versions.txt

*fastq files are not present in folder and need to be downloaded using steps from the analysis scripts and file paths need to be changed accordingly in the scripts.

For queries, email - rashmirao962@gmail.com

RNA seq analysis folders
.
├── README.txt.rtf
├── RNAseq map.pdf
├── logs
│   ├── STAR_index_ReferenceGenomeLog.out
│   └── index rel
├── meta
│   ├── DataSheet_1_supplementary.docx
│   ├── FastQC_interpretation.pdf
│   ├── Illumina Adapter sequences.pdf
│   ├── Image from supplementary 2.TIF
│   ├── Image from supplementary 3.TIF
│   ├── Quality control Reference.pdf
│   ├── STARmanual.pdf
│   ├── adjust_for_covariates
│   └── supplementary material GO.xlsx
├── raw_data
│   ├── S288C_reference_genome_R64-5-1_20240529
│   └── fastq
├── results
│   ├── 1_fastqc
│   ├── 1_multiqc_data
│   ├── 2_fastqc
│   ├── 2_multiqc_data
│   ├── 3_fastp_res
│   ├── 4_corrected_fastqc
│   ├── 5_uncorrected_fastqc
│   ├── DEseq2
│   ├── FeatureCounts
│   ├── GeneBodyCoverage output
│   ├── Infer experiment output
│   └── Qualimap
└── scripts
    ├── DESeq2.R
    ├── Power_analysis_real_data.R
    ├── Power_analysis_simulated_data.R
    ├── all_samples.sh
    ├── batch_FeatureCounts.sh
    ├── batch_fastqc.sh
    ├── batch_qualimap.sh
    ├── batch_trimmomatic.py
    ├── batch_trimmomatic2.py
    ├── check_countdata.R
    ├── create_ubams.sh
    ├── cut_adapt.sh
    ├── download_fastqs.sh
    ├── get_adapters.sh
    ├── get_bam_index.sh
    ├── matic_to_fastp.R
    ├── matic_to_fastp2.R
    ├── run_infer_experiment.sh
    ├── run_star_alignment.sh
    └── tools_and_versions.txt
    ├── matic_to_fastp2.R
    ├── run_infer_experiment.sh
    ├── run_star_alignment.sh
    └── tools_and_versions.txt

