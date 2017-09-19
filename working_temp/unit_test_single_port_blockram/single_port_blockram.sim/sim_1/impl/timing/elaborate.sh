#!/bin/bash -f
xv_path="/home/pobu/tools/vivado/Vivado/2016.4"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto 62f750f61a38423c8dc6edb67b8b8d95 -m64 --debug typical --relax --mt 8 --maxdelay -L xil_defaultlib -L simprims_ver -L secureip --snapshot single_port_blockram_testbench_time_impl -transport_int_delays -pulse_r 0 -pulse_int_r 0 -pulse_e 0 -pulse_int_e 0 xil_defaultlib.single_port_blockram_testbench xil_defaultlib.glbl -log elaborate.log
