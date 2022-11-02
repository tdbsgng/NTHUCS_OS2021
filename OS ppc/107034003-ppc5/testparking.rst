                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.9.0 #11195 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module testparking
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _timer0_ISR
                                     12 	.globl __mcs51_genXRAMCLEAR
                                     13 	.globl __mcs51_genXINIT
                                     14 	.globl __mcs51_genRAMCLEAR
                                     15 	.globl __sdcc_gsinit_startup
                                     16 	.globl _main
                                     17 	.globl _Producer
                                     18 	.globl _ThreadExit
                                     19 	.globl _ThreadCreate
                                     20 	.globl _CY
                                     21 	.globl _AC
                                     22 	.globl _F0
                                     23 	.globl _RS1
                                     24 	.globl _RS0
                                     25 	.globl _OV
                                     26 	.globl _F1
                                     27 	.globl _P
                                     28 	.globl _PS
                                     29 	.globl _PT1
                                     30 	.globl _PX1
                                     31 	.globl _PT0
                                     32 	.globl _PX0
                                     33 	.globl _RD
                                     34 	.globl _WR
                                     35 	.globl _T1
                                     36 	.globl _T0
                                     37 	.globl _INT1
                                     38 	.globl _INT0
                                     39 	.globl _TXD
                                     40 	.globl _RXD
                                     41 	.globl _P3_7
                                     42 	.globl _P3_6
                                     43 	.globl _P3_5
                                     44 	.globl _P3_4
                                     45 	.globl _P3_3
                                     46 	.globl _P3_2
                                     47 	.globl _P3_1
                                     48 	.globl _P3_0
                                     49 	.globl _EA
                                     50 	.globl _ES
                                     51 	.globl _ET1
                                     52 	.globl _EX1
                                     53 	.globl _ET0
                                     54 	.globl _EX0
                                     55 	.globl _P2_7
                                     56 	.globl _P2_6
                                     57 	.globl _P2_5
                                     58 	.globl _P2_4
                                     59 	.globl _P2_3
                                     60 	.globl _P2_2
                                     61 	.globl _P2_1
                                     62 	.globl _P2_0
                                     63 	.globl _SM0
                                     64 	.globl _SM1
                                     65 	.globl _SM2
                                     66 	.globl _REN
                                     67 	.globl _TB8
                                     68 	.globl _RB8
                                     69 	.globl _TI
                                     70 	.globl _RI
                                     71 	.globl _P1_7
                                     72 	.globl _P1_6
                                     73 	.globl _P1_5
                                     74 	.globl _P1_4
                                     75 	.globl _P1_3
                                     76 	.globl _P1_2
                                     77 	.globl _P1_1
                                     78 	.globl _P1_0
                                     79 	.globl _TF1
                                     80 	.globl _TR1
                                     81 	.globl _TF0
                                     82 	.globl _TR0
                                     83 	.globl _IE1
                                     84 	.globl _IT1
                                     85 	.globl _IE0
                                     86 	.globl _IT0
                                     87 	.globl _P0_7
                                     88 	.globl _P0_6
                                     89 	.globl _P0_5
                                     90 	.globl _P0_4
                                     91 	.globl _P0_3
                                     92 	.globl _P0_2
                                     93 	.globl _P0_1
                                     94 	.globl _P0_0
                                     95 	.globl _B
                                     96 	.globl _ACC
                                     97 	.globl _PSW
                                     98 	.globl _IP
                                     99 	.globl _P3
                                    100 	.globl _IE
                                    101 	.globl _P2
                                    102 	.globl _SBUF
                                    103 	.globl _SCON
                                    104 	.globl _P1
                                    105 	.globl _TH1
                                    106 	.globl _TH0
                                    107 	.globl _TL1
                                    108 	.globl _TL0
                                    109 	.globl _TMOD
                                    110 	.globl _TCON
                                    111 	.globl _PCON
                                    112 	.globl _DPH
                                    113 	.globl _DPL
                                    114 	.globl _SP
                                    115 	.globl _P0
                                    116 	.globl _threadnum
                                    117 	.globl _time_limit
                                    118 	.globl _time_unit
                                    119 	.globl _count
                                    120 	.globl _new_threadID
                                    121 	.globl _temp
                                    122 	.globl _cur_threadID
                                    123 	.globl _bitmap
                                    124 	.globl _savedSP
                                    125 	.globl _ID
                                    126 	.globl _thread_car
                                    127 	.globl _car_num
                                    128 	.globl _lot_b
                                    129 	.globl _lot_a
                                    130 	.globl _empty
                                    131 	.globl _mutex
                                    132 ;--------------------------------------------------------
                                    133 ; special function registers
                                    134 ;--------------------------------------------------------
                                    135 	.area RSEG    (ABS,DATA)
      000000                        136 	.org 0x0000
                           000080   137 _P0	=	0x0080
                           000081   138 _SP	=	0x0081
                           000082   139 _DPL	=	0x0082
                           000083   140 _DPH	=	0x0083
                           000087   141 _PCON	=	0x0087
                           000088   142 _TCON	=	0x0088
                           000089   143 _TMOD	=	0x0089
                           00008A   144 _TL0	=	0x008a
                           00008B   145 _TL1	=	0x008b
                           00008C   146 _TH0	=	0x008c
                           00008D   147 _TH1	=	0x008d
                           000090   148 _P1	=	0x0090
                           000098   149 _SCON	=	0x0098
                           000099   150 _SBUF	=	0x0099
                           0000A0   151 _P2	=	0x00a0
                           0000A8   152 _IE	=	0x00a8
                           0000B0   153 _P3	=	0x00b0
                           0000B8   154 _IP	=	0x00b8
                           0000D0   155 _PSW	=	0x00d0
                           0000E0   156 _ACC	=	0x00e0
                           0000F0   157 _B	=	0x00f0
                                    158 ;--------------------------------------------------------
                                    159 ; special function bits
                                    160 ;--------------------------------------------------------
                                    161 	.area RSEG    (ABS,DATA)
      000000                        162 	.org 0x0000
                           000080   163 _P0_0	=	0x0080
                           000081   164 _P0_1	=	0x0081
                           000082   165 _P0_2	=	0x0082
                           000083   166 _P0_3	=	0x0083
                           000084   167 _P0_4	=	0x0084
                           000085   168 _P0_5	=	0x0085
                           000086   169 _P0_6	=	0x0086
                           000087   170 _P0_7	=	0x0087
                           000088   171 _IT0	=	0x0088
                           000089   172 _IE0	=	0x0089
                           00008A   173 _IT1	=	0x008a
                           00008B   174 _IE1	=	0x008b
                           00008C   175 _TR0	=	0x008c
                           00008D   176 _TF0	=	0x008d
                           00008E   177 _TR1	=	0x008e
                           00008F   178 _TF1	=	0x008f
                           000090   179 _P1_0	=	0x0090
                           000091   180 _P1_1	=	0x0091
                           000092   181 _P1_2	=	0x0092
                           000093   182 _P1_3	=	0x0093
                           000094   183 _P1_4	=	0x0094
                           000095   184 _P1_5	=	0x0095
                           000096   185 _P1_6	=	0x0096
                           000097   186 _P1_7	=	0x0097
                           000098   187 _RI	=	0x0098
                           000099   188 _TI	=	0x0099
                           00009A   189 _RB8	=	0x009a
                           00009B   190 _TB8	=	0x009b
                           00009C   191 _REN	=	0x009c
                           00009D   192 _SM2	=	0x009d
                           00009E   193 _SM1	=	0x009e
                           00009F   194 _SM0	=	0x009f
                           0000A0   195 _P2_0	=	0x00a0
                           0000A1   196 _P2_1	=	0x00a1
                           0000A2   197 _P2_2	=	0x00a2
                           0000A3   198 _P2_3	=	0x00a3
                           0000A4   199 _P2_4	=	0x00a4
                           0000A5   200 _P2_5	=	0x00a5
                           0000A6   201 _P2_6	=	0x00a6
                           0000A7   202 _P2_7	=	0x00a7
                           0000A8   203 _EX0	=	0x00a8
                           0000A9   204 _ET0	=	0x00a9
                           0000AA   205 _EX1	=	0x00aa
                           0000AB   206 _ET1	=	0x00ab
                           0000AC   207 _ES	=	0x00ac
                           0000AF   208 _EA	=	0x00af
                           0000B0   209 _P3_0	=	0x00b0
                           0000B1   210 _P3_1	=	0x00b1
                           0000B2   211 _P3_2	=	0x00b2
                           0000B3   212 _P3_3	=	0x00b3
                           0000B4   213 _P3_4	=	0x00b4
                           0000B5   214 _P3_5	=	0x00b5
                           0000B6   215 _P3_6	=	0x00b6
                           0000B7   216 _P3_7	=	0x00b7
                           0000B0   217 _RXD	=	0x00b0
                           0000B1   218 _TXD	=	0x00b1
                           0000B2   219 _INT0	=	0x00b2
                           0000B3   220 _INT1	=	0x00b3
                           0000B4   221 _T0	=	0x00b4
                           0000B5   222 _T1	=	0x00b5
                           0000B6   223 _WR	=	0x00b6
                           0000B7   224 _RD	=	0x00b7
                           0000B8   225 _PX0	=	0x00b8
                           0000B9   226 _PT0	=	0x00b9
                           0000BA   227 _PX1	=	0x00ba
                           0000BB   228 _PT1	=	0x00bb
                           0000BC   229 _PS	=	0x00bc
                           0000D0   230 _P	=	0x00d0
                           0000D1   231 _F1	=	0x00d1
                           0000D2   232 _OV	=	0x00d2
                           0000D3   233 _RS0	=	0x00d3
                           0000D4   234 _RS1	=	0x00d4
                           0000D5   235 _F0	=	0x00d5
                           0000D6   236 _AC	=	0x00d6
                           0000D7   237 _CY	=	0x00d7
                                    238 ;--------------------------------------------------------
                                    239 ; overlayable register banks
                                    240 ;--------------------------------------------------------
                                    241 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        242 	.ds 8
                                    243 ;--------------------------------------------------------
                                    244 ; internal ram data
                                    245 ;--------------------------------------------------------
                                    246 	.area DSEG    (DATA)
                           000020   247 _mutex	=	0x0020
                           000021   248 _empty	=	0x0021
                           000022   249 _lot_a	=	0x0022
                           000023   250 _lot_b	=	0x0023
                           000024   251 _car_num	=	0x0024
                           000025   252 _thread_car	=	0x0025
                           000029   253 _ID	=	0x0029
                           000030   254 _savedSP	=	0x0030
                           000034   255 _bitmap	=	0x0034
                           000035   256 _cur_threadID	=	0x0035
                           000036   257 _temp	=	0x0036
                           000037   258 _new_threadID	=	0x0037
                           000038   259 _count	=	0x0038
                           000039   260 _time_unit	=	0x0039
                           00003A   261 _time_limit	=	0x003a
                           00003E   262 _threadnum	=	0x003e
                                    263 ;--------------------------------------------------------
                                    264 ; overlayable items in internal ram 
                                    265 ;--------------------------------------------------------
                                    266 ;--------------------------------------------------------
                                    267 ; Stack segment in internal ram 
                                    268 ;--------------------------------------------------------
                                    269 	.area	SSEG
      000008                        270 __start__stack:
      000008                        271 	.ds	1
                                    272 
                                    273 ;--------------------------------------------------------
                                    274 ; indirectly addressable internal ram data
                                    275 ;--------------------------------------------------------
                                    276 	.area ISEG    (DATA)
                                    277 ;--------------------------------------------------------
                                    278 ; absolute internal ram data
                                    279 ;--------------------------------------------------------
                                    280 	.area IABS    (ABS,DATA)
                                    281 	.area IABS    (ABS,DATA)
                                    282 ;--------------------------------------------------------
                                    283 ; bit data
                                    284 ;--------------------------------------------------------
                                    285 	.area BSEG    (BIT)
                                    286 ;--------------------------------------------------------
                                    287 ; paged external ram data
                                    288 ;--------------------------------------------------------
                                    289 	.area PSEG    (PAG,XDATA)
                                    290 ;--------------------------------------------------------
                                    291 ; external ram data
                                    292 ;--------------------------------------------------------
                                    293 	.area XSEG    (XDATA)
                                    294 ;--------------------------------------------------------
                                    295 ; absolute external ram data
                                    296 ;--------------------------------------------------------
                                    297 	.area XABS    (ABS,XDATA)
                                    298 ;--------------------------------------------------------
                                    299 ; external initialized ram data
                                    300 ;--------------------------------------------------------
                                    301 	.area XISEG   (XDATA)
                                    302 	.area HOME    (CODE)
                                    303 	.area GSINIT0 (CODE)
                                    304 	.area GSINIT1 (CODE)
                                    305 	.area GSINIT2 (CODE)
                                    306 	.area GSINIT3 (CODE)
                                    307 	.area GSINIT4 (CODE)
                                    308 	.area GSINIT5 (CODE)
                                    309 	.area GSINIT  (CODE)
                                    310 	.area GSFINAL (CODE)
                                    311 	.area CSEG    (CODE)
                                    312 ;--------------------------------------------------------
                                    313 ; interrupt vector 
                                    314 ;--------------------------------------------------------
                                    315 	.area HOME    (CODE)
      000000                        316 __interrupt_vect:
      000000 02 01 7A         [24]  317 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  318 	reti
      000004                        319 	.ds	7
      00000B 02 01 81         [24]  320 	ljmp	_timer0_ISR
                                    321 ;--------------------------------------------------------
                                    322 ; global & static initialisations
                                    323 ;--------------------------------------------------------
                                    324 	.area HOME    (CODE)
                                    325 	.area GSINIT  (CODE)
                                    326 	.area GSFINAL (CODE)
                                    327 	.area GSINIT  (CODE)
                                    328 	.globl __sdcc_gsinit_startup
                                    329 	.globl __sdcc_program_startup
                                    330 	.globl __start__stack
                                    331 	.globl __mcs51_genXINIT
                                    332 	.globl __mcs51_genXRAMCLEAR
                                    333 	.globl __mcs51_genRAMCLEAR
                                    334 	.area GSFINAL (CODE)
      000011 02 00 0E         [24]  335 	ljmp	__sdcc_program_startup
                                    336 ;--------------------------------------------------------
                                    337 ; Home
                                    338 ;--------------------------------------------------------
                                    339 	.area HOME    (CODE)
                                    340 	.area HOME    (CODE)
      00000E                        341 __sdcc_program_startup:
      00000E 02 01 2E         [24]  342 	ljmp	_main
                                    343 ;	return from main will return to caller
                                    344 ;--------------------------------------------------------
                                    345 ; code
                                    346 ;--------------------------------------------------------
                                    347 	.area CSEG    (CODE)
                                    348 ;------------------------------------------------------------
                                    349 ;Allocation info for local variables in function 'Producer'
                                    350 ;------------------------------------------------------------
                                    351 ;	testparking.c:16: void Producer(void) {
                                    352 ;	-----------------------------------------
                                    353 ;	 function Producer
                                    354 ;	-----------------------------------------
      000014                        355 _Producer:
                           000007   356 	ar7 = 0x07
                           000006   357 	ar6 = 0x06
                           000005   358 	ar5 = 0x05
                           000004   359 	ar4 = 0x04
                           000003   360 	ar3 = 0x03
                           000002   361 	ar2 = 0x02
                           000001   362 	ar1 = 0x01
                           000000   363 	ar0 = 0x00
                                    364 ;	testparking.c:18: SemaphoreWait(empty, L(__COUNTER__) ); // wait if no empty lot
      000014                        365 		0$:
      000014 E5 21            [12]  366 	MOV A, _empty 
      000016 60 FC            [24]  367 	JZ 0$ 
      000018 20 E7 F9         [24]  368 	JB ACC.7, 0$ 
      00001B 15 21            [12]  369 	DEC _empty 
                                    370 ;	testparking.c:19: EA = 0;
                                    371 ;	assignBit
      00001D C2 AF            [12]  372 	clr	_EA
                                    373 ;	testparking.c:21: if( lot_a == '0' ){ 
      00001F 74 30            [12]  374 	mov	a,#0x30
      000021 B5 22 36         [24]  375 	cjne	a,_lot_a,00128$
                                    376 ;	testparking.c:22: lot_a = thread_car[cur_threadID];
      000024 E5 35            [12]  377 	mov	a,_cur_threadID
      000026 24 25            [12]  378 	add	a,#_thread_car
      000028 F9               [12]  379 	mov	r1,a
      000029 87 22            [24]  380 	mov	_lot_a,@r1
                                    381 ;	testparking.c:23: output(thread_car[cur_threadID],'>','a');
      00002B 43 89 20         [24]  382 	orl	_TMOD,#0x20
      00002E 75 8D FA         [24]  383 	mov	_TH1,#0xfa
      000031 75 98 50         [24]  384 	mov	_SCON,#0x50
                                    385 ;	assignBit
      000034 D2 8E            [12]  386 	setb	_TR1
      000036 E5 35            [12]  387 	mov	a,_cur_threadID
      000038 24 25            [12]  388 	add	a,#_thread_car
      00003A F9               [12]  389 	mov	r1,a
      00003B 87 99            [24]  390 	mov	_SBUF,@r1
      00003D                        391 00101$:
                                    392 ;	assignBit
      00003D 10 99 02         [24]  393 	jbc	_TI,00318$
      000040 80 FB            [24]  394 	sjmp	00101$
      000042                        395 00318$:
      000042 75 99 3E         [24]  396 	mov	_SBUF,#0x3e
      000045                        397 00104$:
                                    398 ;	assignBit
      000045 10 99 02         [24]  399 	jbc	_TI,00319$
      000048 80 FB            [24]  400 	sjmp	00104$
      00004A                        401 00319$:
      00004A 75 99 61         [24]  402 	mov	_SBUF,#0x61
      00004D                        403 00107$:
                                    404 ;	assignBit
      00004D 10 99 02         [24]  405 	jbc	_TI,00320$
      000050 80 FB            [24]  406 	sjmp	00107$
      000052                        407 00320$:
      000052 75 99 0A         [24]  408 	mov	_SBUF,#0x0a
      000055                        409 00110$:
                                    410 ;	assignBit
      000055 10 99 3D         [24]  411 	jbc	_TI,00129$
      000058 80 FB            [24]  412 	sjmp	00110$
      00005A                        413 00128$:
                                    414 ;	testparking.c:24: }else if( lot_b == '0' ){
      00005A 74 30            [12]  415 	mov	a,#0x30
      00005C B5 23 36         [24]  416 	cjne	a,_lot_b,00129$
                                    417 ;	testparking.c:25: lot_b = thread_car[cur_threadID];
      00005F E5 35            [12]  418 	mov	a,_cur_threadID
      000061 24 25            [12]  419 	add	a,#_thread_car
      000063 F9               [12]  420 	mov	r1,a
      000064 87 23            [24]  421 	mov	_lot_b,@r1
                                    422 ;	testparking.c:26: output(thread_car[cur_threadID],'>','b');
      000066 43 89 20         [24]  423 	orl	_TMOD,#0x20
      000069 75 8D FA         [24]  424 	mov	_TH1,#0xfa
      00006C 75 98 50         [24]  425 	mov	_SCON,#0x50
                                    426 ;	assignBit
      00006F D2 8E            [12]  427 	setb	_TR1
      000071 E5 35            [12]  428 	mov	a,_cur_threadID
      000073 24 25            [12]  429 	add	a,#_thread_car
      000075 F9               [12]  430 	mov	r1,a
      000076 87 99            [24]  431 	mov	_SBUF,@r1
      000078                        432 00113$:
                                    433 ;	assignBit
      000078 10 99 02         [24]  434 	jbc	_TI,00324$
      00007B 80 FB            [24]  435 	sjmp	00113$
      00007D                        436 00324$:
      00007D 75 99 3E         [24]  437 	mov	_SBUF,#0x3e
      000080                        438 00116$:
                                    439 ;	assignBit
      000080 10 99 02         [24]  440 	jbc	_TI,00325$
      000083 80 FB            [24]  441 	sjmp	00116$
      000085                        442 00325$:
      000085 75 99 62         [24]  443 	mov	_SBUF,#0x62
      000088                        444 00119$:
                                    445 ;	assignBit
      000088 10 99 02         [24]  446 	jbc	_TI,00326$
      00008B 80 FB            [24]  447 	sjmp	00119$
      00008D                        448 00326$:
      00008D 75 99 0A         [24]  449 	mov	_SBUF,#0x0a
      000090                        450 00122$:
                                    451 ;	assignBit
      000090 10 99 02         [24]  452 	jbc	_TI,00327$
      000093 80 FB            [24]  453 	sjmp	00122$
      000095                        454 00327$:
      000095                        455 00129$:
                                    456 ;	testparking.c:28: EA = 1;
                                    457 ;	assignBit
      000095 D2 AF            [12]  458 	setb	_EA
                                    459 ;	testparking.c:30: delay(2); // delay for  2 time_units
      000097 E5 35            [12]  460 	mov	a,_cur_threadID
      000099 24 3A            [12]  461 	add	a,#_time_limit
      00009B F9               [12]  462 	mov	r1,a
      00009C AF 39            [24]  463 	mov	r7,_time_unit
      00009E 74 02            [12]  464 	mov	a,#0x02
      0000A0 2F               [12]  465 	add	a,r7
      0000A1 F7               [12]  466 	mov	@r1,a
      0000A2                        467 00130$:
      0000A2 E5 35            [12]  468 	mov	a,_cur_threadID
      0000A4 24 3A            [12]  469 	add	a,#_time_limit
      0000A6 F9               [12]  470 	mov	r1,a
      0000A7 E7               [12]  471 	mov	a,@r1
      0000A8 B5 39 F7         [24]  472 	cjne	a,_time_unit,00130$
                                    473 ;	testparking.c:32: EA = 0;
                                    474 ;	assignBit
      0000AB C2 AF            [12]  475 	clr	_EA
                                    476 ;	testparking.c:34: if( lot_a == thread_car[cur_threadID] ){
      0000AD E5 35            [12]  477 	mov	a,_cur_threadID
      0000AF 24 25            [12]  478 	add	a,#_thread_car
      0000B1 F9               [12]  479 	mov	r1,a
      0000B2 E7               [12]  480 	mov	a,@r1
      0000B3 FF               [12]  481 	mov	r7,a
      0000B4 B5 22 32         [24]  482 	cjne	a,_lot_a,00160$
                                    483 ;	testparking.c:35: lot_a = '0';
      0000B7 75 22 30         [24]  484 	mov	_lot_a,#0x30
                                    485 ;	testparking.c:36: output(thread_car[cur_threadID],'<','a');
      0000BA 43 89 20         [24]  486 	orl	_TMOD,#0x20
      0000BD 75 8D FA         [24]  487 	mov	_TH1,#0xfa
      0000C0 75 98 50         [24]  488 	mov	_SCON,#0x50
                                    489 ;	assignBit
      0000C3 D2 8E            [12]  490 	setb	_TR1
      0000C5 E5 35            [12]  491 	mov	a,_cur_threadID
      0000C7 24 25            [12]  492 	add	a,#_thread_car
      0000C9 F9               [12]  493 	mov	r1,a
      0000CA 87 99            [24]  494 	mov	_SBUF,@r1
      0000CC                        495 00133$:
                                    496 ;	assignBit
      0000CC 10 99 02         [24]  497 	jbc	_TI,00332$
      0000CF 80 FB            [24]  498 	sjmp	00133$
      0000D1                        499 00332$:
      0000D1 75 99 3C         [24]  500 	mov	_SBUF,#0x3c
      0000D4                        501 00136$:
                                    502 ;	assignBit
      0000D4 10 99 02         [24]  503 	jbc	_TI,00333$
      0000D7 80 FB            [24]  504 	sjmp	00136$
      0000D9                        505 00333$:
      0000D9 75 99 61         [24]  506 	mov	_SBUF,#0x61
      0000DC                        507 00139$:
                                    508 ;	assignBit
      0000DC 10 99 02         [24]  509 	jbc	_TI,00334$
      0000DF 80 FB            [24]  510 	sjmp	00139$
      0000E1                        511 00334$:
      0000E1 75 99 0A         [24]  512 	mov	_SBUF,#0x0a
      0000E4                        513 00142$:
                                    514 ;	assignBit
      0000E4 10 99 3E         [24]  515 	jbc	_TI,00161$
      0000E7 80 FB            [24]  516 	sjmp	00142$
      0000E9                        517 00160$:
                                    518 ;	testparking.c:37: }else if( lot_b == thread_car[cur_threadID] ){ 
      0000E9 E5 35            [12]  519 	mov	a,_cur_threadID
      0000EB 24 25            [12]  520 	add	a,#_thread_car
      0000ED F9               [12]  521 	mov	r1,a
      0000EE E7               [12]  522 	mov	a,@r1
      0000EF FF               [12]  523 	mov	r7,a
      0000F0 B5 23 32         [24]  524 	cjne	a,_lot_b,00161$
                                    525 ;	testparking.c:38: lot_b = '0';
      0000F3 75 23 30         [24]  526 	mov	_lot_b,#0x30
                                    527 ;	testparking.c:39: output(thread_car[cur_threadID],'<','b');
      0000F6 43 89 20         [24]  528 	orl	_TMOD,#0x20
      0000F9 75 8D FA         [24]  529 	mov	_TH1,#0xfa
      0000FC 75 98 50         [24]  530 	mov	_SCON,#0x50
                                    531 ;	assignBit
      0000FF D2 8E            [12]  532 	setb	_TR1
      000101 E5 35            [12]  533 	mov	a,_cur_threadID
      000103 24 25            [12]  534 	add	a,#_thread_car
      000105 F9               [12]  535 	mov	r1,a
      000106 87 99            [24]  536 	mov	_SBUF,@r1
      000108                        537 00145$:
                                    538 ;	assignBit
      000108 10 99 02         [24]  539 	jbc	_TI,00338$
      00010B 80 FB            [24]  540 	sjmp	00145$
      00010D                        541 00338$:
      00010D 75 99 3C         [24]  542 	mov	_SBUF,#0x3c
      000110                        543 00148$:
                                    544 ;	assignBit
      000110 10 99 02         [24]  545 	jbc	_TI,00339$
      000113 80 FB            [24]  546 	sjmp	00148$
      000115                        547 00339$:
      000115 75 99 62         [24]  548 	mov	_SBUF,#0x62
      000118                        549 00151$:
                                    550 ;	assignBit
      000118 10 99 02         [24]  551 	jbc	_TI,00340$
      00011B 80 FB            [24]  552 	sjmp	00151$
      00011D                        553 00340$:
      00011D 75 99 0A         [24]  554 	mov	_SBUF,#0x0a
      000120                        555 00154$:
                                    556 ;	assignBit
      000120 10 99 02         [24]  557 	jbc	_TI,00341$
      000123 80 FB            [24]  558 	sjmp	00154$
      000125                        559 00341$:
      000125                        560 00161$:
                                    561 ;	testparking.c:41: EA = 1;
                                    562 ;	assignBit
      000125 D2 AF            [12]  563 	setb	_EA
                                    564 ;	testparking.c:42: SemaphoreSignal(empty); //let one more car get in a lot 
      000127 05 21            [12]  565 	INC _empty 
                                    566 ;	testparking.c:43: SemaphoreSignal(threadnum); //let one more thread be created 
      000129 05 3E            [12]  567 	INC _threadnum 
                                    568 ;	testparking.c:44: ThreadExit();
                                    569 ;	testparking.c:46: } 
      00012B 02 03 51         [24]  570 	ljmp	_ThreadExit
                                    571 ;------------------------------------------------------------
                                    572 ;Allocation info for local variables in function 'main'
                                    573 ;------------------------------------------------------------
                                    574 ;	testparking.c:48: void main(void) {
                                    575 ;	-----------------------------------------
                                    576 ;	 function main
                                    577 ;	-----------------------------------------
      00012E                        578 _main:
                                    579 ;	testparking.c:49: SemaphoreCreate(mutex, 1); // mutex lock
      00012E 75 20 01         [24]  580 	mov	_mutex,#0x01
                                    581 ;	testparking.c:50: SemaphoreCreate(empty,2); // 2 empty parking lots at the beginning 
      000131 75 21 02         [24]  582 	mov	_empty,#0x02
                                    583 ;	testparking.c:51: SemaphoreCreate(threadnum, 3); // maximum limit of 4 threads and one is occupied by main()
      000134 75 3E 03         [24]  584 	mov	_threadnum,#0x03
                                    585 ;	testparking.c:53: lot_a = '0'; // '0' means empty lots
      000137 75 22 30         [24]  586 	mov	_lot_a,#0x30
                                    587 ;	testparking.c:54: lot_b = '0';
      00013A 75 23 30         [24]  588 	mov	_lot_b,#0x30
                                    589 ;	testparking.c:55: car_num = '1'; 
      00013D 75 24 31         [24]  590 	mov	_car_num,#0x31
                                    591 ;	testparking.c:57: while(time_unit < 030){ // use 030=24(decimal) time_units to test the Thread_exit function
      000140                        592 00101$:
      000140 74 E8            [12]  593 	mov	a,#0x100 - 0x18
      000142 25 39            [12]  594 	add	a,_time_unit
      000144 40 31            [24]  595 	jc	00103$
                                    596 ;	testparking.c:58: SemaphoreWait(threadnum, L(__COUNTER__) ); //wait if 3 thread is running
      000146                        597 		1$:
      000146 E5 3E            [12]  598 	MOV A, _threadnum 
      000148 60 FC            [24]  599 	JZ 1$ 
      00014A 20 E7 F9         [24]  600 	JB ACC.7, 1$ 
      00014D 15 3E            [12]  601 	DEC _threadnum 
                                    602 ;	testparking.c:59: ID = ThreadCreate( Producer ); 
      00014F 90 00 14         [24]  603 	mov	dptr,#_Producer
      000152 12 01 AB         [24]  604 	lcall	_ThreadCreate
      000155 85 82 29         [24]  605 	mov	_ID,dpl
                                    606 ;	testparking.c:60: thread_car[ ID ] = car_num; // record which car is in which thread
      000158 E5 29            [12]  607 	mov	a,_ID
      00015A 24 25            [12]  608 	add	a,#_thread_car
      00015C F8               [12]  609 	mov	r0,a
      00015D A6 24            [24]  610 	mov	@r0,_car_num
                                    611 ;	testparking.c:61: car_num = (car_num == '5') ? '1' : car_num+1; // car number from 1 to 5
      00015F 74 35            [12]  612 	mov	a,#0x35
      000161 B5 24 06         [24]  613 	cjne	a,_car_num,00106$
      000164 7E 31            [12]  614 	mov	r6,#0x31
      000166 7F 00            [12]  615 	mov	r7,#0x00
      000168 80 09            [24]  616 	sjmp	00107$
      00016A                        617 00106$:
      00016A AD 24            [24]  618 	mov	r5,_car_num
      00016C 0D               [12]  619 	inc	r5
      00016D ED               [12]  620 	mov	a,r5
      00016E FE               [12]  621 	mov	r6,a
      00016F 33               [12]  622 	rlc	a
      000170 95 E0            [12]  623 	subb	a,acc
      000172 FF               [12]  624 	mov	r7,a
      000173                        625 00107$:
      000173 8E 24            [24]  626 	mov	_car_num,r6
      000175 80 C9            [24]  627 	sjmp	00101$
      000177                        628 00103$:
                                    629 ;	testparking.c:63: ThreadExit();
                                    630 ;	testparking.c:64: }
      000177 02 03 51         [24]  631 	ljmp	_ThreadExit
                                    632 ;------------------------------------------------------------
                                    633 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    634 ;------------------------------------------------------------
                                    635 ;	testparking.c:66: void _sdcc_gsinit_startup(void) {
                                    636 ;	-----------------------------------------
                                    637 ;	 function _sdcc_gsinit_startup
                                    638 ;	-----------------------------------------
      00017A                        639 __sdcc_gsinit_startup:
                                    640 ;	testparking.c:69: __endasm;
      00017A 02 01 85         [24]  641 	ljmp	_Bootstrap
                                    642 ;	testparking.c:70: }
      00017D 22               [24]  643 	ret
                                    644 ;------------------------------------------------------------
                                    645 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    646 ;------------------------------------------------------------
                                    647 ;	testparking.c:72: void _mcs51_genRAMCLEAR(void) {}
                                    648 ;	-----------------------------------------
                                    649 ;	 function _mcs51_genRAMCLEAR
                                    650 ;	-----------------------------------------
      00017E                        651 __mcs51_genRAMCLEAR:
      00017E 22               [24]  652 	ret
                                    653 ;------------------------------------------------------------
                                    654 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    655 ;------------------------------------------------------------
                                    656 ;	testparking.c:73: void _mcs51_genXINIT(void) {}
                                    657 ;	-----------------------------------------
                                    658 ;	 function _mcs51_genXINIT
                                    659 ;	-----------------------------------------
      00017F                        660 __mcs51_genXINIT:
      00017F 22               [24]  661 	ret
                                    662 ;------------------------------------------------------------
                                    663 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    664 ;------------------------------------------------------------
                                    665 ;	testparking.c:74: void _mcs51_genXRAMCLEAR(void) {}
                                    666 ;	-----------------------------------------
                                    667 ;	 function _mcs51_genXRAMCLEAR
                                    668 ;	-----------------------------------------
      000180                        669 __mcs51_genXRAMCLEAR:
      000180 22               [24]  670 	ret
                                    671 ;------------------------------------------------------------
                                    672 ;Allocation info for local variables in function 'timer0_ISR'
                                    673 ;------------------------------------------------------------
                                    674 ;	testparking.c:75: void timer0_ISR(void) __interrupt(1) {
                                    675 ;	-----------------------------------------
                                    676 ;	 function timer0_ISR
                                    677 ;	-----------------------------------------
      000181                        678 _timer0_ISR:
                                    679 ;	testparking.c:78: __endasm;
      000181 02 02 7F         [24]  680 	ljmp	_myTimer0Handler
                                    681 ;	testparking.c:79: }
      000184 32               [24]  682 	reti
                                    683 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    684 ;	eliminated unneeded push/pop psw
                                    685 ;	eliminated unneeded push/pop dpl
                                    686 ;	eliminated unneeded push/pop dph
                                    687 ;	eliminated unneeded push/pop b
                                    688 ;	eliminated unneeded push/pop acc
                                    689 	.area CSEG    (CODE)
                                    690 	.area CONST   (CODE)
                                    691 	.area XINIT   (CODE)
                                    692 	.area CABS    (ABS,CODE)
