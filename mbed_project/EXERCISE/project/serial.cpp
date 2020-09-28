#include "project.h"
Serial pc(USBTX, USBRX);                                                //tx, rx
void printSerial(float val, int par)                                    //method to print a value to the computer
{
    if(par==0) {
        pc.printf("Voltage is %0.2fV\n", val);                          //if param is 0, then the value is a voltage, print this out
    } 
    else {
        pc.printf("Temperature is %0.2f degrees Celsius\n", val);       //if param is 1, then the value is a temperature, print this out
    }
}