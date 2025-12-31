#!/bin/csh
#PBS -q SQUID
#PBS --group=******
#PBS -l elapstim_req=120:00:00
#PBS -l cpunum_job=76
#PBS -l gpunum_job=1
#PBS -v OMP_NUM_THREADS=76
#PBS -M mail@mail.com
#PBS -m eb
#PBS -o output-1
#PBS -e error
module load BaseGPU
setenv OMP_STACKSIZE 16M
setenv OMP_NUM_THREADS 76
set sdir = /sqfs/work/group/user/2D/parallelizationMP/solver_blend/input
set ldir = /sqfs/work/group/user/2D/parallelizationMP/solver_blend
  set wdir = /sqfs/work/group/user/2D/parallelizationMP/ACE_HOME/3ddet/3dhyd_cyl
  set rdir = /sqfs/work/group/user/2D/parallelizationMP/work/h2air/jaxachem
  set wdir2 = /sqfs/work/group/user/2D/parallelizationMP/work/h2air/jaxachem
 cd $PBS_O_WORKDIR
 rm fort.*
 ln -s $wdir/h2o2_1dpr38t1400xxi5d-6_n28000.dat fort.51
 /usr/bin/time -p $ldir/det2D<$sdir/jaxachem.cnt
 cp $sdir/jaxachem.cnt input.dat
  mv fort.42 $wdir2/grid2d_1.dat
  mv fort.100 $wdir2/hist_2d_1.dat
  mv fort.500 $wdir2/front_2d_1.dat
  mv fort.34  $wdir2/smk_2d_1.dat
  mv fort.15  $wdir2/outtime_1.dat
  mv fort.999  $wdir2/out_anim.dat
  mv fort.240 $wdir2/flow_2d_1.dat
  mv fort.66   $wdir2/post_2d_1_smk_grid.dat
  mv fort.701  $wdir2/post_2d_1_smk_pres.dat
  mv fort.731  $wdir2/post_2d_1_smk_heat.dat
  mv fort.761  $wdir2/post_2d_1_smk_spc.dat
  mv fort.68   $wdir2/post_2d_1_grid.dat
  mv fort.801  $wdir2/post_2d_1_flow.dat
