#!/bin/bash

dir=$1
tag=$2

echo "dir=${dir} tag=${tag}"

./run1.sh
mv total_cell_mass_result.txt ${dir}/total_cell_mass_result_${tag}.txt
mv total_pressure_result.txt ${dir}/total_pressure_result_${tag}.txt
mv total_sie_result.txt ${dir}/total_sie_result_${tag}.txt
mv velocity_result.txt ${dir}/velocity_result_${tag}.txt
mv runtime_150_1.txt ${dir}/runtime_150_1_${tag}.txt

