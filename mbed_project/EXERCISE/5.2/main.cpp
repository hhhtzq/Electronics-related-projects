#include "mbed.h"                   //READ SMILEY INSTEAD OF FLOWER ;)
#include "C12832.h"
#include "flower.h"
DigitalIn Joystickdown(p12);        //initialize Joystickinputs
DigitalIn Joystickleft(p13);
DigitalIn Joystickcenter(p14);
DigitalIn Joystickup(p15);
DigitalIn Joystickright(p16);
int x,y;                            //int values for x and y position

C12832 lcd(p5, p7, p6, p8, p11);    // Initialize lcd

int main()
{
    x=56;
    y=8;
    while(1) {
        lcd.cls();                          //clear lcd
        lcd.print_bm(bitmFlower,x,y);       // print flower at center
        lcd.copy_to_lcd();                  //show it on lcd
        wait(0.1);
        while(!Joystickdown and !Joystickleft and !Joystickcenter and !Joystickup and !Joystickright) {}; //do nothing as long as no joystick is moved
        if (Joystickdown and y<16)
            y++;
        if(Joystickup and y>0)
            y--;
        if(Joystickright and x<112)
            x++;
        if (Joystickleft and x>0)           //if joystick is moved, change axes value, to move the flower
            x--;
        if (Joystickcenter) {               //if center is pressed, move flower to middle
            x=56;
            y=8;
        }
    }
}