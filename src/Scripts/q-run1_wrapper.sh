#!/bin/bash

# original_dir=$1
# tag=$2
# compiler=$3

original_dir=ifort_serial/o0/march13
original_dir=ifort_serial/o2/march13
original_dir=ifort_serial/o3/march13
tag=q
#tag=""
compiler=ifort

echo "-----------------------------------------------------------------------------------------------------"
echo "dir=${original_dir} tag=${tag} compiler=${compiler}"
echo "-----------------------------------------------------------------------------------------------------"

echo `lscpu | grep "^Model name:"`
echo `lscpu | grep "^CPU(s):"`
echo `lscpu | grep "^On-line CPU(s) list:"`
echo `lscpu | grep "^Thread(s) per core:"`
echo `lscpu | grep "^Core(s) per socket:"`
echo `lscpu | grep "^Socket(s):"`
echo `lscpu | grep "^NUMA node(s):"`
echo `lscpu | grep "^L1d cache:"`
echo `lscpu | grep "^L1i cache:"`
echo `lscpu | grep "^L2 cache:"`
echo `lscpu | grep "^L3 cache:"`
echo `cat /proc/meminfo | grep "^MemTotal"`

if [ $compiler == "gnu" ]; then
  echo "-----------------------------------------------------------------------------------------------------"
  echo "compiling with gnu"
  echo "-----------------------------------------------------------------------------------------------------"
  source /opt/intel/inteloneapi/setvars.sh
  mpif90 -v
elif [ $compiler == "ifort" ]; then
  echo "-----------------------------------------------------------------------------------------------------"
  echo "compiling with ifort"
  echo "-----------------------------------------------------------------------------------------------------"
  export I_MPI_F90=ifort
  source /opt/intel/inteloneapi/setvars.sh
  mpif90 -v
else
  echo "-----------------------------------------------------------------------------------------------------"
  echo "unknown compiler!"
  echo "-----------------------------------------------------------------------------------------------------"
  exit 1
fi

echo "-----------------------------------------------------------------------------------------------------"
echo "cd ~/json-fortran/build"
echo "-----------------------------------------------------------------------------------------------------"
cd ~/json-fortran/build
echo "-----------------------------------------------------------------------------------------------------"
echo "pwd"
echo "-----------------------------------------------------------------------------------------------------"
pwd

rm ./* -r

echo "-----------------------------------------------------------------------------------------------------"
echo "-cmake"
echo "-----------------------------------------------------------------------------------------------------"
FC=mpif90 cmake ../

echo "-----------------------------------------------------------------------------------------------------"
echo "-make"
echo "-----------------------------------------------------------------------------------------------------"
make

echo "-----------------------------------------------------------------------------------------------------"
echo "cd ~/ScalSALE/src/Scripts"
echo "-----------------------------------------------------------------------------------------------------"
cd ~/ScalSALE/src/Scripts
echo "-----------------------------------------------------------------------------------------------------"
echo "pwd"
echo "-----------------------------------------------------------------------------------------------------"
pwd

echo "-----------------------------------------------------------------------------------------------------"
echo "-clean"
echo "-----------------------------------------------------------------------------------------------------"
./clean.sh
echo "-----------------------------------------------------------------------------------------------------"
echo "-run1"
echo "-----------------------------------------------------------------------------------------------------"
./run1.sh

echo "-----------------------------------------------------------------------------------------------------"
echo "-mv q-run1_wrapper.sh.e* ${original_dir}/q-run1_wrapper_${tag}.sh.e*"
mv q-run1_wrapper.sh.e* ${original_dir}/q-run1_wrapper_${tag}.sh.e*
echo "mv q-run1_wrapper.sh.o* ${original_dir}/q-run1_wrapper_${tag}.sh.o*"
mv q-run1_wrapper.sh.o* ${original_dir}/q-run1_wrapper_${tag}.sh.o*
echo "mv total_cell_mass_result.txt ${original_dir}/total_cell_mass_result_${tag}.txt"
mv total_cell_mass_result.txt ${original_dir}/total_cell_mass_result_${tag}.txt
echo "mv total_pressure_result.txt ${original_dir}/total_pressure_result_${tag}.txt"
mv total_pressure_result.txt ${original_dir}/total_pressure_result_${tag}.txt
echo "mv total_sie_result.txt ${original_dir}/total_sie_result_${tag}.txt"
mv total_sie_result.txt ${original_dir}/total_sie_result_${tag}.txt
echo "mv velocity_result.txt ${original_dir}/velocity_result_${tag}.txt"
mv velocity_result.txt ${original_dir}/velocity_result_${tag}.txt
echo "mv runtime_150_1.txt ${original_dir}/runtime_150_1_${tag}.txt"
mv runtime_150_1.txt ${original_dir}/runtime_150_1_${tag}.txt
echo "-----------------------------------------------------------------------------------------------------"