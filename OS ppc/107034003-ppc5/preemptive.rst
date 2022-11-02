                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.9.0 #11195 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module preemptive
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _myTimer0Handler
                                     12 	.globl _Bootstrap
                                     13 	.globl _main
                                     14 	.globl _CY
                                     15 	.globl _AC
                                     16 	.globl _F0
                                     17 	.globl _RS1
                                     18 	.globl _RS0
                                     19 	.globl _OV
                                     20 	.globl _F1
                                     21 	.globl _P
                                     22 	.globl _PS
                                     23 	.globl _PT1
                                     24 	.globl _PX1
                                     25 	.globl _PT0
                                     26 	.globl _PX0
                                     27 	.globl _RD
                                     28 	.globl _WR
                                     29 	.globl _T1
                                     30 	.globl _T0
                                     31 	.globl _INT1
                                     32 	.globl _INT0
                                     33 	.globl _TXD
                                     34 	.globl _RXD
                                     35 	.globl _P3_7
                                     36 	.globl _P3_6
                                     37 	.globl _P3_5
                                     38 	.globl _P3_4
                                     39 	.globl _P3_3
                                     40 	.globl _P3_2
                                     41 	.globl _P3_1
                                     42 	.globl _P3_0
                                     43 	.globl _EA
                                     44 	.globl _ES
                                     45 	.globl _ET1
                                     46 	.globl _EX1
                                     47 	.globl _ET0
                                     48 	.globl _EX0
                                     49 	.globl _P2_7
                                     50 	.globl _P2_6
                                     51 	.globl _P2_5
                                     52 	.globl _P2_4
                                     53 	.globl _P2_3
                                     54 	.globl _P2_2
                                     55 	.globl _P2_1
                                     56 	.globl _P2_0
                                     57 	.globl _SM0
                                     58 	.globl _SM1
                                     59 	.globl _SM2
                                     60 	.globl _REN
                                     61 	.globl _TB8
                                     62 	.globl _RB8
                                     63 	.globl _TI
                                     64 	.globl _RI
                                     65 	.globl _P1_7
                                     66 	.globl _P1_6
                                     67 	.globl _P1_5
                                     68 	.globl _P1_4
                                     69 	.globl _P1_3
                                     70 	.globl _P1_2
                                     71 	.globl _P1_1
                                     72 	.globl _P1_0
                                     73 	.globl _TF1
                                     74 	.globl _TR1
                                     75 	.globl _TF0
                                     76 	.globl _TR0
                                     77 	.globl _IE1
                                     78 	.globl _IT1
                                     79 	.globl _IE0
                                     80 	.globl _IT0
                                     81 	.globl _P0_7
                                     82 	.globl _P0_6
                                     83 	.globl _P0_5
                                     84 	.globl _P0_4
                                     85 	.globl _P0_3
                                     86 	.globl _P0_2
                                     87 	.globl _P0_1
                                     88 	.globl _P0_0
                                     89 	.globl _B
                                     90 	.globl _ACC
                                     91 	.globl _PSW
                                     92 	.globl _IP
                                     93 	.globl _P3
                                     94 	.globl _IE
                                     95 	.globl _P2
                                     96 	.globl _SBUF
                                     97 	.globl _SCON
                                     98 	.globl _P1
                                     99 	.globl _TH1
                                    100 	.globl _TH0
                                    101 	.globl _TL1
                                    102 	.globl _TL0
                                    103 	.globl _TMOD
                                    104 	.globl _TCON
                                    105 	.globl _PCON
                                    106 	.globl _DPH
                                    107 	.globl _DPL
                                    108 	.globl _SP
                                    109 	.globl _P0
                                    110 	.globl _threadnum
                                    111 	.globl _time_limit
                                    112 	.globl _time_unit
                                    113 	.globl _count
                                    114 	.globl _new_threadID
                                    115 	.globl _temp
                                    116 	.globl _cur_threadID
                                    117 	.globl _bitmap
                                    118 	.globl _savedSP
                                    119 	.globl _ID
                                    120 	.globl _thread_car
                                    121 	.globl _car_num
                                    122 	.globl _lot_b
                                    123 	.globl _lot_a
                                    124 	.globl _empty
                                    125 	.globl _mutex
                                    126 	.globl _ThreadCreate
                                    127 	.globl _ThreadYield
                                    128 	.globl _ThreadExit
                                    129 ;--------------------------------------------------------
                                    130 ; special function registers
                                    131 ;--------------------------------------------------------
                                    132 	.area RSEG    (ABS,DATA)
      000000                        133 	.org 0x0000
                           000080   134 _P0	=	0x0080
                           000081   135 _SP	=	0x0081
                           000082   136 _DPL	=	0x0082
                           000083   137 _DPH	=	0x0083
                           000087   138 _PCON	=	0x0087
                           000088   139 _TCON	=	0x0088
                           000089   140 _TMOD	=	0x0089
                           00008A   141 _TL0	=	0x008a
                           00008B   142 _TL1	=	0x008b
                           00008C   143 _TH0	=	0x008c
                           00008D   144 _TH1	=	0x008d
                           000090   145 _P1	=	0x0090
                           000098   146 _SCON	=	0x0098
                           000099   147 _SBUF	=	0x0099
                           0000A0   148 _P2	=	0x00a0
                           0000A8   149 _IE	=	0x00a8
                           0000B0   150 _P3	=	0x00b0
                           0000B8   151 _IP	=	0x00b8
                           0000D0   152 _PSW	=	0x00d0
                           0000E0   153 _ACC	=	0x00e0
                           0000F0   154 _B	=	0x00f0
                                    155 ;--------------------------------------------------------
                                    156 ; special function bits
                                    157 ;--------------------------------------------------------
                                    158 	.area RSEG    (ABS,DATA)
      000000                        159 	.org 0x0000
                           000080   160 _P0_0	=	0x0080
                           000081   161 _P0_1	=	0x0081
                           000082   162 _P0_2	=	0x0082
                           000083   163 _P0_3	=	0x0083
                           000084   164 _P0_4	=	0x0084
                           000085   165 _P0_5	=	0x0085
                           000086   166 _P0_6	=	0x0086
                           000087   167 _P0_7	=	0x0087
                           000088   168 _IT0	=	0x0088
                           000089   169 _IE0	=	0x0089
                           00008A   170 _IT1	=	0x008a
                           00008B   171 _IE1	=	0x008b
                           00008C   172 _TR0	=	0x008c
                           00008D   173 _TF0	=	0x008d
                           00008E   174 _TR1	=	0x008e
                           00008F   175 _TF1	=	0x008f
                           000090   176 _P1_0	=	0x0090
                           000091   177 _P1_1	=	0x0091
                           000092   178 _P1_2	=	0x0092
                           000093   179 _P1_3	=	0x0093
                           000094   180 _P1_4	=	0x0094
                           000095   181 _P1_5	=	0x0095
                           000096   182 _P1_6	=	0x0096
                           000097   183 _P1_7	=	0x0097
                           000098   184 _RI	=	0x0098
                           000099   185 _TI	=	0x0099
                           00009A   186 _RB8	=	0x009a
                           00009B   187 _TB8	=	0x009b
                           00009C   188 _REN	=	0x009c
                           00009D   189 _SM2	=	0x009d
                           00009E   190 _SM1	=	0x009e
                           00009F   191 _SM0	=	0x009f
                           0000A0   192 _P2_0	=	0x00a0
                           0000A1   193 _P2_1	=	0x00a1
                           0000A2   194 _P2_2	=	0x00a2
                           0000A3   195 _P2_3	=	0x00a3
                           0000A4   196 _P2_4	=	0x00a4
                           0000A5   197 _P2_5	=	0x00a5
                           0000A6   198 _P2_6	=	0x00a6
                           0000A7   199 _P2_7	=	0x00a7
                           0000A8   200 _EX0	=	0x00a8
                           0000A9   201 _ET0	=	0x00a9
                           0000AA   202 _EX1	=	0x00aa
                           0000AB   203 _ET1	=	0x00ab
                           0000AC   204 _ES	=	0x00ac
                           0000AF   205 _EA	=	0x00af
                           0000B0   206 _P3_0	=	0x00b0
                           0000B1   207 _P3_1	=	0x00b1
                           0000B2   208 _P3_2	=	0x00b2
                           0000B3   209 _P3_3	=	0x00b3
                           0000B4   210 _P3_4	=	0x00b4
                           0000B5   211 _P3_5	=	0x00b5
                           0000B6   212 _P3_6	=	0x00b6
                           0000B7   213 _P3_7	=	0x00b7
                           0000B0   214 _RXD	=	0x00b0
                           0000B1   215 _TXD	=	0x00b1
                           0000B2   216 _INT0	=	0x00b2
                           0000B3   217 _INT1	=	0x00b3
                           0000B4   218 _T0	=	0x00b4
                           0000B5   219 _T1	=	0x00b5
                           0000B6   220 _WR	=	0x00b6
                           0000B7   221 _RD	=	0x00b7
                           0000B8   222 _PX0	=	0x00b8
                           0000B9   223 _PT0	=	0x00b9
                           0000BA   224 _PX1	=	0x00ba
                           0000BB   225 _PT1	=	0x00bb
                           0000BC   226 _PS	=	0x00bc
                           0000D0   227 _P	=	0x00d0
                           0000D1   228 _F1	=	0x00d1
                           0000D2   229 _OV	=	0x00d2
                           0000D3   230 _RS0	=	0x00d3
                           0000D4   231 _RS1	=	0x00d4
                           0000D5   232 _F0	=	0x00d5
                           0000D6   233 _AC	=	0x00d6
                           0000D7   234 _CY	=	0x00d7
                                    235 ;--------------------------------------------------------
                                    236 ; overlayable register banks
                                    237 ;--------------------------------------------------------
                                    238 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        239 	.ds 8
                                    240 ;--------------------------------------------------------
                                    241 ; internal ram data
                                    242 ;--------------------------------------------------------
                                    243 	.area DSEG    (DATA)
                           000020   244 _mutex	=	0x0020
                           000021   245 _empty	=	0x0021
                           000022   246 _lot_a	=	0x0022
                           000023   247 _lot_b	=	0x0023
                           000024   248 _car_num	=	0x0024
                           000025   249 _thread_car	=	0x0025
                           000029   250 _ID	=	0x0029
                           000030   251 _savedSP	=	0x0030
                           000034   252 _bitmap	=	0x0034
                           000035   253 _cur_threadID	=	0x0035
                           000036   254 _temp	=	0x0036
                           000037   255 _new_threadID	=	0x0037
                           000038   256 _count	=	0x0038
                           000039   257 _time_unit	=	0x0039
                           00003A   258 _time_limit	=	0x003a
                           00003E   259 _threadnum	=	0x003e
                                    260 ;--------------------------------------------------------
                                    261 ; overlayable items in internal ram 
                                    262 ;--------------------------------------------------------
                                    263 	.area	OSEG    (OVR,DATA)
                                    264 ;--------------------------------------------------------
                                    265 ; indirectly addressable internal ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area ISEG    (DATA)
                                    268 ;--------------------------------------------------------
                                    269 ; absolute internal ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area IABS    (ABS,DATA)
                                    272 	.area IABS    (ABS,DATA)
                                    273 ;--------------------------------------------------------
                                    274 ; bit data
                                    275 ;--------------------------------------------------------
                                    276 	.area BSEG    (BIT)
                                    277 ;--------------------------------------------------------
                                    278 ; paged external ram data
                                    279 ;--------------------------------------------------------
                                    280 	.area PSEG    (PAG,XDATA)
                                    281 ;--------------------------------------------------------
                                    282 ; external ram data
                                    283 ;--------------------------------------------------------
                                    284 	.area XSEG    (XDATA)
                                    285 ;--------------------------------------------------------
                                    286 ; absolute external ram data
                                    287 ;--------------------------------------------------------
                                    288 	.area XABS    (ABS,XDATA)
                                    289 ;--------------------------------------------------------
                                    290 ; external initialized ram data
                                    291 ;--------------------------------------------------------
                                    292 	.area XISEG   (XDATA)
                                    293 	.area HOME    (CODE)
                                    294 	.area GSINIT0 (CODE)
                                    295 	.area GSINIT1 (CODE)
                                    296 	.area GSINIT2 (CODE)
                                    297 	.area GSINIT3 (CODE)
                                    298 	.area GSINIT4 (CODE)
                                    299 	.area GSINIT5 (CODE)
                                    300 	.area GSINIT  (CODE)
                                    301 	.area GSFINAL (CODE)
                                    302 	.area CSEG    (CODE)
                                    303 ;--------------------------------------------------------
                                    304 ; global & static initialisations
                                    305 ;--------------------------------------------------------
                                    306 	.area HOME    (CODE)
                                    307 	.area GSINIT  (CODE)
                                    308 	.area GSFINAL (CODE)
                                    309 	.area GSINIT  (CODE)
                                    310 ;--------------------------------------------------------
                                    311 ; Home
                                    312 ;--------------------------------------------------------
                                    313 	.area HOME    (CODE)
                                    314 	.area HOME    (CODE)
                                    315 ;--------------------------------------------------------
                                    316 ; code
                                    317 ;--------------------------------------------------------
                                    318 	.area CSEG    (CODE)
                                    319 ;------------------------------------------------------------
                                    320 ;Allocation info for local variables in function 'Bootstrap'
                                    321 ;------------------------------------------------------------
                                    322 ;	preemptive.c:32: void Bootstrap(void) {
                                    323 ;	-----------------------------------------
                                    324 ;	 function Bootstrap
                                    325 ;	-----------------------------------------
      000185                        326 _Bootstrap:
                           000007   327 	ar7 = 0x07
                           000006   328 	ar6 = 0x06
                           000005   329 	ar5 = 0x05
                           000004   330 	ar4 = 0x04
                           000003   331 	ar3 = 0x03
                           000002   332 	ar2 = 0x02
                           000001   333 	ar1 = 0x01
                           000000   334 	ar0 = 0x00
                                    335 ;	preemptive.c:34: TMOD = 0;  // timer 0 mode 0
      000185 75 89 00         [24]  336 	mov	_TMOD,#0x00
                                    337 ;	preemptive.c:35: IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
      000188 75 A8 82         [24]  338 	mov	_IE,#0x82
                                    339 ;	preemptive.c:37: TR0 = 1; // set bit TR0 to start running timer 0
                                    340 ;	assignBit
      00018B D2 8C            [12]  341 	setb	_TR0
                                    342 ;	preemptive.c:38: bitmap = 0;
      00018D 75 34 00         [24]  343 	mov	_bitmap,#0x00
                                    344 ;	preemptive.c:39: cur_threadID = ThreadCreate( main );
      000190 90 01 2E         [24]  345 	mov	dptr,#_main
      000193 12 01 AB         [24]  346 	lcall	_ThreadCreate
      000196 85 82 35         [24]  347 	mov	_cur_threadID,dpl
                                    348 ;	preemptive.c:40: RESTORESTATE;
      000199 E5 35            [12]  349 	mov	a,_cur_threadID
      00019B 24 30            [12]  350 	add	a,#_savedSP
      00019D F9               [12]  351 	mov	r1,a
      00019E 87 81            [24]  352 	mov	_SP,@r1
      0001A0 D0 D0            [24]  353 	pop PSW 
      0001A2 D0 83            [24]  354 	pop DPH 
      0001A4 D0 82            [24]  355 	pop DPL 
      0001A6 D0 F0            [24]  356 	pop B 
      0001A8 D0 E0            [24]  357 	pop ACC 
                                    358 ;	preemptive.c:44: }
      0001AA 22               [24]  359 	ret
                                    360 ;------------------------------------------------------------
                                    361 ;Allocation info for local variables in function 'ThreadCreate'
                                    362 ;------------------------------------------------------------
                                    363 ;fp                        Allocated to registers 
                                    364 ;------------------------------------------------------------
                                    365 ;	preemptive.c:47: ThreadID ThreadCreate(FunctionPtr fp) {
                                    366 ;	-----------------------------------------
                                    367 ;	 function ThreadCreate
                                    368 ;	-----------------------------------------
      0001AB                        369 _ThreadCreate:
                                    370 ;	preemptive.c:48: EA = 0;
                                    371 ;	assignBit
      0001AB C2 AF            [12]  372 	clr	_EA
                                    373 ;	preemptive.c:49: if( bitmap == 0b1111) return -1;
      0001AD 74 0F            [12]  374 	mov	a,#0x0f
      0001AF B5 34 04         [24]  375 	cjne	a,_bitmap,00102$
      0001B2 75 82 FF         [24]  376 	mov	dpl,#0xff
      0001B5 22               [24]  377 	ret
      0001B6                        378 00102$:
                                    379 ;	preemptive.c:51: if( !( bitmap & 1 ) ){
      0001B6 E5 34            [12]  380 	mov	a,_bitmap
      0001B8 20 E0 08         [24]  381 	jb	acc.0,00112$
                                    382 ;	preemptive.c:52: bitmap = bitmap | 1;
      0001BB 43 34 01         [24]  383 	orl	_bitmap,#0x01
                                    384 ;	preemptive.c:53: new_threadID = 0;
      0001BE 75 37 00         [24]  385 	mov	_new_threadID,#0x00
      0001C1 80 25            [24]  386 	sjmp	00113$
      0001C3                        387 00112$:
                                    388 ;	preemptive.c:55: else if( !( bitmap & 2 ) ){
      0001C3 E5 34            [12]  389 	mov	a,_bitmap
      0001C5 20 E1 08         [24]  390 	jb	acc.1,00109$
                                    391 ;	preemptive.c:56: bitmap = bitmap | 2;
      0001C8 43 34 02         [24]  392 	orl	_bitmap,#0x02
                                    393 ;	preemptive.c:57: new_threadID = 1;
      0001CB 75 37 01         [24]  394 	mov	_new_threadID,#0x01
      0001CE 80 18            [24]  395 	sjmp	00113$
      0001D0                        396 00109$:
                                    397 ;	preemptive.c:59: else if( !( bitmap & 4 ) ){
      0001D0 E5 34            [12]  398 	mov	a,_bitmap
      0001D2 20 E2 08         [24]  399 	jb	acc.2,00106$
                                    400 ;	preemptive.c:60: bitmap = bitmap | 4;
      0001D5 43 34 04         [24]  401 	orl	_bitmap,#0x04
                                    402 ;	preemptive.c:61: new_threadID = 2;
      0001D8 75 37 02         [24]  403 	mov	_new_threadID,#0x02
      0001DB 80 0B            [24]  404 	sjmp	00113$
      0001DD                        405 00106$:
                                    406 ;	preemptive.c:63: else if( !( bitmap & 8 ) ){
      0001DD E5 34            [12]  407 	mov	a,_bitmap
      0001DF 20 E3 06         [24]  408 	jb	acc.3,00113$
                                    409 ;	preemptive.c:64: bitmap = bitmap | 8;
      0001E2 43 34 08         [24]  410 	orl	_bitmap,#0x08
                                    411 ;	preemptive.c:65: new_threadID = 3;
      0001E5 75 37 03         [24]  412 	mov	_new_threadID,#0x03
      0001E8                        413 00113$:
                                    414 ;	preemptive.c:68: temp = SP;
      0001E8 85 81 36         [24]  415 	mov	_temp,_SP
                                    416 ;	preemptive.c:69: SP = (0x3F) + (0x10) * new_threadID;
      0001EB E5 37            [12]  417 	mov	a,_new_threadID
      0001ED C4               [12]  418 	swap	a
      0001EE 54 F0            [12]  419 	anl	a,#0xf0
      0001F0 FF               [12]  420 	mov	r7,a
      0001F1 24 3F            [12]  421 	add	a,#0x3f
      0001F3 F5 81            [12]  422 	mov	_SP,a
                                    423 ;	preemptive.c:79: __endasm;
      0001F5 C0 82            [24]  424 	push	DPL
      0001F7 C0 83            [24]  425 	push	DPH
      0001F9 74 00            [12]  426 	MOV	A, #0
      0001FB C0 E0            [24]  427 	push	ACC
      0001FD C0 E0            [24]  428 	push	ACC
      0001FF C0 E0            [24]  429 	push	ACC
      000201 C0 E0            [24]  430 	push	ACC
                                    431 ;	preemptive.c:81: PSW = new_threadID << 3;
      000203 E5 37            [12]  432 	mov	a,_new_threadID
      000205 FF               [12]  433 	mov	r7,a
      000206 C4               [12]  434 	swap	a
      000207 03               [12]  435 	rr	a
      000208 54 F8            [12]  436 	anl	a,#0xf8
      00020A F5 D0            [12]  437 	mov	_PSW,a
                                    438 ;	preemptive.c:84: __endasm;
      00020C C0 D0            [24]  439 	push	PSW
                                    440 ;	preemptive.c:86: savedSP[new_threadID] = SP;
      00020E E5 37            [12]  441 	mov	a,_new_threadID
      000210 24 30            [12]  442 	add	a,#_savedSP
      000212 F8               [12]  443 	mov	r0,a
      000213 A6 81            [24]  444 	mov	@r0,_SP
                                    445 ;	preemptive.c:88: SP = temp;
      000215 85 36 81         [24]  446 	mov	_SP,_temp
                                    447 ;	preemptive.c:90: EA = 1;
                                    448 ;	assignBit
      000218 D2 AF            [12]  449 	setb	_EA
                                    450 ;	preemptive.c:91: return new_threadID;        
      00021A 85 37 82         [24]  451 	mov	dpl,_new_threadID
                                    452 ;	preemptive.c:92: }
      00021D 22               [24]  453 	ret
                                    454 ;------------------------------------------------------------
                                    455 ;Allocation info for local variables in function 'ThreadYield'
                                    456 ;------------------------------------------------------------
                                    457 ;	preemptive.c:96: void ThreadYield(void) {
                                    458 ;	-----------------------------------------
                                    459 ;	 function ThreadYield
                                    460 ;	-----------------------------------------
      00021E                        461 _ThreadYield:
                                    462 ;	preemptive.c:97: EA = 0;
                                    463 ;	assignBit
      00021E C2 AF            [12]  464 	clr	_EA
                                    465 ;	preemptive.c:98: SAVESTATE;
      000220 C0 E0            [24]  466 	push ACC 
      000222 C0 F0            [24]  467 	push B 
      000224 C0 82            [24]  468 	push DPL 
      000226 C0 83            [24]  469 	push DPH 
      000228 C0 D0            [24]  470 	push PSW 
      00022A E5 35            [12]  471 	mov	a,_cur_threadID
      00022C 24 30            [12]  472 	add	a,#_savedSP
      00022E F8               [12]  473 	mov	r0,a
      00022F A6 81            [24]  474 	mov	@r0,_SP
                                    475 ;	preemptive.c:99: do {
      000231                        476 00103$:
                                    477 ;	preemptive.c:101: cur_threadID = (cur_threadID < 3 ) ?  cur_threadID+1 : 0;
      000231 74 FD            [12]  478 	mov	a,#0x100 - 0x03
      000233 25 35            [12]  479 	add	a,_cur_threadID
      000235 40 0B            [24]  480 	jc	00108$
      000237 AF 35            [24]  481 	mov	r7,_cur_threadID
      000239 0F               [12]  482 	inc	r7
      00023A EF               [12]  483 	mov	a,r7
      00023B FE               [12]  484 	mov	r6,a
      00023C 33               [12]  485 	rlc	a
      00023D 95 E0            [12]  486 	subb	a,acc
      00023F FF               [12]  487 	mov	r7,a
      000240 80 04            [24]  488 	sjmp	00109$
      000242                        489 00108$:
      000242 7E 00            [12]  490 	mov	r6,#0x00
      000244 7F 00            [12]  491 	mov	r7,#0x00
      000246                        492 00109$:
      000246 8E 35            [24]  493 	mov	_cur_threadID,r6
                                    494 ;	preemptive.c:102: if(bitmap & (1<<cur_threadID)) break;
      000248 AF 35            [24]  495 	mov	r7,_cur_threadID
      00024A 8F F0            [24]  496 	mov	b,r7
      00024C 05 F0            [12]  497 	inc	b
      00024E 7F 01            [12]  498 	mov	r7,#0x01
      000250 7E 00            [12]  499 	mov	r6,#0x00
      000252 80 06            [24]  500 	sjmp	00124$
      000254                        501 00123$:
      000254 EF               [12]  502 	mov	a,r7
      000255 2F               [12]  503 	add	a,r7
      000256 FF               [12]  504 	mov	r7,a
      000257 EE               [12]  505 	mov	a,r6
      000258 33               [12]  506 	rlc	a
      000259 FE               [12]  507 	mov	r6,a
      00025A                        508 00124$:
      00025A D5 F0 F7         [24]  509 	djnz	b,00123$
      00025D AC 34            [24]  510 	mov	r4,_bitmap
      00025F 7D 00            [12]  511 	mov	r5,#0x00
      000261 EC               [12]  512 	mov	a,r4
      000262 52 07            [12]  513 	anl	ar7,a
      000264 ED               [12]  514 	mov	a,r5
      000265 52 06            [12]  515 	anl	ar6,a
      000267 EF               [12]  516 	mov	a,r7
      000268 4E               [12]  517 	orl	a,r6
      000269 60 C6            [24]  518 	jz	00103$
                                    519 ;	preemptive.c:105: RESTORESTATE;
      00026B E5 35            [12]  520 	mov	a,_cur_threadID
      00026D 24 30            [12]  521 	add	a,#_savedSP
      00026F F9               [12]  522 	mov	r1,a
      000270 87 81            [24]  523 	mov	_SP,@r1
      000272 D0 D0            [24]  524 	pop PSW 
      000274 D0 83            [24]  525 	pop DPH 
      000276 D0 82            [24]  526 	pop DPL 
      000278 D0 F0            [24]  527 	pop B 
      00027A D0 E0            [24]  528 	pop ACC 
                                    529 ;	preemptive.c:106: EA = 1;
                                    530 ;	assignBit
      00027C D2 AF            [12]  531 	setb	_EA
                                    532 ;	preemptive.c:107: }
      00027E 22               [24]  533 	ret
                                    534 ;------------------------------------------------------------
                                    535 ;Allocation info for local variables in function 'myTimer0Handler'
                                    536 ;------------------------------------------------------------
                                    537 ;	preemptive.c:109: void myTimer0Handler(void) {
                                    538 ;	-----------------------------------------
                                    539 ;	 function myTimer0Handler
                                    540 ;	-----------------------------------------
      00027F                        541 _myTimer0Handler:
                                    542 ;	preemptive.c:110: EA = 0;
                                    543 ;	assignBit
      00027F C2 AF            [12]  544 	clr	_EA
                                    545 ;	preemptive.c:111: SAVESTATE;
      000281 C0 E0            [24]  546 	push ACC 
      000283 C0 F0            [24]  547 	push B 
      000285 C0 82            [24]  548 	push DPL 
      000287 C0 83            [24]  549 	push DPH 
      000289 C0 D0            [24]  550 	push PSW 
      00028B E5 35            [12]  551 	mov	a,_cur_threadID
      00028D 24 30            [12]  552 	add	a,#_savedSP
      00028F F8               [12]  553 	mov	r0,a
      000290 A6 81            [24]  554 	mov	@r0,_SP
                                    555 ;	preemptive.c:129: __endasm;
      000292 E8               [12]  556 	MOV	A, R0
      000293 C0 E0            [24]  557 	PUSH	ACC
      000295 E9               [12]  558 	MOV	A, R1
      000296 C0 E0            [24]  559 	PUSH	ACC
      000298 EA               [12]  560 	MOV	A, R2
      000299 C0 E0            [24]  561 	PUSH	ACC
      00029B EB               [12]  562 	MOV	A, R3
      00029C C0 E0            [24]  563 	PUSH	ACC
      00029E EC               [12]  564 	MOV	A, R4
      00029F C0 E0            [24]  565 	PUSH	ACC
      0002A1 ED               [12]  566 	MOV	A, R5
      0002A2 C0 E0            [24]  567 	PUSH	ACC
      0002A4 EE               [12]  568 	MOV	A, R6
      0002A5 C0 E0            [24]  569 	PUSH	ACC
      0002A7 EF               [12]  570 	MOV	A, R7
      0002A8 C0 E0            [24]  571 	PUSH	ACC
                                    572 ;	preemptive.c:130: count = count + 1; // counting the 8051 timer
      0002AA E5 38            [12]  573 	mov	a,_count
      0002AC FF               [12]  574 	mov	r7,a
      0002AD 04               [12]  575 	inc	a
      0002AE F5 38            [12]  576 	mov	_count,a
                                    577 ;	preemptive.c:131: if(count==8){ 
      0002B0 74 08            [12]  578 	mov	a,#0x08
      0002B2 B5 38 41         [24]  579 	cjne	a,_count,00114$
                                    580 ;	preemptive.c:132: time_unit = time_unit + 1; // 8 8051 timers = 1 time_unit
      0002B5 E5 39            [12]  581 	mov	a,_time_unit
      0002B7 04               [12]  582 	inc	a
      0002B8 F5 39            [12]  583 	mov	_time_unit,a
                                    584 ;	preemptive.c:133: count = 0; 
      0002BA 75 38 00         [24]  585 	mov	_count,#0x00
                                    586 ;	preemptive.c:134: print(((time_unit&56)>>3)+'0';); //the first digit of the number of time_unit in Octal 
      0002BD AE 39            [24]  587 	mov	r6,_time_unit
      0002BF 53 06 38         [24]  588 	anl	ar6,#0x38
      0002C2 E4               [12]  589 	clr	a
      0002C3 C4               [12]  590 	swap	a
      0002C4 23               [12]  591 	rl	a
      0002C5 CE               [12]  592 	xch	a,r6
      0002C6 C4               [12]  593 	swap	a
      0002C7 23               [12]  594 	rl	a
      0002C8 54 1F            [12]  595 	anl	a,#0x1f
      0002CA 6E               [12]  596 	xrl	a,r6
      0002CB CE               [12]  597 	xch	a,r6
      0002CC 54 1F            [12]  598 	anl	a,#0x1f
      0002CE CE               [12]  599 	xch	a,r6
      0002CF 6E               [12]  600 	xrl	a,r6
      0002D0 CE               [12]  601 	xch	a,r6
      0002D1 30 E4 02         [24]  602 	jnb	acc.4,00163$
      0002D4 44 E0            [12]  603 	orl	a,#0xe0
      0002D6                        604 00163$:
      0002D6 74 30            [12]  605 	mov	a,#0x30
      0002D8 2E               [12]  606 	add	a,r6
      0002D9 F5 99            [12]  607 	mov	_SBUF,a
      0002DB                        608 00101$:
                                    609 ;	assignBit
      0002DB 10 99 02         [24]  610 	jbc	_TI,00164$
      0002DE 80 FB            [24]  611 	sjmp	00101$
      0002E0                        612 00164$:
                                    613 ;	preemptive.c:135: print((time_unit&7)+'0';);       //the second digit of the number of time_unit in Octal 
      0002E0 AF 39            [24]  614 	mov	r7,_time_unit
      0002E2 74 07            [12]  615 	mov	a,#0x07
      0002E4 5F               [12]  616 	anl	a,r7
      0002E5 24 30            [12]  617 	add	a,#0x30
      0002E7 F5 99            [12]  618 	mov	_SBUF,a
      0002E9                        619 00104$:
                                    620 ;	assignBit
      0002E9 10 99 02         [24]  621 	jbc	_TI,00165$
      0002EC 80 FB            [24]  622 	sjmp	00104$
      0002EE                        623 00165$:
                                    624 ;	preemptive.c:136: print('\n');
      0002EE 75 99 0A         [24]  625 	mov	_SBUF,#0x0a
      0002F1                        626 00107$:
                                    627 ;	assignBit
      0002F1 10 99 02         [24]  628 	jbc	_TI,00166$
      0002F4 80 FB            [24]  629 	sjmp	00107$
      0002F6                        630 00166$:
                                    631 ;	preemptive.c:138: do {    
      0002F6                        632 00114$:
                                    633 ;	preemptive.c:139: cur_threadID = (cur_threadID < 3 ) ?  cur_threadID+1 : 0;
      0002F6 74 FD            [12]  634 	mov	a,#0x100 - 0x03
      0002F8 25 35            [12]  635 	add	a,_cur_threadID
      0002FA 40 0B            [24]  636 	jc	00119$
      0002FC AF 35            [24]  637 	mov	r7,_cur_threadID
      0002FE 0F               [12]  638 	inc	r7
      0002FF EF               [12]  639 	mov	a,r7
      000300 FE               [12]  640 	mov	r6,a
      000301 33               [12]  641 	rlc	a
      000302 95 E0            [12]  642 	subb	a,acc
      000304 FF               [12]  643 	mov	r7,a
      000305 80 04            [24]  644 	sjmp	00120$
      000307                        645 00119$:
      000307 7E 00            [12]  646 	mov	r6,#0x00
      000309 7F 00            [12]  647 	mov	r7,#0x00
      00030B                        648 00120$:
      00030B 8E 35            [24]  649 	mov	_cur_threadID,r6
                                    650 ;	preemptive.c:140: temp=(1<<cur_threadID);
      00030D AF 35            [24]  651 	mov	r7,_cur_threadID
      00030F 8F F0            [24]  652 	mov	b,r7
      000311 05 F0            [12]  653 	inc	b
      000313 74 01            [12]  654 	mov	a,#0x01
      000315 80 02            [24]  655 	sjmp	00170$
      000317                        656 00168$:
      000317 25 E0            [12]  657 	add	a,acc
      000319                        658 00170$:
      000319 D5 F0 FB         [24]  659 	djnz	b,00168$
      00031C F5 36            [12]  660 	mov	_temp,a
                                    661 ;	preemptive.c:141: if( bitmap & temp ){
      00031E E5 36            [12]  662 	mov	a,_temp
      000320 55 34            [12]  663 	anl	a,_bitmap
      000322 60 D2            [24]  664 	jz	00114$
                                    665 ;	preemptive.c:163: __endasm;  
      000324 D0 E0            [24]  666 	POP	ACC
      000326 FF               [12]  667 	MOV	R7, A
      000327 D0 E0            [24]  668 	POP	ACC
      000329 FE               [12]  669 	MOV	R6, A
      00032A D0 E0            [24]  670 	POP	ACC
      00032C FD               [12]  671 	MOV	R5, A
      00032D D0 E0            [24]  672 	POP	ACC
      00032F FC               [12]  673 	MOV	R4, A
      000330 D0 E0            [24]  674 	POP	ACC
      000332 FB               [12]  675 	MOV	R3, A
      000333 D0 E0            [24]  676 	POP	ACC
      000335 FA               [12]  677 	MOV	R2, A
      000336 D0 E0            [24]  678 	POP	ACC
      000338 F9               [12]  679 	MOV	R1, A
      000339 D0 E0            [24]  680 	POP	ACC
      00033B F8               [12]  681 	MOV	R0, A
                                    682 ;	preemptive.c:164: RESTORESTATE;
      00033C E5 35            [12]  683 	mov	a,_cur_threadID
      00033E 24 30            [12]  684 	add	a,#_savedSP
      000340 F9               [12]  685 	mov	r1,a
      000341 87 81            [24]  686 	mov	_SP,@r1
      000343 D0 D0            [24]  687 	pop PSW 
      000345 D0 83            [24]  688 	pop DPH 
      000347 D0 82            [24]  689 	pop DPL 
      000349 D0 F0            [24]  690 	pop B 
      00034B D0 E0            [24]  691 	pop ACC 
                                    692 ;	preemptive.c:165: EA = 1;
                                    693 ;	assignBit
      00034D D2 AF            [12]  694 	setb	_EA
                                    695 ;	preemptive.c:168: __endasm;
      00034F 32               [24]  696 	RETI
                                    697 ;	preemptive.c:169: }
      000350 22               [24]  698 	ret
                                    699 ;------------------------------------------------------------
                                    700 ;Allocation info for local variables in function 'ThreadExit'
                                    701 ;------------------------------------------------------------
                                    702 ;	preemptive.c:170: void ThreadExit(void) {
                                    703 ;	-----------------------------------------
                                    704 ;	 function ThreadExit
                                    705 ;	-----------------------------------------
      000351                        706 _ThreadExit:
                                    707 ;	preemptive.c:171: EA = 0;
                                    708 ;	assignBit
      000351 C2 AF            [12]  709 	clr	_EA
                                    710 ;	preemptive.c:172: if(cur_threadID == 0) bitmap = bitmap - 1;
      000353 E5 35            [12]  711 	mov	a,_cur_threadID
      000355 70 08            [24]  712 	jnz	00110$
      000357 E5 34            [12]  713 	mov	a,_bitmap
      000359 FF               [12]  714 	mov	r7,a
      00035A 14               [12]  715 	dec	a
      00035B F5 34            [12]  716 	mov	_bitmap,a
      00035D 80 28            [24]  717 	sjmp	00111$
      00035F                        718 00110$:
                                    719 ;	preemptive.c:173: else if( cur_threadID == 1 )bitmap = bitmap - 2;
      00035F 74 01            [12]  720 	mov	a,#0x01
      000361 B5 35 09         [24]  721 	cjne	a,_cur_threadID,00107$
      000364 E5 34            [12]  722 	mov	a,_bitmap
      000366 FF               [12]  723 	mov	r7,a
      000367 24 FE            [12]  724 	add	a,#0xfe
      000369 F5 34            [12]  725 	mov	_bitmap,a
      00036B 80 1A            [24]  726 	sjmp	00111$
      00036D                        727 00107$:
                                    728 ;	preemptive.c:174: else if( cur_threadID == 2 )bitmap = bitmap - 4;
      00036D 74 02            [12]  729 	mov	a,#0x02
      00036F B5 35 09         [24]  730 	cjne	a,_cur_threadID,00104$
      000372 E5 34            [12]  731 	mov	a,_bitmap
      000374 FF               [12]  732 	mov	r7,a
      000375 24 FC            [12]  733 	add	a,#0xfc
      000377 F5 34            [12]  734 	mov	_bitmap,a
      000379 80 0C            [24]  735 	sjmp	00111$
      00037B                        736 00104$:
                                    737 ;	preemptive.c:175: else if( cur_threadID == 3 )bitmap = bitmap - 8;
      00037B 74 03            [12]  738 	mov	a,#0x03
      00037D B5 35 07         [24]  739 	cjne	a,_cur_threadID,00111$
      000380 E5 34            [12]  740 	mov	a,_bitmap
      000382 FF               [12]  741 	mov	r7,a
      000383 24 F8            [12]  742 	add	a,#0xf8
      000385 F5 34            [12]  743 	mov	_bitmap,a
      000387                        744 00111$:
                                    745 ;	preemptive.c:177: if(  bitmap & 1  ){
      000387 E5 34            [12]  746 	mov	a,_bitmap
      000389 30 E0 05         [24]  747 	jnb	acc.0,00134$
                                    748 ;	preemptive.c:178: cur_threadID = 0;
      00038C 75 35 00         [24]  749 	mov	_cur_threadID,#0x00
      00038F 80 38            [24]  750 	sjmp	00135$
      000391                        751 00134$:
                                    752 ;	preemptive.c:179: }else if(  bitmap & 2  ){
      000391 E5 34            [12]  753 	mov	a,_bitmap
      000393 30 E1 05         [24]  754 	jnb	acc.1,00131$
                                    755 ;	preemptive.c:180: cur_threadID = 1;
      000396 75 35 01         [24]  756 	mov	_cur_threadID,#0x01
      000399 80 2E            [24]  757 	sjmp	00135$
      00039B                        758 00131$:
                                    759 ;	preemptive.c:181: }else if(  bitmap & 4  ){
      00039B E5 34            [12]  760 	mov	a,_bitmap
      00039D 30 E2 05         [24]  761 	jnb	acc.2,00128$
                                    762 ;	preemptive.c:182: cur_threadID = 2;
      0003A0 75 35 02         [24]  763 	mov	_cur_threadID,#0x02
      0003A3 80 24            [24]  764 	sjmp	00135$
      0003A5                        765 00128$:
                                    766 ;	preemptive.c:183: }else if(  bitmap & 8  ){
      0003A5 E5 34            [12]  767 	mov	a,_bitmap
      0003A7 30 E3 05         [24]  768 	jnb	acc.3,00125$
                                    769 ;	preemptive.c:184: cur_threadID = 3;
      0003AA 75 35 03         [24]  770 	mov	_cur_threadID,#0x03
      0003AD 80 1A            [24]  771 	sjmp	00135$
      0003AF                        772 00125$:
                                    773 ;	preemptive.c:186: print('e');
      0003AF 75 99 65         [24]  774 	mov	_SBUF,#0x65
      0003B2                        775 00112$:
                                    776 ;	assignBit
      0003B2 10 99 02         [24]  777 	jbc	_TI,00209$
      0003B5 80 FB            [24]  778 	sjmp	00112$
      0003B7                        779 00209$:
                                    780 ;	preemptive.c:187: print('n');
      0003B7 75 99 6E         [24]  781 	mov	_SBUF,#0x6e
      0003BA                        782 00115$:
                                    783 ;	assignBit
      0003BA 10 99 02         [24]  784 	jbc	_TI,00210$
      0003BD 80 FB            [24]  785 	sjmp	00115$
      0003BF                        786 00210$:
                                    787 ;	preemptive.c:188: print('d');
      0003BF 75 99 64         [24]  788 	mov	_SBUF,#0x64
      0003C2                        789 00118$:
                                    790 ;	assignBit
      0003C2 10 99 02         [24]  791 	jbc	_TI,00211$
      0003C5 80 FB            [24]  792 	sjmp	00118$
      0003C7                        793 00211$:
                                    794 ;	preemptive.c:189: while(1){}
      0003C7                        795 00122$:
      0003C7 80 FE            [24]  796 	sjmp	00122$
      0003C9                        797 00135$:
                                    798 ;	preemptive.c:192: RESTORESTATE;
      0003C9 E5 35            [12]  799 	mov	a,_cur_threadID
      0003CB 24 30            [12]  800 	add	a,#_savedSP
      0003CD F9               [12]  801 	mov	r1,a
      0003CE 87 81            [24]  802 	mov	_SP,@r1
      0003D0 D0 D0            [24]  803 	pop PSW 
      0003D2 D0 83            [24]  804 	pop DPH 
      0003D4 D0 82            [24]  805 	pop DPL 
      0003D6 D0 F0            [24]  806 	pop B 
      0003D8 D0 E0            [24]  807 	pop ACC 
                                    808 ;	preemptive.c:193: EA = 1;
                                    809 ;	assignBit
      0003DA D2 AF            [12]  810 	setb	_EA
                                    811 ;	preemptive.c:194: }
      0003DC 22               [24]  812 	ret
                                    813 	.area CSEG    (CODE)
                                    814 	.area CONST   (CODE)
                                    815 	.area XINIT   (CODE)
                                    816 	.area CABS    (ABS,CODE)
