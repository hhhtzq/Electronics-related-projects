#include "Task5_1.h"
C12832 lcd(p5, p7, p6, p8, p11);
int main()
{
    while(1) {
        lcd.cls();                              //clear lcd
        lcd.locate(0,0);                        //set lcd location back
        lcd.printf("%0.2f", getVoltage());      //get Voltage and print it to lcd
        wait(0.5);
    }
}