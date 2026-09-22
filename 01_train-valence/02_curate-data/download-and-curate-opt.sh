#!/bin/bash
#SBATCH -J download_and_filter_opt
#SBATCH --partition=blanca-shirts
#SBATCH --qos=blanca-shirts
#SBATCH --account=blanca-shirts
#SBATCH -t 4-00:00:00
#SBATCH --nodes=1
#SBATCH --export ALL
#SBATCH -o download_and_filter_opt.out
#SBATCH -e download_and_filter_opt.err

date
hostname

source ~/.bashrc
ml anaconda
conda activate ash-sage-lily

mkdir -p counts
mkdir -p output

# Curated optimization-set run:
# - output/optimization-training-set-full-alkane-ene.json already contains the
#   alkane/ene optimization records.
# - only_download_opt_records.dat contains the selected optimization record IDs
#   from the 22 filtered molecules.
python curate-dataset.py generate-smirks \
    --input 			"output/optimization-training-set-full-alkane-ene.json" \
    --initial-forcefield 	"../01_generate-forcefield/output/initial-force-field.offxml" \
    --only-download-these-records "only_download_opt_records.dat" \
    --output-filtered-dataset "output/optimization-training-set.json" \
    --output-parameter-smirks	"output/training-valence-smirks.json" \
    --output-count-file   "counts/valence-counts.json" \
    --verbose
date
