This code demonstrates how to run multiple single-core jobs within a
single SLURM script using a loop to go through a set of parameters.

Files
=====

-   `code.sh`: prints the start time, sleeps for 10 s, and print the
    exit time.
-   `parameters.sh`: this is a space-separated 3-column file with the
    parameters.
-   `while.sh`: the SLURM script.

Usage
=====

1.  Submit the job with:

    ``` {.example}
    sbatch while.sh
    ```

2.  This will create files with `.out` extension (e.g. `01-02-03.out`).

3.  In the current example which requests 5 cores for 8 parameters, you
    can check that a first batch of 5 jobs are running at the same time,
    then the remaining 3 jobs are run.
