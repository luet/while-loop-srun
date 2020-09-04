#! /bin/bash
#SBATCH -N 1
#SBATCH -n 5
#SBATCH -t 0:5:0

while read a b c
do
    srun -n 1 ./code.sh $a $b $c > $a-$b-$c.out &
done < parameters.dat

wait
