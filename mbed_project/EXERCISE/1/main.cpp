#include "mbed.h"
DigitalOut myled1(LED1);           //initialize all LEDs
DigitalOut myled2(LED2);
DigitalOut myled3(LED3);
DigitalOut myled4(LED4);
BusOut LED(LED1,LED2,LED3,LED4);    //initialize Bus for LEDs
DigitalIn Joystickdown(p12);        //initialize Joystickinputs
DigitalIn Joystickleft(p13);
DigitalIn Joystickcenter(p14);
DigitalIn Joystickup(p15);
DigitalIn Joystickright(p16);

int main() {
    for(int i=0;i<3;i++){           //just for sign when the software started
        LED=0xf;
        wait(0.3);
        LED=0x0;
        wait(0.3);}
       
        while(1) {
            
if(Joystickleft){                   //toggle LED1 with left of the Joystick
    if(myled1){
        myled1=0;}
        else{myled1=1;}
     while(Joystickleft){}
     }
     
     if(Joystickup){                //toggle LED2 with up of the Joystick
    if(myled2){
        myled2=0;}
        else{myled2=1;}
     while(Joystickup){}
     }
     
     if(Joystickright){             //toggle LED3 with right of the Joystick
    if(myled3){
        myled3=0;}
        else{myled3=1;}
     while(Joystickright){}
     }
     
     if(Joystickdown){              //toggle LED4 with down of the Joystick
    if(myled4){
        myled4=0;}
        else{myled4=1;}
     while(Joystickdown){}
     }
     
         if(Joystickcenter){        //switch all LEDs off with center of Joystick
            LED=0x0;
     while(Joystickcenter){}
     }
wait(0.1);
    }
    }

