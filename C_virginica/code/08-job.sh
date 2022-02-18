#!/bin/bash
## Job Name
#SBATCH --job-name=vcf_merge
## Allocation Definition
#SBATCH --account=srlab
#SBATCH --partition=srlab
## Nodes
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=10-00:00:00
## Memory per node
#SBATCH --mem=100G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
#SBATCH --chdir=/gscratch/scrubbed/sr320/021722-vcfmerge



# Directories and programs
bismark_dir="/gscratch/srlab/programs/Bismark-0.22.3/"
bowtie2_dir="/gscratch/srlab/programs/bowtie2-2.3.4.1-linux-x86_64/"
samtools="/gscratch/srlab/programs/samtools-1.9/samtools/"
reads_dir="/gscratch/srlab/sr320/data/cvirg/"
fastqc="/gscratch/srlab/programs/fastqc_v0.11.9/fastqc"
genome_folder="/gscratch/srlab/sr320/data/Cvirg-genome/"
bcftools_dir="/gscratch/srlab/programs/bcftools-1.9/"
htlslib_dir="/gscratch/srlab/programs/htslib-1.9/"

source /gscratch/srlab/programs/scripts/paths.sh

# 
# Ah sorry, I always forget about this with bcftools.
# 
#Loop through files and compress like this:
# 
# bcftools view -Oz -o compressed.vcf.gz plain.vcf
# htsfile compressed.vcf.gz
# bcftools index compressed.vcf.gz




# FILES=$(ls *vcf)
# 
# for file in ${FILES}
# do
#     NAME=$(echo ${file} | awk -F "." '{print $1}')
#     echo ${NAME}
#   
#     /gscratch/srlab/programs/bcftools-1.9/bcftools view  -O z -o ${NAME}.compressed.vcf.gz \
#     ${NAME}.SNP-results.vcf 
#     /gscratch/srlab/programs/htslib-1.9/htsfile ${NAME}.compressed.vcf.gz
#     /gscratch/srlab/programs/bcftools-1.9/bcftools index ${NAME}.compressed.vcf.gz
# done





# 
# 
# /gscratch/srlab/programs/bcftools-1.9/bcftools  merge \
# 12M_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 44F_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 13M_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 48M_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 16F_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 50F_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 19F_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 52F_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 22F_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 53F_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 23M_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 54F_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 29F_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 59M_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 31M_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 64M_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 35F_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 6M_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 36F_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 76F_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 39F_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 77F_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 3F_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 7M_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 41F_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# 9M_R1_val_1_bismark_bt2_pe.compressed.vcf.gz \
# --merge all \
# --threads 20 \
# -O v \
# -o Cv_10x_merged.vcf



/gscratch/srlab/programs/vcftools-0.1.16/bin/vcftools \
--vcf Cv_10x_merged.vcf \
--recode --recode-INFO-all \
--min-alleles 2 --max-alleles 2 \
--max-missing 0.5 \
--mac 2 \
--out Cv_10x_merged.filtered




