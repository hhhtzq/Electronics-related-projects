#ifndef project.h
#define project.h
#include "mbed.h"
#include "C12832.h"                     //import all the needed librarys
#include "TextLCD.h"
float getVoltage();                     //define all the methods
int getJoystickLR();
int getJoystickC();
void printlcd(float val, int par);
float getVoltage();
void initPWM();
void setLED(float val);
void printSerial(float val, int par);
void initTempSensor();
float getTemp();
#endif