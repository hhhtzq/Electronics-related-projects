#include "mbed.h"


PwmOut PWM_r(p23);
PwmOut PWM_g(p24);
PwmOut PWM_b(p25);

int main()
{
    wait(1);
    PWM_r=1;                         //switch PWMs Off
    PWM_g=1;
    PWM_b=1;
    PWM_r.period(0.001);             //initialize PWMs
    PWM_g.period(0.001);
    PWM_b.period(0.001);
    wait(1);
    while(1) {
        for(float f=1; f>0; f=f-0.005) { //make PWM brighter over 2 seconds
            PWM_r=f;
            PWM_g=f;
            PWM_b=f;
            wait(0.01);
        }
        for(float f=0; f<1; f=f+0.005) { //make PWM darker over 2 seconds
            PWM_r=f;
            PWM_g=f;
            PWM_b=f;
            wait(0.01);
        }



    }
}
