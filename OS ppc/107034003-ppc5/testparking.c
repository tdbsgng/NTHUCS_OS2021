
#include <8051.h>
#include "preemptive.h"

//to display the output to UART 
#define output(car,dir,lot)\
        TMOD |= 0x20;\
        TH1 = -6;\
        SCON = 0x50;\
        TR1 = 1;\
        print(car);\
        print(dir);\
        print(lot);\
        print('\n');\

void Producer(void) {

        SemaphoreWait(empty, L(__COUNTER__) ); // wait if no empty lot
        EA = 0;
        // choose one empty lot to get in 
        if( lot_a == '0' ){ 
            lot_a = thread_car[cur_threadID];
            output(thread_car[cur_threadID],'>','a');
        }else if( lot_b == '0' ){
            lot_b = thread_car[cur_threadID];
            output(thread_car[cur_threadID],'>','b');
        }
        EA = 1;

        delay(2); // delay for  2 time_units

        EA = 0;
        //exits the lot
        if( lot_a == thread_car[cur_threadID] ){
            lot_a = '0';
           output(thread_car[cur_threadID],'<','a');
        }else if( lot_b == thread_car[cur_threadID] ){ 
            lot_b = '0';
            output(thread_car[cur_threadID],'<','b');
        }
        EA = 1;
        SemaphoreSignal(empty); //let one more car get in a lot 
        SemaphoreSignal(threadnum); //let one more thread be created 
        ThreadExit();
   
} 

void main(void) {
        SemaphoreCreate(mutex, 1); // mutex lock
        SemaphoreCreate(empty,2); // 2 empty parking lots at the beginning 
        SemaphoreCreate(threadnum, 3); // maximum limit of 4 threads and one is occupied by main()

        lot_a = '0'; // '0' means empty lots
        lot_b = '0';
        car_num = '1'; 

        while(time_unit < 030){ // use 030=24(decimal) time_units to test the Thread_exit function
            SemaphoreWait(threadnum, L(__COUNTER__) ); //wait if 3 thread is running
            ID = ThreadCreate( Producer ); 
            thread_car[ ID ] = car_num; // record which car is in which thread
            car_num = (car_num == '5') ? '1' : car_num+1; // car number from 1 to 5
        }
        ThreadExit();
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
