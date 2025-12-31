#!/bin/csh
#
#PBS -q SQUID
#PBS --group=fg0036
#PBS -l elapstim_req=24:00:00
#PBS -l cpunum_job=75
##PBS -M mail@mail.com
#PBS -m eb
#PBS -e error-1
#PBS -o output-1
#source /etc/profile.d/modules.csh
module load BaseCPU/2025
setenv F_UFMTENDIAN 77
setenv OMP_NUM_THREADS 75
cd $PBS_O_WORKDIR
rm fort.*
rm gmon.out
# === Run with Nsight Systems for GPU/CPU timeline ===
/usr/bin/time -p ./dt1hans < input.cnt
# ./dt1hans<input.cnt
gprof ./dt1hans gmon.out > funcprofile.txt
