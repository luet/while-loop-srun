#! /bin/bash
#SBATCH -N 2
#SBATCH --ntasks-per-node=4
#SBATCH -c 2
#SBATCH -t 0:5:0


while read i j
do
    srun --exclusive -N 1 -n 2 ./code.sh $i $j > $i-$j.out &
done < parameters.dat

wait
