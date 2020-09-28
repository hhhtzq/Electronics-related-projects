
#include "mbed.h"
AnalogOut Aout(p18);
float i;
int main()
{
    while(1)  {
        for (i=0; i<2; i=i+0.05) {
            Aout=0.5+0.3125*sin(i*3.14159);  // Compute the sine value, + half the range
            wait(.0024);                     // Controls the sine wave period
        }
    }
}