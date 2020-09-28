#include "project.h"
DigitalIn Joystickleft(p13);                //initialize Joystickinputs
DigitalIn Joystickcenter(p14);
DigitalIn Joystickright(p16);

int getJoystickLR()                         //returns 1 when Joystick is turned right or left, otherwise return 0   
{
    if(Joystickleft or Joystickright) {
        while(Joystickleft or Joystickright) {} //whait until joystick is not pushed in this direction anymore to prevent toggling the value too often
        return 1;
    } else {
        return 0;
    }
}


int getJoystickC()                          //returns 1 when Joystick is pressed in the center, otherwise return 0 
{
    if(Joystickcenter) {
        while(Joystickcenter) {}            //wait until joystick is not pressed anymore to prevent toggling the value too often    
        return 1;
    } else {
        return 0;
    }
}
