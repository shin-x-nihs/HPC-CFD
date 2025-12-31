#!/bin/csh
module load BaseGPU
nvfortran -O3 -acc -mcmodel=medium -byteswapio -gpu=cc80 -r8 -cpp -Minfo=accel -Mfixed -Minstrument -o dt1hans \
 modules.f get_time.f dt1hans11-sgar15-4-5.f chmimp10_modify_sgar15-4-5.f rhsr_xi5.f muscl4.f ausmdv4.f
