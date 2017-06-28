#!/bin/bash
#SBATCH -J 1234567890_1234567890
#SBATCH -o xxx.out
#SBATCH -e err.err
#SBATCH -n 24
#SBATCH -p test
#SBATCH -t 15

aprun -n 12 prog 
