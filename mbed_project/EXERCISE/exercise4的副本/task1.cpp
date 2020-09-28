 #include "mbed.h"
InterruptIn joystick(p14);
DigitalOut blink(LED1);
DigitalOut flash2(LED2);
DigitalOut flash3(LED3);

void ISR2() {
  flash2 =! flash2 ;
}
void ISR3(){
    flash3 = !flash3;
}
int main() {
  joystick.rise(&ISR2);
  joystick.fall(&ISR3);
    while(1) {
    blink = !blink; 
    wait(1);
} }



//define and name the interrupt input
//this is the response to interrupt, i.e. the ISR
// attach the address of the ISR function to the
                     // interrupt rising edge
// continuous loop, ready to be interrupted