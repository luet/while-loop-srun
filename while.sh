#! /bin/bash
#SBATCH -N 2
#SBATCH --ntasks-per-node=4
#SBATCH -t 0:5:0

# This runs 2 jobs that each has 2 MPI tasks on 2 nodes simultaneously
module load intel/2021.1.2 intel-mpi/intel/2021.1.1

dirs=(1 2 3 4)
temps=(a b c d)

for i in "${dirs[@]}"
do
    for j in "${temps[@]}"
    do
	srun --exclusive -N 1 -n 2 ./hello $i $j > $i-$j.out &
    done
done

wait
