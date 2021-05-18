#!/bin/bash

#SBATCH --get-user-env
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=2-00:00:00 
#SBATCH --job-name=notebook
#SBATCH --partition=jobs
#SBATCH --output=slurm.out
#SBATCH --exclusive

# Here you could use for virtual environment
# If not changed it automatically creates one, it should not be overwrited
python3 -m venv $HOME/venv/cluster-tutorial
source $HOME/venv/cluster-tutorial/bin/activate
python -m pip install --upgrade pip
pip install jupyter

printf "\n\nNODE_NAME: ${SLURM_JOB_NODELIST}\n\n"

jupyter notebook --no-browser -ip=0.0.0.0 --port=8889