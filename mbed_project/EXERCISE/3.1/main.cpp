#include "mbed.h"
SPI ser_port(p11, p12, p13);            // mosi, miso, sclk
char switch_word ;                      //word we will send
int main()
{
    ser_port.format(8,2);               // Setup the SPI for 8 bit data, Mode 2 operation
    ser_port.frequency(1000000);        // Clock frequency is 1MHz
    while (1) {
        switch_word=0x52;               //set up word to be transmitted (01010010=
        ser_port.write(switch_word);    //send switch_word
        wait_us(50);
    }
}