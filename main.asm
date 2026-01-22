; Systemvorbereitungen
    .cdecls C,LIST,"msp430.h"
	.include lib.include
_main	init
; Ende Systemvorbereitungen


; Beginn des Programms
start
	mov.b #2, &520
	mov.b #3, &521
	mov.b #1, &522
	mov.b #4, &523
	mov #0, &33
	mov #0, r12
end

reset
	mov #520, r12 ;//first level address
	mov #520, r13 ;//current level address
	;start_reg = 513 // müsste 512 sein
	;current_reg = 513
	jmp game_loop
 
game_loop
	jmp show_leds
 
 
show_leds
	mov r12, r14 ;//Adress 514 contains the address for the rounds inner level

loop_lights
	mov #0, &33
	mov.b 0(r14), &33
	sleep
	cmp r13, r14
	;sleep
	jn loop_lights_helper
	;// oben implementiert
	;while &514 = 513
	;
	;	&33 = 0(514)
	;	&514 + 1
	;
	jmp check_btn_order
 
 
check_btn_order:
	;button checken
	mov r12, r14
loop_buttons
	;//ckecks if the current inner round level (&514) is higher than the current general level (&513), if yes jump to level up
	cmp r14, r13
	jn level_up
	;//muss verbessert werden 
	;sleep
	;//checken ob die aktuell gedrückte taste, dem Wert aus dem aktuellen Level entspricht
	mov.b #15, r11
	sub.b &40, r11
	cmp.b r11, 0(r14)
	
	jz loop_buttons_helper
	;//if pressed button not equal to current level
	jmp reset
 
level_up
	inc r13
	jmp game_loop
 
 
 
	;wenn richtig
	;	&513 + 1
	;	jump game_loop
	;wenn falsch
	;	jump reset
 
loop_buttons_helper
	inc r14
	jmp loop_buttons

loop_lights_helper
	inc r14
	jmp loop_lights








; Ende des Programms

	.include vectors.include
