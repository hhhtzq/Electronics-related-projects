#include "project.h"
PwmOut PWM_r(p23);                      //init PWMs
PwmOut PWM_g(p24);
PwmOut PWM_b(p25);

void initPWM()                          //method to initialize everything for the PWMs
{
    PWM_r=1;                            //set dutycycle to 1(LED off)
    PWM_g=1;
    PWM_b=1;
    PWM_r.period(0.001);                //set duration of period          
    PWM_g.period(0.001);
    PWM_b.period(0.001);
}

void setLED(float val)                  //set the LED with the temperature value
{
    if(val > 24 and val < 30) {         //when green should be turned of, it is the brightest when it is close to 27°
        float a=val-27;                 //the more it is away from 27°, the darker it is
        if(a<0) {
            a=a*-1;                     //just to make a negative difference positiv
        }
        PWM_g=(a/3);                    //set PWM with the calculated value
    }

    else {
        PWM_g=1;                        //green is off when temp <=24° or >=30°
    }

    if(val>27 and val<32) {            //red LED is brighter, the warmer it is. It turns on with >27° 
        PWM_r=1-((val-27)/5);           
    } else if(val>=32) {                //if temperature is 32° or warmer, the red LED is on duty cycle 0%-means full, then RGB is inverted
        PWM_r=0;
    } else {
        PWM_r=1;                        //temp <27°, Red RGB is off
    }

    if(val <27 and val>22) {          //the blue LED is brighter, the colder it is. It turns on with <27°
        PWM_b=((27-val)/5);           //when the temperature is below 22°, LED is the brightest
    } else if(val<=22) {
        PWM_b=0;
    } else {
        PWM_b=1;                      //when the temperature is >=27°, blue RGB is completely switched off
    }
}

