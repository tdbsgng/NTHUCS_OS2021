#include <8051.h>
#include "preemptive.h"

__data __at (0x20) char buffer;
__data __at (0x21) char input;
__data __at (0x22) char mutex;
__data __at (0x23) char full;
__data __at (0x24) char empty;

#define L(x) LABEL(x)
#define LABEL(x) x##$
        
void Producer(void) {
        
        input='A';
        while (1) {
                SemaphoreWait(empty, L(__COUNTER__) );
                SemaphoreWait(mutex, L(__COUNTER__) );
                buffer = input;
                if (input=='Z') input='A';
                else input+=1;
                SemaphoreSignal(mutex);
                SemaphoreSignal(full);
        }
}


void Consumer(void) {

        TMOD |= 0x20;
        TH1 = -6;
        SCON = 0x50;
        TR1 = 1;
        while (1) {
                SemaphoreWait(full,  L(__COUNTER__));
                SemaphoreWait(mutex, L(__COUNTER__));
                SBUF = buffer;
                SemaphoreSignal(mutex);
                SemaphoreSignal(empty);
                while(!TI);
                TI=0;
                
        }
}


void main(void) {
          
        SemaphoreCreate(full, 0);
        SemaphoreCreate(mutex, 1);
        SemaphoreCreate(empty,1);
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
