#!/bin/bash

dir=ifort_parallel/o3/no_simd/pgo/march19

for i in 1 2 3 4 5 
do
./run1.sh 2>&1 | tee          ${dir}/out${i}.txt
mv total_cell_mass_result.txt ${dir}/total_cell_mass_result${i}.txt
mv total_pressure_result.txt  ${dir}/total_pressure_result${i}.txt
mv total_sie_result.txt       ${dir}/total_sie_result${i}.txt
mv velocity_result.txt        ${dir}/velocity_result${i}.txt
mv runtime_150_1.txt          ${dir}/runtime_150_1_${i}.txt
done
