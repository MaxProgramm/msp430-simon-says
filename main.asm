    .cdecls C,LIST,"msp430.h"
    .include lib.include

_main   init
        jmp reset


; =========================================================
; start, setzten von start werten
; =========================================================
start
    mov.b   #1, &520
    mov.b   #2, &521
    mov.b   #4, &522
    mov.b   #8, &523
    mov.b   #2, &524
    mov.b   #1, &525
    mov.b   #8, &526
    mov.b   #4, &527
    mov.b   #1, &528
    mov.b   #2, &529
    ret


; ========================================================= 
; reset
; =========================================================
reset
    call    #start ;call dass wir mit ret hierher zurückspringen
    mov     #520, r12
    mov     #520, r13
    mov.b   #0, &33
    jmp     game_loop


; =========================================================
; loop
; =========================================================
game_loop
    call    #show_leds 
    call    #check_btn_order
    jmp     game_loop


; =========================================================
; leds zeigen für entsprechendes level
; =========================================================
show_leds
    mov     r12, r14

show_leds_loop
    mov.b   0(r14), r10
    and.b   #00001111b, r10      
    mov.b   r10, &33
    sleep
    mov.b   #0, &33
    sleep

    cmp     r13, r14
    jeq     show_leds_done
    inc     r14
    jmp     show_leds_loop

show_leds_done
    ret


; =========================================================
; check btn order
; =========================================================
check_btn_order
    mov     r12, r14

check_loop
    call    #get_button_stable

    cmp.b   r11, 0(r14)
    jne     lose

    call    #ok_flash_led

    cmp     r13, r14
    jeq     level_up

    inc     r14
    jmp     check_loop


; =========================================================
; Verloren und reset
; =========================================================
lose
    call    #anim_fail_all 
    jmp     reset


; =========================================================
; Level erhöhen und bei höher als 10 reset
; =========================================================
level_up
    call    #anim_success_all
    inc     r13
    cmp     #530, r13             
    jeq     reset
    ret


; =========================================================
; Feedback funktion auf led8 bei richtigem press
; =========================================================
ok_flash_led
    mov.b   #10000000b, &33
    sleep       
    mov.b   #00000000b, &33
    ret


; =========================================================
;liest buttons und wartet kurz bis stabiles ergebnis, dann in register r11
; =========================================================
get_button_stable
wait_press
    mov.b   &40, r11
    and.b   #00001111b, r11
    cmp.b   #00001111b, r11          
    jeq     wait_press

    sleep
    mov.b   &40, r10
    and.b   #00001111b, r10
    cmp.b   r11, r10
    jne     wait_press               

    xor.b   #00001111b, r11

    cmp.b   #1, r11
    jeq     ok_btn
    cmp.b   #2, r11
    jeq     ok_btn
    cmp.b   #4, r11
    jeq     ok_btn
    cmp.b   #8, r11
    jeq     ok_btn

    jmp     wait_press         

ok_btn
wait_release
    mov.b   &40, r10
    and.b   #00001111b, r10
    cmp.b   #00001111b, r10
    jne     wait_release

    sleep
    ret


; =========================================================
; Success animation (1x flash)
; =========================================================
anim_success_all
    mov     #2, r6
as_loop
    mov.b   #0FFh, &33
    sleep
    mov.b   #00h, &33
    sleep
    dec     r6
    jnz     as_loop
    ret


; =========================================================
; Fail animation (flash und 1x lauflicht)
; =========================================================
anim_fail_all
    mov.b   #0FFh, &33
    call    #_sleep
    mov.b   #00h, &33
    call    #_sleep 

    mov.b   #00000001b, &33
    sleep
    mov.b   #00000010b, &33
    sleep
    mov.b   #00000100b, &33
    sleep
    mov.b   #00001000b, &33
    sleep
    mov.b   #00010000b, &33
    sleep
    mov.b   #00100000b, &33
    sleep
    mov.b   #01000000b, &33
    sleep
    mov.b   #10000000b, &33
    sleep
    mov.b   #00000000b, &33
    ret

    .include vectors.include
