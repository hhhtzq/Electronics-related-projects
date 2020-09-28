#include "project.h"
I2C tempsensor(p28, p27);                       //sda, sc1
const int addr = 0x90;                          //set adress of tempsensor
char config_t[3];                               //init array to config tempsensor
char temp_read[2];                              //init array to get data from tempsensor
float temp1;                                    //make floats to bring data in right format
float temp2;
void initTempSensor()                           //methode to init everything for the tempsensor
{
    tempsensor.write(addr, config_t, 3);
    config_t[0] = 0x00;                      //set pointer reg to ’data register’
    tempsensor.write(addr, config_t, 1);    //send to pointer ’read temp
}
float getTemp()                             //method which returns the temperatur as a float
{
    tempsensor.read(addr, temp_read, 2);    //read the two-byte temp data
    temp1 =temp_read[0];                    //make float from the full numbers
    temp2 =temp_read[1];                    //make float from the numbers behind decimal dot
    temp1=temp1+(temp2/256);                //calculate floats together, /256 to move the numbers behind decimal dot
    return temp1;                           //return the temp as a float
}
