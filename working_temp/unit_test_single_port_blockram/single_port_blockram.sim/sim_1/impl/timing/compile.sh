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
echo "xvlog -m64 --relax -prj single_port_blockram_testbench_vlog.prj"
ExecStep $xv_path/bin/xvlog -m64 --relax -prj single_port_blockram_testbench_vlog.prj 2>&1 | tee compile.log
