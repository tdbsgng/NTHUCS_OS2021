
#include <8051.h>
#include "preemptive.h"


        __data __at (0x20) char buffer;
        __data __at (0x21) char buffer_flag;
        __data __at (0x22) char input;

void Producer(void) {
        
        input='A';
        while (1) {
                while(buffer_flag!=0);
                EA = 0;
                        buffer=input;
                        buffer_flag=1;
                EA = 1;
                if(input=='Z')
                        input='A';
                else
                        input+=1;
                
                

        }
}


void Consumer(void) {

        TMOD |= 0x20;
        TH1 = -6;
        SCON = 0x50;
        TR1 = 1;
        while (1) {
                while(buffer_flag!=1);
                EA = 0;
                        SBUF=buffer;
                        buffer_flag=0;
                EA = 1;
                while(!TI);
                TI=0;
                
        }
}


void main(void) {
          
        buffer_flag=0;
        ThreadCreate(Producer);
        Consumer();
}

void _sdcc_gsinit_startup(void) {
        __asm
                ljmp  _Bootstrap
        __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}
void timer0_ISR(void) __interrupt(1) {
        __asm
                ljmp _myTimer0Handler
        __endasm;
}
