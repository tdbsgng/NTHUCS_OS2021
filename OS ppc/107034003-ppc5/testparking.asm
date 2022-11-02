;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (MINGW64)
;--------------------------------------------------------
	.module testparking
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _timer0_ISR
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _Producer
	.globl _ThreadExit
	.globl _ThreadCreate
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _threadnum
	.globl _time_limit
	.globl _time_unit
	.globl _count
	.globl _new_threadID
	.globl _temp
	.globl _cur_threadID
	.globl _bitmap
	.globl _savedSP
	.globl _ID
	.globl _thread_car
	.globl _car_num
	.globl _lot_b
	.globl _lot_a
	.globl _empty
	.globl _mutex
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_mutex	=	0x0020
_empty	=	0x0021
_lot_a	=	0x0022
_lot_b	=	0x0023
_car_num	=	0x0024
_thread_car	=	0x0025
_ID	=	0x0029
_savedSP	=	0x0030
_bitmap	=	0x0034
_cur_threadID	=	0x0035
_temp	=	0x0036
_new_threadID	=	0x0037
_count	=	0x0038
_time_unit	=	0x0039
_time_limit	=	0x003a
_threadnum	=	0x003e
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Producer'
;------------------------------------------------------------
;	testparking.c:16: void Producer(void) {
;	-----------------------------------------
;	 function Producer
;	-----------------------------------------
_Producer:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	testparking.c:18: SemaphoreWait(empty, L(__COUNTER__) ); // wait if no empty lot
		0$:
	MOV A, _empty 
	JZ 0$ 
	JB ACC.7, 0$ 
	DEC _empty 
;	testparking.c:19: EA = 0;
;	assignBit
	clr	_EA
;	testparking.c:21: if( lot_a == '0' ){ 
	mov	a,#0x30
	cjne	a,_lot_a,00128$
;	testparking.c:22: lot_a = thread_car[cur_threadID];
	mov	a,_cur_threadID
	add	a,#_thread_car
	mov	r1,a
	mov	_lot_a,@r1
;	testparking.c:23: output(thread_car[cur_threadID],'>','a');
	orl	_TMOD,#0x20
	mov	_TH1,#0xfa
	mov	_SCON,#0x50
;	assignBit
	setb	_TR1
	mov	a,_cur_threadID
	add	a,#_thread_car
	mov	r1,a
	mov	_SBUF,@r1
00101$:
;	assignBit
	jbc	_TI,00318$
	sjmp	00101$
00318$:
	mov	_SBUF,#0x3e
00104$:
;	assignBit
	jbc	_TI,00319$
	sjmp	00104$
00319$:
	mov	_SBUF,#0x61
00107$:
;	assignBit
	jbc	_TI,00320$
	sjmp	00107$
00320$:
	mov	_SBUF,#0x0a
00110$:
;	assignBit
	jbc	_TI,00129$
	sjmp	00110$
00128$:
;	testparking.c:24: }else if( lot_b == '0' ){
	mov	a,#0x30
	cjne	a,_lot_b,00129$
;	testparking.c:25: lot_b = thread_car[cur_threadID];
	mov	a,_cur_threadID
	add	a,#_thread_car
	mov	r1,a
	mov	_lot_b,@r1
;	testparking.c:26: output(thread_car[cur_threadID],'>','b');
	orl	_TMOD,#0x20
	mov	_TH1,#0xfa
	mov	_SCON,#0x50
;	assignBit
	setb	_TR1
	mov	a,_cur_threadID
	add	a,#_thread_car
	mov	r1,a
	mov	_SBUF,@r1
00113$:
;	assignBit
	jbc	_TI,00324$
	sjmp	00113$
00324$:
	mov	_SBUF,#0x3e
00116$:
;	assignBit
	jbc	_TI,00325$
	sjmp	00116$
00325$:
	mov	_SBUF,#0x62
00119$:
;	assignBit
	jbc	_TI,00326$
	sjmp	00119$
00326$:
	mov	_SBUF,#0x0a
00122$:
;	assignBit
	jbc	_TI,00327$
	sjmp	00122$
00327$:
00129$:
;	testparking.c:28: EA = 1;
;	assignBit
	setb	_EA
;	testparking.c:30: delay(2); // delay for  2 time_units
	mov	a,_cur_threadID
	add	a,#_time_limit
	mov	r1,a
	mov	r7,_time_unit
	mov	a,#0x02
	add	a,r7
	mov	@r1,a
00130$:
	mov	a,_cur_threadID
	add	a,#_time_limit
	mov	r1,a
	mov	a,@r1
	cjne	a,_time_unit,00130$
;	testparking.c:32: EA = 0;
;	assignBit
	clr	_EA
;	testparking.c:34: if( lot_a == thread_car[cur_threadID] ){
	mov	a,_cur_threadID
	add	a,#_thread_car
	mov	r1,a
	mov	a,@r1
	mov	r7,a
	cjne	a,_lot_a,00160$
;	testparking.c:35: lot_a = '0';
	mov	_lot_a,#0x30
;	testparking.c:36: output(thread_car[cur_threadID],'<','a');
	orl	_TMOD,#0x20
	mov	_TH1,#0xfa
	mov	_SCON,#0x50
;	assignBit
	setb	_TR1
	mov	a,_cur_threadID
	add	a,#_thread_car
	mov	r1,a
	mov	_SBUF,@r1
00133$:
;	assignBit
	jbc	_TI,00332$
	sjmp	00133$
00332$:
	mov	_SBUF,#0x3c
00136$:
;	assignBit
	jbc	_TI,00333$
	sjmp	00136$
00333$:
	mov	_SBUF,#0x61
00139$:
;	assignBit
	jbc	_TI,00334$
	sjmp	00139$
00334$:
	mov	_SBUF,#0x0a
00142$:
;	assignBit
	jbc	_TI,00161$
	sjmp	00142$
00160$:
;	testparking.c:37: }else if( lot_b == thread_car[cur_threadID] ){ 
	mov	a,_cur_threadID
	add	a,#_thread_car
	mov	r1,a
	mov	a,@r1
	mov	r7,a
	cjne	a,_lot_b,00161$
;	testparking.c:38: lot_b = '0';
	mov	_lot_b,#0x30
;	testparking.c:39: output(thread_car[cur_threadID],'<','b');
	orl	_TMOD,#0x20
	mov	_TH1,#0xfa
	mov	_SCON,#0x50
;	assignBit
	setb	_TR1
	mov	a,_cur_threadID
	add	a,#_thread_car
	mov	r1,a
	mov	_SBUF,@r1
00145$:
;	assignBit
	jbc	_TI,00338$
	sjmp	00145$
00338$:
	mov	_SBUF,#0x3c
00148$:
;	assignBit
	jbc	_TI,00339$
	sjmp	00148$
00339$:
	mov	_SBUF,#0x62
00151$:
;	assignBit
	jbc	_TI,00340$
	sjmp	00151$
00340$:
	mov	_SBUF,#0x0a
00154$:
;	assignBit
	jbc	_TI,00341$
	sjmp	00154$
00341$:
00161$:
;	testparking.c:41: EA = 1;
;	assignBit
	setb	_EA
;	testparking.c:42: SemaphoreSignal(empty); //let one more car get in a lot 
	INC _empty 
;	testparking.c:43: SemaphoreSignal(threadnum); //let one more thread be created 
	INC _threadnum 
;	testparking.c:44: ThreadExit();
;	testparking.c:46: } 
	ljmp	_ThreadExit
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	testparking.c:48: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	testparking.c:49: SemaphoreCreate(mutex, 1); // mutex lock
	mov	_mutex,#0x01
;	testparking.c:50: SemaphoreCreate(empty,2); // 2 empty parking lots at the beginning 
	mov	_empty,#0x02
;	testparking.c:51: SemaphoreCreate(threadnum, 3); // maximum limit of 4 threads and one is occupied by main()
	mov	_threadnum,#0x03
;	testparking.c:53: lot_a = '0'; // '0' means empty lots
	mov	_lot_a,#0x30
;	testparking.c:54: lot_b = '0';
	mov	_lot_b,#0x30
;	testparking.c:55: car_num = '1'; 
	mov	_car_num,#0x31
;	testparking.c:57: while(time_unit < 030){ // use 030=24(decimal) time_units to test the Thread_exit function
00101$:
	mov	a,#0x100 - 0x18
	add	a,_time_unit
	jc	00103$
;	testparking.c:58: SemaphoreWait(threadnum, L(__COUNTER__) ); //wait if 3 thread is running
		1$:
	MOV A, _threadnum 
	JZ 1$ 
	JB ACC.7, 1$ 
	DEC _threadnum 
;	testparking.c:59: ID = ThreadCreate( Producer ); 
	mov	dptr,#_Producer
	lcall	_ThreadCreate
	mov	_ID,dpl
;	testparking.c:60: thread_car[ ID ] = car_num; // record which car is in which thread
	mov	a,_ID
	add	a,#_thread_car
	mov	r0,a
	mov	@r0,_car_num
;	testparking.c:61: car_num = (car_num == '5') ? '1' : car_num+1; // car number from 1 to 5
	mov	a,#0x35
	cjne	a,_car_num,00106$
	mov	r6,#0x31
	mov	r7,#0x00
	sjmp	00107$
00106$:
	mov	r5,_car_num
	inc	r5
	mov	a,r5
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
00107$:
	mov	_car_num,r6
	sjmp	00101$
00103$:
;	testparking.c:63: ThreadExit();
;	testparking.c:64: }
	ljmp	_ThreadExit
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	testparking.c:66: void _sdcc_gsinit_startup(void) {
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	testparking.c:69: __endasm;
	ljmp	_Bootstrap
;	testparking.c:70: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	testparking.c:72: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	testparking.c:73: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	testparking.c:74: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	testparking.c:75: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	testparking.c:78: __endasm;
	ljmp	_myTimer0Handler
;	testparking.c:79: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
