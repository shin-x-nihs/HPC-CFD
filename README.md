HPC-CFD: GPU & CPU Optimization Blueprint

This repository serves as a technical architecture and workflow demonstration for the parallelization of legacy hydrogen-based CFD solvers. 
The project evaluates the performance of directive-based programming models on the Osaka University SQUID Supercomputer.

📂 Repository Contents:
To respect research privacy, this repository contains the execution and compilation environment rather than the proprietary Fortran source code.
- BASE/: The original serial baseline configuration
- OMP/: Multi-core CPU optimization using OpenMP (Dynamic scheduling & SIMD)
- ACC/: GPU-accelerated version using OpenACC (NVIDIA A100 optimized)

🚀 Performance Benchmarks:
- GPU (OpenACC): Peak subroutine acceleration of 191.5x
- CPU (OpenMP): Maximum overall speedup of 45.8x on 76 cores
- Numerical Accuracy: Validated against serial baselines with RSD < 10**-3

🛠️ Usage Workflow:
The provided scripts demonstrate the professional HPC workflow used in this research:
- comp.sh: Compiler flags for nvfortran and ifort, detailing library linking and optimization levels
- go.sh: SQUID Supercomputer jobscripts (Scheduler configuration) for requesting A100 GPU nodes and configuring thread affinity
