#! /bin/bash
#SBATCH -N 2
#SBATCH -n 4
#SBATCH -t 0:5:0


dirs=(1 2 3 4)
temps=(a b c d )

for i in "${dirs[@]}";do
    for j in "${temps[@]}";do
	srun -n 2 ./code.sh $i $j > $i-$j.out &
    done
done
wait
