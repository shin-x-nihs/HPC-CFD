#!/bin/csh
#
#PBS -q SQUID
#PBS --group=******
#PBS -l elapstim_req=24:00:00
#PBS -l cpunum_job=1
#PBS -M mail@mail.com
#PBS -m eb
#PBS -e error-1
#PBS -o output-1
#source /etc/profile.d/modules.csh
module load BaseCPU/2025
setenv F_UFMTENDIAN 77
# setenv OMP_NUM_THREADS 1
# setenv OMP_PROC_BIND true
# setenv MKL_NUM_THREADS 1
# setenv OPENBLAS_NUM_THREADS 1
# setenv BLIS_NUM_THREADS 1
cd $PBS_O_WORKDIR
rm fort.*
rm gmon.out
# === Run with Nsight Systems for GPU/CPU timeline ===
/usr/bin/time -p ./dt1hans < input.cnt
# ./dt1hans<input.cnt
gprof ./dt1hans gmon.out > funcprofile.txt
