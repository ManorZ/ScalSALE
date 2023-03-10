#!/bin/bash

#vtune
type=hotspots
#type=memory-consumption
#type=uarch-exploration
#type=memory-access
# type=threading
# type=hpc-performance
#type=system-overview
#type=graphics-rendering
#type=io
#type=fpga-interaction
#type=gpu-offload
# type=gpu-hotspots
#type=throttling
#type=platform-profiler
#type=cpugpu-concurrency
#type=tsx-exploration
#type=tsx-hotspots
#type=sgx-hotspots

# export I_MPI_F90=ifort
source /opt/intel/inteloneapi/setvars.sh

echo `mpif90 -v`

rm -r vtune_data

echo "Vtune Collect $type"
vtune -collect $type -result-dir vtune_data $(pwd)/run1.sh

echo "Vtune Summary Report"
vtune -report summary -result-dir vtune_data -format html -report-output $(pwd)/summary1/${type}.html
