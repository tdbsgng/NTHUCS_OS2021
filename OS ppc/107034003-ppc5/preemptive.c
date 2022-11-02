#include <8051.h>

#include "preemptive.h"




#define SAVESTATE \
    __asm \
        push ACC\
        push B\
        push DPL\
        push DPH\
        push PSW\
    __endasm; \
    savedSP[cur_threadID] = SP;
        

#define RESTORESTATE \
    SP = savedSP[cur_threadID];\
    __asm \
        pop PSW\
        pop DPH\
        pop DPL\
        pop B\
        pop ACC\
    __endasm; 


extern void main(void);

void Bootstrap(void) {
      
      TMOD = 0;  // timer 0 mode 0
      IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
                // EA  -  ET2  ES  ET1  EX1  ET0  EX0
      TR0 = 1; // set bit TR0 to start running timer 0
      bitmap = 0;
      cur_threadID = ThreadCreate( main );
      RESTORESTATE;



}


ThreadID ThreadCreate(FunctionPtr fp) {
   EA = 0;
        if( bitmap == 0b1111) return -1;
         //a
        if( !( bitmap & 1 ) ){
            bitmap = bitmap | 1;
            new_threadID = 0;
        }
        else if( !( bitmap & 2 ) ){
            bitmap = bitmap | 2;
            new_threadID = 1;
        }
        else if( !( bitmap & 4 ) ){
            bitmap = bitmap | 4;
            new_threadID = 2;
        }
        else if( !( bitmap & 8 ) ){
            bitmap = bitmap | 8;
            new_threadID = 3;
        }
         //b,c
         temp = SP;
         SP = (0x3F) + (0x10) * new_threadID;
         //d,e
         __asm
            push DPL
            push DPH
            MOV A, #0
            push ACC
            push ACC
            push ACC
            push ACC
         __endasm;
         //f
         PSW = new_threadID << 3;
         __asm 
            push PSW
         __endasm;
         //g
         savedSP[new_threadID] = SP;
         //h
         SP = temp;
         //i
    EA = 1;
         return new_threadID;        
}



void ThreadYield(void) {
   EA = 0;
       SAVESTATE;
       do {
                
               cur_threadID = (cur_threadID < 3 ) ?  cur_threadID+1 : 0;
               if(bitmap & (1<<cur_threadID)) break;
                
        } while (1);
        RESTORESTATE;
   EA = 1;
}

void myTimer0Handler(void) {
   EA = 0;
       SAVESTATE;
       __asm
         MOV A, R0
         PUSH ACC
         MOV A, R1
         PUSH ACC
         MOV A, R2
         PUSH ACC
         MOV A, R3
         PUSH ACC
         MOV A, R4
         PUSH ACC
         MOV A, R5
         PUSH ACC
         MOV A, R6
         PUSH ACC
         MOV A, R7
         PUSH ACC
      __endasm;
        count = count + 1; // counting the 8051 timer
        if(count==8){ 
            time_unit = time_unit + 1; // 8 8051 timers = 1 time_unit
            count = 0; 
            print(((time_unit&56)>>3)+'0';); //the first digit of the number of time_unit in Octal 
            print((time_unit&7)+'0';);       //the second digit of the number of time_unit in Octal 
            print('\n');
        }
       do {    
            cur_threadID = (cur_threadID < 3 ) ?  cur_threadID+1 : 0;
            temp=(1<<cur_threadID);
         if( bitmap & temp ){
            break;
         }     
                
        } while (1);
        __asm
         POP ACC
         MOV R7, A
         POP ACC
         MOV R6, A
         POP ACC
         MOV R5, A
         POP ACC
         MOV R4, A
         POP ACC
         MOV R3, A
         POP ACC
         MOV R2, A
         POP ACC
         MOV R1, A
         POP ACC
         MOV R0, A
      __endasm;  
        RESTORESTATE;
   EA = 1;
   __asm 
      RETI
   __endasm;
}
void ThreadExit(void) {
        EA = 0;
        if(cur_threadID == 0) bitmap = bitmap - 1;
        else if( cur_threadID == 1 )bitmap = bitmap - 2;
        else if( cur_threadID == 2 )bitmap = bitmap - 4;
        else if( cur_threadID == 3 )bitmap = bitmap - 8;

        if(  bitmap & 1  ){
            cur_threadID = 0;
        }else if(  bitmap & 2  ){
            cur_threadID = 1;
        }else if(  bitmap & 4  ){
            cur_threadID = 2;
        }else if(  bitmap & 8  ){
            cur_threadID = 3;
        }else{
            print('e');
            print('n');
            print('d');
            while(1){}
        }
        
        RESTORESTATE;
        EA = 1;
}
