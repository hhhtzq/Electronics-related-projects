#include "project.h"
AnalogIn Ain(p19);                      //def Analog input
float ADCdata;                          //init float to store temp there
float getVoltage()                      //method which returns the voltage
{
    for (int i=0; i<=19; i++) {         //make 20 measurements
        ADCdata=ADCdata+Ain;            //sum this 20 measurements
    }          
    ADCdata=(ADCdata*3.3)/20;           //multiply 3.3 for voltage, divide by 20 Measure values
    return ADCdata;                     //return the average voltage
}
