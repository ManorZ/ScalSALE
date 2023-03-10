#!/bin/bash

echo "----------------------------------------------------------"
echo "MPI F90 Version (Before setvars.sh):"
echo "----------------------------------------------------------"
echo `mpif90 -v`
echo "----------------------------------------------------------"

# export I_MPI_F90=ifort
source /opt/intel/inteloneapi/setvars.sh

echo "----------------------------------------------------------"
echo "MPI F90 Version (After setvars.sh):"
echo "----------------------------------------------------------"
echo `mpif90 -v`
echo "----------------------------------------------------------"

echo "----------------------------------------------------------"
echo "./clean.sh"
rm clean.out clean.err
# rm ../exec/main
# rm -rf ../../build/*
./clean.sh 2> clean.err 1> clean.out
return_val=$?
echo "RETURN VAL=$return_val"
echo "----------------------------------------------------------"

compiler=`grep "^\-\- The Fortran compiler identification is .*$" clean.out`
echo "----------------------------------------------------------"
echo $compiler 
echo "----------------------------------------------------------"
if [[ $compiler == *"GNU"* ]]; then
  echo "----------------------------------------------------------"
  echo "This Is GNU Compiler! (Not Intel!)"
  echo "----------------------------------------------------------"
fi
if [[ $compiler == *"Intel"* ]]; then
  echo "----------------------------------------------------------"
  echo "This Is Intel Compiler! (Not GNU!)"
  echo "----------------------------------------------------------"
fi

echo "----------------------------------------------------------"
echo "./run1.sh"
rm run1.out run1.err
./run1.sh 2> run1.err 1> run1.out
return_val=$?
echo "RETURN VAL=$return_val"
echo "----------------------------------------------------------"