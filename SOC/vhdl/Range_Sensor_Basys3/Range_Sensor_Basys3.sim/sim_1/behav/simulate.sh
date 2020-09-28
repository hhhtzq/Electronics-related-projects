#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2017.1"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim Range_Sensor_behav -key {Behavioral:sim_1:Functional:Range_Sensor} -tclbatch Range_Sensor.tcl -log simulate.log
