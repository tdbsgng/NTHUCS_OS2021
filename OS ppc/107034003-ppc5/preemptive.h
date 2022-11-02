#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4  /* not including the scheduler */
/* the scheduler does not take up a thread of its own */

typedef char ThreadID;
typedef void (*FunctionPtr)(void);

//Variable 
__data __at (0x20) char mutex; 
__data __at (0x21) char empty; //number of empty lot
__data __at (0x22) char lot_a; //first parking lot
__data __at (0x23) char lot_b; // second parking lot
__data __at (0x24) char car_num; //car number from 1 to 5
__data __at (0x25) char thread_car[4]; //thread -- car_num table
__data __at (0x29) char ID; //new thread ID
__data __at (0x30) char savedSP[4]; 
__data __at (0x34) char bitmap;
__data __at (0x35) char cur_threadID;
__data __at (0x36) char temp;
__data __at (0x37) char new_threadID;
__data __at (0x38) char count; //counting the 8051 timer 
__data __at (0x39) char time_unit; //number of time units that has elapsed since the system reboots
__data __at (0x3A) char time_limit[4]; // delay deadline of each thread
__data __at (0x3E) char threadnum; // number of existing thread


ThreadID ThreadCreate(FunctionPtr);
void ThreadYield(void);
void ThreadExit(void);

//delay for n time_units 
#define delay(n)\
    time_limit[cur_threadID] = time_unit + n;\
    while( time_unit !=time_limit[cur_threadID] ){}\

//display a char to UART
#define print(input)\
        SBUF = input;\
        while(!TI) {}\
        TI = 0;     

#define CNAME(s) _ ## s
#define L(x) LABEL(x)
#define LABEL(x) x##$
#define SemaphoreCreate(s, n) s = n // create a counting semaphore s 
                                  	// that is initialized to n
#define SemaphoreWait(s, label)\
    __asm \
        label:\
        MOV A, CNAME(s)\
        JZ  label\
        JB ACC.7, label\
        DEC  CNAME(s) \
    __endasm;


#define SemaphoreSignal(s)\
    __asm \
        INC CNAME(s)\
    __endasm;\

#endif // __PREEMPTIVE_H__