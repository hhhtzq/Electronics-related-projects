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
ExecStep $xv_path/bin/xelab -wto ab4af72a5feb4968834565d3ef99b12f -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot Range_Sensor_behav xil_defaultlib.Range_Sensor -log elaborate.log
