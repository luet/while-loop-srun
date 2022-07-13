#! /bin/bash
LOG="log.out"

rm -f $LOG

for f in `ls -1tr ?-?.out`
do
    awk '{print $1}' $f | sort | uniq > PID.txt
    while read p
    do
	echo $f >> $LOG
	grep $p $f >> $LOG
    done < PID.txt
done

