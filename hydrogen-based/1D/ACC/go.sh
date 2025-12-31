#!/bin/csh
#PBS -q SQUID
#PBS --group=******
##PBS -v OMP_NUM_THREADS=8
#PBS -l elapstim_req=24:00:00
#PBS -l cpunum_job=76
#PBS -l gpunum_job=1
#PBS -v OMP_NUM_THREADS=76
#PBS -M mail@mail.com
#PBS -m eb
#PBS -o output-1
#PBS -e error-1
module load BaseGPU/2025
setenv OMP_STACKSIZE 16M
cd $PBS_O_WORKDIR
rm fort.*
rm nsys-report.nsys-rep
rm nsys-report.sqlite
rm gmon.out
# === Run with Nsight Systems for GPU/CPU timeline ===
/usr/bin/time -p nsys profile -t cuda,openacc -o nsys-report ./dt1hans < input.cnt
# === Extract textual Nsight summaries ===
nsys stats nsys-report.nsys-rep > profile_nsys_summary.txt
nsys stats --report openacc_sum nsys-report.nsys-rep >> profile_nsys_summary.txt
nsys stats --report cuda_gpu_kern_sum nsys-report.nsys-rep >> profile_nsys_summary.txt
nsys stats --report cuda_gpu_mem_time_sum nsys-report.nsys-rep >> profile_nsys_summary.txt
nsys stats --report cuda_api_gpu_sum nsys-report.nsys-rep >> profile_nsys_summary.txt
nsys stats --report cuda_kern_exec_sum nsys-report.nsys-rep >> profile_nsys_summary.txt
