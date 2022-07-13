#! /bin/bash
#SBATCH -N 2
#SBATCH --ntasks-per-node=4
#SBATCH -t 0:5:0

# This runs 2 jobs that each has 2 MPI tasks on 2 nodes simultaneously
module load intel/2021.1.2 intel-mpi/intel/2021.1.1

while read i j
do
    srun --exclusive -N 1 -n 2 ./hello $i $j > $i-$j.out &
done < parameters.dat

wait
