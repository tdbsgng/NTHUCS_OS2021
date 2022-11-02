;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (MINGW64)
;--------------------------------------------------------
	.module preemptive
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _myTimer0Handler
	.globl _Bootstrap
	.globl _main
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
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
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
	.area	OSEG    (OVR,DATA)
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	preemptive.c:32: void Bootstrap(void) {
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	preemptive.c:34: TMOD = 0;  // timer 0 mode 0
	mov	_TMOD,#0x00
;	preemptive.c:35: IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
	mov	_IE,#0x82
;	preemptive.c:37: TR0 = 1; // set bit TR0 to start running timer 0
;	assignBit
	setb	_TR0
;	preemptive.c:38: bitmap = 0;
	mov	_bitmap,#0x00
;	preemptive.c:39: cur_threadID = ThreadCreate( main );
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_cur_threadID,dpl
;	preemptive.c:40: RESTORESTATE;
	mov	a,_cur_threadID
	add	a,#_savedSP
	mov	r1,a
	mov	_SP,@r1
	pop PSW 
	pop DPH 
	pop DPL 
	pop B 
	pop ACC 
;	preemptive.c:44: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp                        Allocated to registers 
;------------------------------------------------------------
;	preemptive.c:47: ThreadID ThreadCreate(FunctionPtr fp) {
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	preemptive.c:48: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:49: if( bitmap == 0b1111) return -1;
	mov	a,#0x0f
	cjne	a,_bitmap,00102$
	mov	dpl,#0xff
	ret
00102$:
;	preemptive.c:51: if( !( bitmap & 1 ) ){
	mov	a,_bitmap
	jb	acc.0,00112$
;	preemptive.c:52: bitmap = bitmap | 1;
	orl	_bitmap,#0x01
;	preemptive.c:53: new_threadID = 0;
	mov	_new_threadID,#0x00
	sjmp	00113$
00112$:
;	preemptive.c:55: else if( !( bitmap & 2 ) ){
	mov	a,_bitmap
	jb	acc.1,00109$
;	preemptive.c:56: bitmap = bitmap | 2;
	orl	_bitmap,#0x02
;	preemptive.c:57: new_threadID = 1;
	mov	_new_threadID,#0x01
	sjmp	00113$
00109$:
;	preemptive.c:59: else if( !( bitmap & 4 ) ){
	mov	a,_bitmap
	jb	acc.2,00106$
;	preemptive.c:60: bitmap = bitmap | 4;
	orl	_bitmap,#0x04
;	preemptive.c:61: new_threadID = 2;
	mov	_new_threadID,#0x02
	sjmp	00113$
00106$:
;	preemptive.c:63: else if( !( bitmap & 8 ) ){
	mov	a,_bitmap
	jb	acc.3,00113$
;	preemptive.c:64: bitmap = bitmap | 8;
	orl	_bitmap,#0x08
;	preemptive.c:65: new_threadID = 3;
	mov	_new_threadID,#0x03
00113$:
;	preemptive.c:68: temp = SP;
	mov	_temp,_SP
;	preemptive.c:69: SP = (0x3F) + (0x10) * new_threadID;
	mov	a,_new_threadID
	swap	a
	anl	a,#0xf0
	mov	r7,a
	add	a,#0x3f
	mov	_SP,a
;	preemptive.c:79: __endasm;
	push	DPL
	push	DPH
	MOV	A, #0
	push	ACC
	push	ACC
	push	ACC
	push	ACC
;	preemptive.c:81: PSW = new_threadID << 3;
	mov	a,_new_threadID
	mov	r7,a
	swap	a
	rr	a
	anl	a,#0xf8
	mov	_PSW,a
;	preemptive.c:84: __endasm;
	push	PSW
;	preemptive.c:86: savedSP[new_threadID] = SP;
	mov	a,_new_threadID
	add	a,#_savedSP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:88: SP = temp;
	mov	_SP,_temp
;	preemptive.c:90: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:91: return new_threadID;        
	mov	dpl,_new_threadID
;	preemptive.c:92: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	preemptive.c:96: void ThreadYield(void) {
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	preemptive.c:97: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:98: SAVESTATE;
	push ACC 
	push B 
	push DPL 
	push DPH 
	push PSW 
	mov	a,_cur_threadID
	add	a,#_savedSP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:99: do {
00103$:
;	preemptive.c:101: cur_threadID = (cur_threadID < 3 ) ?  cur_threadID+1 : 0;
	mov	a,#0x100 - 0x03
	add	a,_cur_threadID
	jc	00108$
	mov	r7,_cur_threadID
	inc	r7
	mov	a,r7
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	sjmp	00109$
00108$:
	mov	r6,#0x00
	mov	r7,#0x00
00109$:
	mov	_cur_threadID,r6
;	preemptive.c:102: if(bitmap & (1<<cur_threadID)) break;
	mov	r7,_cur_threadID
	mov	b,r7
	inc	b
	mov	r7,#0x01
	mov	r6,#0x00
	sjmp	00124$
00123$:
	mov	a,r7
	add	a,r7
	mov	r7,a
	mov	a,r6
	rlc	a
	mov	r6,a
00124$:
	djnz	b,00123$
	mov	r4,_bitmap
	mov	r5,#0x00
	mov	a,r4
	anl	ar7,a
	mov	a,r5
	anl	ar6,a
	mov	a,r7
	orl	a,r6
	jz	00103$
;	preemptive.c:105: RESTORESTATE;
	mov	a,_cur_threadID
	add	a,#_savedSP
	mov	r1,a
	mov	_SP,@r1
	pop PSW 
	pop DPH 
	pop DPL 
	pop B 
	pop ACC 
;	preemptive.c:106: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:107: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'myTimer0Handler'
;------------------------------------------------------------
;	preemptive.c:109: void myTimer0Handler(void) {
;	-----------------------------------------
;	 function myTimer0Handler
;	-----------------------------------------
_myTimer0Handler:
;	preemptive.c:110: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:111: SAVESTATE;
	push ACC 
	push B 
	push DPL 
	push DPH 
	push PSW 
	mov	a,_cur_threadID
	add	a,#_savedSP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:129: __endasm;
	MOV	A, R0
	PUSH	ACC
	MOV	A, R1
	PUSH	ACC
	MOV	A, R2
	PUSH	ACC
	MOV	A, R3
	PUSH	ACC
	MOV	A, R4
	PUSH	ACC
	MOV	A, R5
	PUSH	ACC
	MOV	A, R6
	PUSH	ACC
	MOV	A, R7
	PUSH	ACC
;	preemptive.c:130: count = count + 1; // counting the 8051 timer
	mov	a,_count
	mov	r7,a
	inc	a
	mov	_count,a
;	preemptive.c:131: if(count==8){ 
	mov	a,#0x08
	cjne	a,_count,00114$
;	preemptive.c:132: time_unit = time_unit + 1; // 8 8051 timers = 1 time_unit
	mov	a,_time_unit
	inc	a
	mov	_time_unit,a
;	preemptive.c:133: count = 0; 
	mov	_count,#0x00
;	preemptive.c:134: print(((time_unit&56)>>3)+'0';); //the first digit of the number of time_unit in Octal 
	mov	r6,_time_unit
	anl	ar6,#0x38
	clr	a
	swap	a
	rl	a
	xch	a,r6
	swap	a
	rl	a
	anl	a,#0x1f
	xrl	a,r6
	xch	a,r6
	anl	a,#0x1f
	xch	a,r6
	xrl	a,r6
	xch	a,r6
	jnb	acc.4,00163$
	orl	a,#0xe0
00163$:
	mov	a,#0x30
	add	a,r6
	mov	_SBUF,a
00101$:
;	assignBit
	jbc	_TI,00164$
	sjmp	00101$
00164$:
;	preemptive.c:135: print((time_unit&7)+'0';);       //the second digit of the number of time_unit in Octal 
	mov	r7,_time_unit
	mov	a,#0x07
	anl	a,r7
	add	a,#0x30
	mov	_SBUF,a
00104$:
;	assignBit
	jbc	_TI,00165$
	sjmp	00104$
00165$:
;	preemptive.c:136: print('\n');
	mov	_SBUF,#0x0a
00107$:
;	assignBit
	jbc	_TI,00166$
	sjmp	00107$
00166$:
;	preemptive.c:138: do {    
00114$:
;	preemptive.c:139: cur_threadID = (cur_threadID < 3 ) ?  cur_threadID+1 : 0;
	mov	a,#0x100 - 0x03
	add	a,_cur_threadID
	jc	00119$
	mov	r7,_cur_threadID
	inc	r7
	mov	a,r7
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	sjmp	00120$
00119$:
	mov	r6,#0x00
	mov	r7,#0x00
00120$:
	mov	_cur_threadID,r6
;	preemptive.c:140: temp=(1<<cur_threadID);
	mov	r7,_cur_threadID
	mov	b,r7
	inc	b
	mov	a,#0x01
	sjmp	00170$
00168$:
	add	a,acc
00170$:
	djnz	b,00168$
	mov	_temp,a
;	preemptive.c:141: if( bitmap & temp ){
	mov	a,_temp
	anl	a,_bitmap
	jz	00114$
;	preemptive.c:163: __endasm;  
	POP	ACC
	MOV	R7, A
	POP	ACC
	MOV	R6, A
	POP	ACC
	MOV	R5, A
	POP	ACC
	MOV	R4, A
	POP	ACC
	MOV	R3, A
	POP	ACC
	MOV	R2, A
	POP	ACC
	MOV	R1, A
	POP	ACC
	MOV	R0, A
;	preemptive.c:164: RESTORESTATE;
	mov	a,_cur_threadID
	add	a,#_savedSP
	mov	r1,a
	mov	_SP,@r1
	pop PSW 
	pop DPH 
	pop DPL 
	pop B 
	pop ACC 
;	preemptive.c:165: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:168: __endasm;
	RETI
;	preemptive.c:169: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	preemptive.c:170: void ThreadExit(void) {
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	preemptive.c:171: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:172: if(cur_threadID == 0) bitmap = bitmap - 1;
	mov	a,_cur_threadID
	jnz	00110$
	mov	a,_bitmap
	mov	r7,a
	dec	a
	mov	_bitmap,a
	sjmp	00111$
00110$:
;	preemptive.c:173: else if( cur_threadID == 1 )bitmap = bitmap - 2;
	mov	a,#0x01
	cjne	a,_cur_threadID,00107$
	mov	a,_bitmap
	mov	r7,a
	add	a,#0xfe
	mov	_bitmap,a
	sjmp	00111$
00107$:
;	preemptive.c:174: else if( cur_threadID == 2 )bitmap = bitmap - 4;
	mov	a,#0x02
	cjne	a,_cur_threadID,00104$
	mov	a,_bitmap
	mov	r7,a
	add	a,#0xfc
	mov	_bitmap,a
	sjmp	00111$
00104$:
;	preemptive.c:175: else if( cur_threadID == 3 )bitmap = bitmap - 8;
	mov	a,#0x03
	cjne	a,_cur_threadID,00111$
	mov	a,_bitmap
	mov	r7,a
	add	a,#0xf8
	mov	_bitmap,a
00111$:
;	preemptive.c:177: if(  bitmap & 1  ){
	mov	a,_bitmap
	jnb	acc.0,00134$
;	preemptive.c:178: cur_threadID = 0;
	mov	_cur_threadID,#0x00
	sjmp	00135$
00134$:
;	preemptive.c:179: }else if(  bitmap & 2  ){
	mov	a,_bitmap
	jnb	acc.1,00131$
;	preemptive.c:180: cur_threadID = 1;
	mov	_cur_threadID,#0x01
	sjmp	00135$
00131$:
;	preemptive.c:181: }else if(  bitmap & 4  ){
	mov	a,_bitmap
	jnb	acc.2,00128$
;	preemptive.c:182: cur_threadID = 2;
	mov	_cur_threadID,#0x02
	sjmp	00135$
00128$:
;	preemptive.c:183: }else if(  bitmap & 8  ){
	mov	a,_bitmap
	jnb	acc.3,00125$
;	preemptive.c:184: cur_threadID = 3;
	mov	_cur_threadID,#0x03
	sjmp	00135$
00125$:
;	preemptive.c:186: print('e');
	mov	_SBUF,#0x65
00112$:
;	assignBit
	jbc	_TI,00209$
	sjmp	00112$
00209$:
;	preemptive.c:187: print('n');
	mov	_SBUF,#0x6e
00115$:
;	assignBit
	jbc	_TI,00210$
	sjmp	00115$
00210$:
;	preemptive.c:188: print('d');
	mov	_SBUF,#0x64
00118$:
;	assignBit
	jbc	_TI,00211$
	sjmp	00118$
00211$:
;	preemptive.c:189: while(1){}
00122$:
	sjmp	00122$
00135$:
;	preemptive.c:192: RESTORESTATE;
	mov	a,_cur_threadID
	add	a,#_savedSP
	mov	r1,a
	mov	_SP,@r1
	pop PSW 
	pop DPH 
	pop DPL 
	pop B 
	pop ACC 
;	preemptive.c:193: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:194: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
