#!/bin/csh
#ifort -O3 -ipo -o dt1hans \
module load BaseCPU/2025
#gfortran -o dt1hans \
ifort -O3 -r8 -pg -o dt1hans \
  get_time.f dt1hans11-sgar15-4-5.f chmimp10_modify_sgar15-4-5.f rhsr_xi5.f muscl4.f ausmdv4.f
