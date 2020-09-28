#include "Task5_1.h"
AnalogIn Ain(p19);
float ADCdata;
float getVoltage()
{
    for (int i=0; i<=19; i++) {
        ADCdata=ADCdata+Ain;            //sum 20 samples
    }                                 
    ADCdata=(ADCdata*3.3)/20;           //multiply 3.3 for voltage, divide by 20 Measure values
    return ADCdata;
}
