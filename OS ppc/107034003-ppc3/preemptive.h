#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4  /* not including the scheduler */
/* the scheduler does not take up a thread of its own */

typedef char ThreadID;
typedef void (*FunctionPtr)(void);

ThreadID ThreadCreate(FunctionPtr);
void ThreadYield(void);
void ThreadExit(void);
#define CNAME(s) _ ## s
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

// signal() semaphore s
#define SemaphoreSignal(s)\
    __asm \
        INC CNAME(s)\
    __endasm;\

#endif // __PREEMPTIVE_H__