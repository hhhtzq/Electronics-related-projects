
#include "mbed.h"
Serial pc(USBTX, USBRX);                  //enable serial port which links to USB
AnalogIn Ain(p20);
float ADCdata;
int main()
{
    pc.printf("ADC Data Values...\n\r");   //send an opening text message
    while(1) {
        for (int i=0; i<=19; i++) {
            ADCdata=ADCdata+Ain*3.3;             //sum 20 samples
            wait(0.05);
        }

        ADCdata=ADCdata/20;                 //divide by 20 Measure values
        pc.printf("%1.3f \n\r",ADCdata);     //send the data to the terminal
    }
}
