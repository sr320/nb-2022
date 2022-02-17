#!/bin/bash
## Job Name
#SBATCH --job-name=vcf_merge
## Allocation Definition
#SBATCH --account=coenv
#SBATCH --partition=coenv
## Nodes
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=10-00:00:00
## Memory per node
#SBATCH --mem=100G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
#SBATCH --chdir=/gscratch/scrubbed/sr320/021722-gen-cov



# Directories and programs
bismark_dir="/gscratch/srlab/programs/Bismark-0.22.3"
bowtie2_dir="/gscratch/srlab/programs/bowtie2-2.3.4.1-linux-x86_64/"
samtools="/gscratch/srlab/programs/samtools-1.9/samtools"
reads_dir="/gscratch/srlab/sr320/data/cvirg/"
fastqc="/gscratch/srlab/programs/fastqc_v0.11.9/fastqc"
genome_folder="/gscratch/srlab/sr320/data/Cvirg-genome/"

source /gscratch/srlab/programs/scripts/paths.sh

# 
# Ah sorry, I always forget about this with bcftools.
# 
# Loop through files and compress like this:
# 
# bcftools view -Oz -o compressed.vcf.gz plain.vcf
# htsfile compressed.vcf.gz
# bcftools index compressed.vcf.gz




cd /home/shared/8TB_HDD_01/sr320/github/nb-2022/C_virginica/analyses/bsnp01/

/home/shared/bcftools-1.14/bcftools merge \
12M_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
44F_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
13M_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
48M_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
16F_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
50F_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
19F_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
52F_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
22F_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
53F_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
23M_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
54F_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
29F_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
59M_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
31M_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
64M_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
35F_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
6M_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
36F_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
76F_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
39F_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
77F_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
3F_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
7M_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
41F_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
9M_R1_val_1_bismark_bt2_pe.SNP-results.vcf \
--merge all \
--threads 20 \
-O v \
-o /home/shared/8TB_HDD_01/sr320/github/nb-2022/C_virginica/analyses/5x_02_merged.vcf