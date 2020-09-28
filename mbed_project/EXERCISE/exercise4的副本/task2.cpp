 #include"mbed.h"
 Serial pc(USBTX, USBRX); //tx, rx
 Timer t;                   //set the first time
 Timer t2;                  //set the second time to measure the average time
int main() {
 char input[5];             // set the array to storage strings
 int i;
 
 
 
 while(1) {                 // start cycle 
   t.reset();               //reset t
   pc.printf("Please type 5 strings:\n");
   for(i=0;i<5;i++){            //input strings 
        pc.scanf("%c", &input[i]);  // & to pass a pointer to input
    }
    pc.printf("The input string is: \n");
    t2.start();                 //start t2
    for(i=0;i<5;i++){           //output strings 
         t.start();
         pc.printf("%c  the time is %f seconds\n", input[i],t.read());
         
         t.stop();              //stop t
         t.reset();             //reset t
    }
    t2.stop();                  //stop t2
    
    
    
    pc.printf("the average time is %f\n",t2.read()/5);  //output average time 
    t2.reset();                 //reset t2
    
 }
     
}