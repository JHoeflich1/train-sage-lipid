#!/bin/bash
#SBATCH -J vdWFB
#SBATCH -J vdWFB
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --partition=blanca-shirts
#SBATCH --qos=blanca-shirts
#SBATCH --account=blanca-shirts
#SBATCH --gres=gpu
#SBATCH -t 7-00:00:00
#SBATCH --mem=10000mb
#SBATCH --export=ALL
#SBATCH -o vdW.out
#SBATCH -e vdW.err

# Load your environment
ml anaconda
source $HOME/.bashrc
conda activate evaluator-test-matt
#co-optimization-openmm-fix-cuda
#evaluator-cuda118
#ash-sage-evaluator
#ash-sage-evaluator-2 
#ash-sage-jul
#evaluator-050-NAGL2
#ash-sage-lily
#ash-sage-lily2
#ash-sage-refit-2
#evaluator-050
#evaluator-test-matt failed

export OE_LICENSE=/projects/juho8819/oe_license.txt
echo "OE_LICENSE is set to: $OE_LICENSE"

# Check CUDA availability
echo "Checking CUDA devices..."
nvidia-smi

# Run the Python script
python run_evaluator.py

echo "All done"

