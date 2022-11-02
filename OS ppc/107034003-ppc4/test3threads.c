
#include <8051.h>
#include "preemptive.h"

__data __at (0x20) char buffer;
__data __at (0x21) char input;
__data __at (0x22) char full;
__data __at (0x23) char mutex;
__data __at (0x24) char empty;
__data __at (0x25) char input1;
__data __at (0x26) char flag;
__data __at (0x27) char flag1;

#define L(x) LABEL(x)
#define LABEL(x) x##$

void Producer(void) {
                input = 'A';
        while (1) {
                
                SemaphoreWait(flag,  L(__COUNTER__));
                SemaphoreWait(empty, L(__COUNTER__) );
                SemaphoreWait(mutex, L(__COUNTER__) );
                __critical{
                buffer = input;
                input = ( input == 'Z' ) ? 'A' :  input + 1;
                }
                SemaphoreSignal(mutex);
                SemaphoreSignal(full);
                SemaphoreSignal(flag1);
                
        }
}
void Producer1(void) {
                input1 = '0';
        while (1) {
                
                SemaphoreWait(flag1,  L(__COUNTER__));
                SemaphoreWait(empty, L(__COUNTER__) );
                SemaphoreWait(mutex, L(__COUNTER__) );
                __critical{
                buffer = input1;
                input1 = ( input1 == '9' ) ? '0' :  input1 + 1;
                //P1 = 0x5;
                }
                SemaphoreSignal(mutex);
                SemaphoreSignal(full);
                SemaphoreSignal(flag);
                
        }
}

void Consumer(void) {
        /* @@@ [2 pt] initialize Tx for polling */
        EA = 0;
        TMOD |= 0x20; // TMOD is also assigned by the (modified) Bootstrap code to set up the timer interrupt in timer-0 for preemption 
        TH1 = -6;
        SCON = 0x50;
        TR1 = 1;
        EA = 1;
        while (1) {
                SemaphoreWait(full,  L(__COUNTER__));
                SemaphoreWait(mutex,  L(__COUNTER__));
                __critical{
                SBUF = buffer;
                //P1 = 0xFF;
                }
                SemaphoreSignal(mutex);
                SemaphoreSignal(empty);

                while( !TI ){}
                TI = 0;
        }
}

void main(void) {
        SemaphoreCreate(full, 0);
        SemaphoreCreate(mutex, 1);
        SemaphoreCreate(empty,1);
        SemaphoreCreate(flag, 0);
        SemaphoreCreate(flag1, 1);
        ThreadCreate( Producer );
        ThreadCreate( Producer1 );
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
