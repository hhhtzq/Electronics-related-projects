#include "mbed.h"
I2C tempsensor(p28, p27);                       //sda, sc1
Serial pc(USBTX, USBRX);                        //tx, rx
const int addr = 0x90;                          //set addr for Tempsensor            
char config_t[3];                               //Array to config Tempsensor
char temp_read[2];                              //Array to get data
float temp1;                                    //floats to bring data in right format
float temp2;
int main()
{
    tempsensor.write(addr, config_t, 3);        
    config_t[0] = 0x00;                         //set pointer reg to ’data register’
    tempsensor.write(addr, config_t, 1);        //send to pointer ’read temp
    while(1) {
        wait(5);

        tempsensor.read(addr, temp_read, 2);    //read the two-byte temp data
        temp1 =temp_read[0];                    //make float from the full numbers
        temp2 =temp_read[1];                    //make float from the numbers behind decimal dot
        temp1=temp1+(temp2/256);                //calculate floats together, /256 to move the numbers behind decimal dot
        pc.printf("Temp = %.3f degC\n\r", temp1); //print out
    }
}