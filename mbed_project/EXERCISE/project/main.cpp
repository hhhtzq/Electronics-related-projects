#include "project.h"
int ser;                                    //init voltage/temp value for serial port
int lcd_o;                                  //init voltage/temp value for lcd port
float voltage;                              //float to store the voltage
float temp;                                 //float to store the temp

int main()
{
    initPWM();                              //init PWM and tempsensor
    initTempSensor();

    while(1) {
        for(int i=0; i<100; i++) {          //during 1s just look if the joystick is moved and change the ser and lcd values if it is moved
            if (getJoystickLR()==1) {       
                if (lcd_o==0) {
                    lcd_o=1;
                } else {
                    lcd_o=0;
                }
            }
            if (getJoystickC()==1) {
                if (ser==0) {
                    ser=1;
                } else {
                    ser=0;
                }
            }
            temp=getTemp();                 //and get the actual temp value and set the led to the right color
            setLED(temp);
            wait(0.005);
        }
        if(ser==0 or lcd_o==0) {            //every second get voltage
            voltage=getVoltage();
        }

        if(lcd_o==0) {                      //and print voltage/temp to lcd
            printlcd(voltage, lcd_o);
        }
        if(lcd_o==1) {
            printlcd(temp,lcd_o);
        }
        if(ser==0) {                        //and serial port
            printSerial(voltage, ser);
        }
        if(ser==1) {
            printSerial(temp, ser);
        }

    }
}



