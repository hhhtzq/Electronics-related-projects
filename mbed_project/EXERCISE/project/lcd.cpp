#include "project.h"
C12832 lcd(p5, p7, p6, p8, p11);                    //init lcd
void printlcd(float val, int par)                   //method to print a float on the lcd
{
    lcd.cls();                                      //clear lcd
    lcd.locate(0,0);                                //locate at the beginning
    if (par==0) {                                   //par 0 means there is a voltage given, than print the string with voltage
        lcd.printf("Voltage is %0.2fV", val);
    } else {
        lcd.printf("Temp is %0.2f degrees C", val); //par 1 menans there is a temperature given, print string with degrees
    }
}
