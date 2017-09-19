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
ExecStep $xv_path/bin/xsim single_port_blockram_testbench_time_impl -key {Post-Implementation:sim_1:Timing:single_port_blockram_testbench} -tclbatch single_port_blockram_testbench.tcl -log simulate.log
