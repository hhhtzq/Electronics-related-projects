#include "mbed.h"                   //READ SMILEY INSTEAD OF FLOWER ;)
#include "C12832.h"
#include "flower.h"
DigitalIn Joystickdown(p12);        //initialize Joystickinputs
DigitalIn Joystickleft(p13);
DigitalIn Joystickcenter(p14);
DigitalIn Joystickup(p15);
DigitalIn Joystickright(p16);
int x,y;                            //int for axis position
I2C tempsensor(p28, p27);           //sda, sc1
const int addr = 0x90;              //address of tempsensor
char config_t[3];                   //array to config tempsensor
char temp_read[2];                  //array to get data from tempsensor
float temp1;                        //floats to bring data in the right format
float temp2;

C12832 lcd(p5, p7, p6, p8, p11);    // Initialize lcd

int main()
{
    tempsensor.write(addr, config_t, 3);
    config_t[0] = 0x00;                      //set pointer reg to ’data register’
    tempsensor.write(addr, config_t, 1);    //send to pointer ’read temp
    while(1) {
        lcd.cls();
        lcd.print_bm(bitmFlower,24,0);      // print axis in the right part of the lcd
        lcd.copy_to_lcd();
        lcd.locate(12,0);                   //change location of "cursor"
        lcd.printf("35");                   //print there for the scale 35
        lcd.locate(12,24);                  //change location of "cursor"
        lcd.printf("20");                   //print there for the scale 20
        for(x=0; x<100; x++) {                 //for loop to set the whole drawing to a time of 10s
            tempsensor.read(addr, temp_read, 2); //read the two-byte temp data
            temp1 =temp_read[0];                 //make float from the full numbers
            temp2 =temp_read[1];                 //make float from the numbers behind decimal dot
            temp1=temp1+(temp2/256);             //calculate floats together, /256 to move the numbers behind decimal dot
            y=30-((temp1-20)*2);             //calculate y-position on the function
            lcd.pixel((x+27),y,1);           //draw there a pixel
            lcd.copy_to_lcd();
            wait(0.1);                       //wait 100ms --> 100x100ms=10s

        }

    }
}