#!/bin/csh
rm outlist
module load BaseGPU
  nvfortran -O3 -mp -mcmodel=medium -byteswapio -gpu=cc80 -r8 -cpp -Minfo=accel \
     -o dt2hanson26_omp_i4801j1201_amb_10th_rk_twcns5_mu4i_llf_vi4_verbose2_tcnse\
     get_time.f module_nec.f \
     dt2jhans26-amb_rk10_vis.f tvdxi.f tvdet.f viscus.f  \
     chicf.f chmimp_ut_jaxa_v1.f ausmdv4.f muscl4.f rhsr_xi7.f rhsr_eta7_rk3.f \
     wcns5q_mod4.f \
     wcns3q_mod2.f wcns7q_mod2.f animps.f \
     ausmdv4_llf.f hllchll_llf.f flag_pres.f hllc_llf.f gforce.f musta1.f \
     gforcellf.f \
     diffm2.f diffm4.f diffm6.f diffm8.f diffm10.f \
     diffmn4.f diffmn6.f diffmn8.f diffmn10.f \
     wcns_tmet.f intere6v.f90 diffmn8a.f90 diffnn.f90 \
     uuinit.f viscus_wcns.f \
     flag_shock.f hllcplus.f hllcplus_llf.f wcns5q_mod4b.f

