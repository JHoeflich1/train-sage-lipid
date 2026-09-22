#!/bin/bash
#SBATCH -J msm_filtered
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --partition=blanca-shirts
#SBATCH --qos=blanca-shirts
#SBATCH --account=blanca-shirts
#SBATCH -t 10:00:00
#SBATCH --export ALL
#SBATCH -o msm.out
#SBATCH -e msm.err
date
hostname

source ~/.bashrc
ml anaconda
conda activate ash-sage-refit-2  

mkdir -p output
mkdir -p working-directory

python create-msm-ff.py                                                                                     \
    --initial-force-field       "../01_generate-forcefield/output/initial-force-field.offxml"  \
    --optimization-dataset      "../02_curate-data/output/optimization-training-set.json"                   \
    --working-directory         "working-directory"                                                         \
    --output                    "output/initial-force-field-msm.offxml" \
    --verbose

date
