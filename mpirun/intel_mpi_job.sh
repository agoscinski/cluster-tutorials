#!/bin/bash
#SBATCH --get-user-env
#SBATCH --exclusive 
#SBATCH --partition=jobs
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=2
#SBATCH --time=01:00:00
#SBATCH --mem=10000

module purge
module load intel
module load intel-mkl
module load intel-mpi

# required only in the first run to compile benchmarks
git clone https://github.com/intel/mpi-benchmarks
cd mpi-benchmarks
export CC=mpiicc
export CXX=mpiicpc
make
#

# runs the benchmark for [1, 2, 4, 8] tasks
srun -n 8 IMB-MPI1
# see for more information
# https://software.intel.com/content/www/us/en/develop/documentation/imb-user-guide/top/getting-started/running-intel-mpi-benchmarks.html

exit 0
