#! /bin/bash

dir1=$1
dir2=$2

diff ${dir1}/total_cell_mass_result_.txt ${dir2}/total_cell_mass_result_.txt
diff ${dir1}/total_pressure_result_.txt ${dir2}/total_pressure_result_.txt
diff ${dir1}/total_sie_result_.txt ${dir2}/total_sie_result_.txt
diff ${dir1}/velocity_result_.txt ${dir2}/velocity_result_.txt
