
_main:

;MyProject.c,8 :: 		void main() {
;MyProject.c,9 :: 		ADCON1 = 0x07;
	MOVLW      7
	MOVWF      ADCON1+0
;MyProject.c,10 :: 		trisb = 0b00000000;
	CLRF       TRISB+0
;MyProject.c,11 :: 		trisc = 0b00000000;
	CLRF       TRISC+0
;MyProject.c,12 :: 		trisd = 0b00000000;
	CLRF       TRISD+0
;MyProject.c,13 :: 		trisa = 0b11111111;
	MOVLW      255
	MOVWF      TRISA+0
;MyProject.c,14 :: 		for(;;){
L_main0:
;MyProject.c,15 :: 		if (porta.b1 == 1)
	BTFSS      PORTA+0, 1
	GOTO       L_main3
;MyProject.c,17 :: 		Automatic();
	CALL       _Automatic+0
;MyProject.c,18 :: 		}
	GOTO       L_main4
L_main3:
;MyProject.c,21 :: 		Manual();
	CALL       _Manual+0
;MyProject.c,22 :: 		}
L_main4:
;MyProject.c,23 :: 		}
	GOTO       L_main0
;MyProject.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_Automatic:

;MyProject.c,26 :: 		void Automatic()
;MyProject.c,28 :: 		portd = 0b11111111;
	MOVLW      255
	MOVWF      PORTD+0
;MyProject.c,29 :: 		for (i = 3; i >= 0; i--)
	MOVLW      3
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_Automatic5:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Automatic37
	MOVLW      0
	SUBWF      _i+0, 0
L__Automatic37:
	BTFSS      STATUS+0, 0
	GOTO       L_Automatic6
;MyProject.c,31 :: 		for (count = 9; count >= 0; count--)
	MOVLW      9
	MOVWF      _count+0
	MOVLW      0
	MOVWF      _count+1
L_Automatic8:
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Automatic38
	MOVLW      0
	SUBWF      _count+0, 0
L__Automatic38:
	BTFSS      STATUS+0, 0
	GOTO       L_Automatic9
;MyProject.c,33 :: 		if (porta.b1 == 0)
	BTFSC      PORTA+0, 1
	GOTO       L_Automatic11
;MyProject.c,35 :: 		portb = 0;
	CLRF       PORTB+0
;MyProject.c,36 :: 		count2 = 3;
	MOVLW      3
	MOVWF      _count2+0
	MOVLW      0
	MOVWF      _count2+1
;MyProject.c,37 :: 		count3 = 3;
	MOVLW      3
	MOVWF      _count3+0
	MOVLW      0
	MOVWF      _count3+1
;MyProject.c,38 :: 		break;
	GOTO       L_Automatic9
;MyProject.c,39 :: 		}
L_Automatic11:
;MyProject.c,40 :: 		if ( (arr[i] + count) == 57 || (arr[i] + count) == 56)
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       _count+0, 0
	ADDWF      INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _count+1, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Automatic39
	MOVLW      57
	XORWF      R1+0, 0
L__Automatic39:
	BTFSC      STATUS+0, 2
	GOTO       L__Automatic34
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       _count+0, 0
	ADDWF      INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _count+1, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Automatic40
	MOVLW      56
	XORWF      R1+0, 0
L__Automatic40:
	BTFSC      STATUS+0, 2
	GOTO       L__Automatic34
	GOTO       L_Automatic14
L__Automatic34:
;MyProject.c,42 :: 		continue;
	GOTO       L_Automatic10
;MyProject.c,43 :: 		}
L_Automatic14:
;MyProject.c,44 :: 		if ((arr[i] + count) > 53)
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       _count+0, 0
	ADDWF      INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _count+1, 0
	MOVWF      R1+1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Automatic41
	MOVF       R1+0, 0
	SUBLW      53
L__Automatic41:
	BTFSC      STATUS+0, 0
	GOTO       L_Automatic15
;MyProject.c,46 :: 		portc = 0b00010001;
	MOVLW      17
	MOVWF      PORTC+0
;MyProject.c,47 :: 		}
	GOTO       L_Automatic16
L_Automatic15:
;MyProject.c,48 :: 		else if ((arr[i] + count) == 52)
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       _count+0, 0
	ADDWF      INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _count+1, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Automatic42
	MOVLW      52
	XORWF      R1+0, 0
L__Automatic42:
	BTFSS      STATUS+0, 2
	GOTO       L_Automatic17
;MyProject.c,50 :: 		portc = 0b00100001;
	MOVLW      33
	MOVWF      PORTC+0
;MyProject.c,51 :: 		}
	GOTO       L_Automatic18
L_Automatic17:
;MyProject.c,52 :: 		else if ((arr[i] + count) == 35)
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       _count+0, 0
	ADDWF      INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _count+1, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Automatic43
	MOVLW      35
	XORWF      R1+0, 0
L__Automatic43:
	BTFSS      STATUS+0, 2
	GOTO       L_Automatic19
;MyProject.c,54 :: 		portc = 0b00001010;
	MOVLW      10
	MOVWF      PORTC+0
;MyProject.c,55 :: 		}
	GOTO       L_Automatic20
L_Automatic19:
;MyProject.c,56 :: 		else if ((arr[i] + count) == 32)
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       _count+0, 0
	ADDWF      INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _count+1, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Automatic44
	MOVLW      32
	XORWF      R1+0, 0
L__Automatic44:
	BTFSS      STATUS+0, 2
	GOTO       L_Automatic21
;MyProject.c,58 :: 		portc = 0b00001100;
	MOVLW      12
	MOVWF      PORTC+0
;MyProject.c,59 :: 		}
L_Automatic21:
L_Automatic20:
L_Automatic18:
L_Automatic16:
;MyProject.c,60 :: 		portb = arr[i] + count;
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       _count+0, 0
	ADDWF      INDF+0, 0
	MOVWF      PORTB+0
;MyProject.c,61 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Automatic22:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic22
	DECFSZ     R12+0, 1
	GOTO       L_Automatic22
	DECFSZ     R11+0, 1
	GOTO       L_Automatic22
	NOP
	NOP
;MyProject.c,62 :: 		}
L_Automatic10:
;MyProject.c,31 :: 		for (count = 9; count >= 0; count--)
	MOVLW      1
	SUBWF      _count+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count+1, 1
;MyProject.c,62 :: 		}
	GOTO       L_Automatic8
L_Automatic9:
;MyProject.c,29 :: 		for (i = 3; i >= 0; i--)
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;MyProject.c,63 :: 		}
	GOTO       L_Automatic5
L_Automatic6:
;MyProject.c,64 :: 		}
L_end_Automatic:
	RETURN
; end of _Automatic

_Manual:

;MyProject.c,65 :: 		void Manual()
;MyProject.c,67 :: 		if (porta.b0 == 0)
	BTFSC      PORTA+0, 0
	GOTO       L_Manual23
;MyProject.c,69 :: 		portd = 0b00000011;
	MOVLW      3
	MOVWF      PORTD+0
;MyProject.c,70 :: 		for (count2; count2 >= 0; count2--)
L_Manual24:
	MOVLW      128
	XORWF      _count2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Manual46
	MOVLW      0
	SUBWF      _count2+0, 0
L__Manual46:
	BTFSS      STATUS+0, 0
	GOTO       L_Manual25
;MyProject.c,72 :: 		portc = 0b00001010;
	MOVLW      10
	MOVWF      PORTC+0
;MyProject.c,73 :: 		portb = count2;
	MOVF       _count2+0, 0
	MOVWF      PORTB+0
;MyProject.c,74 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Manual27:
	DECFSZ     R13+0, 1
	GOTO       L_Manual27
	DECFSZ     R12+0, 1
	GOTO       L_Manual27
	DECFSZ     R11+0, 1
	GOTO       L_Manual27
	NOP
	NOP
;MyProject.c,70 :: 		for (count2; count2 >= 0; count2--)
	MOVLW      1
	SUBWF      _count2+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count2+1, 1
;MyProject.c,75 :: 		}
	GOTO       L_Manual24
L_Manual25:
;MyProject.c,76 :: 		portc = 0b00001100;
	MOVLW      12
	MOVWF      PORTC+0
;MyProject.c,77 :: 		count3 = 3;
	MOVLW      3
	MOVWF      _count3+0
	MOVLW      0
	MOVWF      _count3+1
;MyProject.c,78 :: 		}
	GOTO       L_Manual28
L_Manual23:
;MyProject.c,79 :: 		else if (porta.b0 == 1)
	BTFSS      PORTA+0, 0
	GOTO       L_Manual29
;MyProject.c,81 :: 		portd = 0b00001100;
	MOVLW      12
	MOVWF      PORTD+0
;MyProject.c,82 :: 		for (count3; count3 >= 0; count3--)
L_Manual30:
	MOVLW      128
	XORWF      _count3+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Manual47
	MOVLW      0
	SUBWF      _count3+0, 0
L__Manual47:
	BTFSS      STATUS+0, 0
	GOTO       L_Manual31
;MyProject.c,84 :: 		portc = 0b00010001;
	MOVLW      17
	MOVWF      PORTC+0
;MyProject.c,85 :: 		portb = count3;
	MOVF       _count3+0, 0
	MOVWF      PORTB+0
;MyProject.c,86 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Manual33:
	DECFSZ     R13+0, 1
	GOTO       L_Manual33
	DECFSZ     R12+0, 1
	GOTO       L_Manual33
	DECFSZ     R11+0, 1
	GOTO       L_Manual33
	NOP
	NOP
;MyProject.c,82 :: 		for (count3; count3 >= 0; count3--)
	MOVLW      1
	SUBWF      _count3+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count3+1, 1
;MyProject.c,87 :: 		}
	GOTO       L_Manual30
L_Manual31:
;MyProject.c,88 :: 		portc = 0b00100001;
	MOVLW      33
	MOVWF      PORTC+0
;MyProject.c,89 :: 		count2 = 3;
	MOVLW      3
	MOVWF      _count2+0
	MOVLW      0
	MOVWF      _count2+1
;MyProject.c,90 :: 		}
L_Manual29:
L_Manual28:
;MyProject.c,91 :: 		}
L_end_Manual:
	RETURN
; end of _Manual
