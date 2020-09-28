 #include"mbed.h"
void led_switch1(void);
void led_switch2(void);
void led_switch3(void);
void led_switch4(void);
Ticker time_up1;
Ticker time_up2;
Ticker time_up3;
Ticker time_up4;
DigitalOut myled1(LED1);
DigitalOut myled2(LED2);
DigitalOut myled3(LED1);
DigitalOut myled4(LED2);
void led_switch1(){ //the function that Ticker will call 
    myled1=!myled1;
}
void led_switch2(){ //the function that Ticker will call 
    myled2=!myled2;
}
void led_switch3(){ //the function that Ticker will call 
    myled3=!myled3;
}
void led_switch4(){ //the function that Ticker will call 
    myled4=!myled4;
}
int main(){
    time_up1.attach(&led_switch1, 0.2); //initialises the ticker 
    time_up2.attach(&led_switch2, 0.3); //initialises the ticker 
     time_up3.attach(&led_switch3, 0.2); //initialises the ticker 
    time_up4.attach(&led_switch4, 0.3); //initialises the ticker 
    while(1){ //sit in a loop doing nothing, waiting for Ticker interrupt 
    }
}