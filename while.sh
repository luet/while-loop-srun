#! /bin/bash
#SBATCH -n 5
#SBATCH -t 0:5:0

while read a b c
do
    srun --exclusive -n 1 ./code.sh $a $b $c > $a-$b-$c.out &
done < parameters.dat

wait
