section .data
    MAX_ROUNDS   equ 10
    BOMB_SLOTS   equ 5
    MAX_TARGET   equ 10

    msg_round    db "ROUND: ", 0
    msg_score    db "SCORE: ", 0
    msg_targets  db "TARGETS:", 0x09, 0
    msg_hit      db "BOOM! Acertou!", 0xA, 0
    msg_miss     db "ERROU!", 0xA, 0
    input_prompt db "Pressione uma tecla (1-5): ", 0
    star         db "*", 0
    newline      db 0xA, 0
    msg_hero     db "VOCÊ É UM HERÓI! ", 0xA, 0
    msg_fail     db "VOCÊ FALHOU!", 0xA, 0
    separator    db "===============================", 0xA, 0

    score         dd 0
    current_round dd MAX_ROUNDS

section .bss
    bomb_targets resd BOMB_SLOTS
    input_key    resb 2
    num_buffer   resb 4

section .text
    global _start

_start:
    call init_game

.game_loop:
    call show_game_state
    call generate_targets
    call print_stars

    ; Prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, input_prompt
    mov edx, 30
    int 0x80

    call check_input
    call validate_hit

    dec dword [current_round]
    jnz .game_loop

    call show_final_score
    call exit_game

init_game:
    mov dword [score], 0
    mov dword [current_round], MAX_ROUNDS
    ret

generate_targets:
    pusha
    mov ecx, BOMB_SLOTS
    mov edi, bomb_targets

.loop:
    rdtsc
    xor edx, edx
    mov ebx, MAX_TARGET
    div ebx
    add edx, 1
    mov [edi], edx
    add edi, 4
    loop .loop
    popa
    ret

print_stars:
    pusha
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_targets
    mov edx, 9
    int 0x80

    ; Imprime newline antes da primeira linha (alinha com as outras)
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov esi, bomb_targets
    mov ecx, 1

.print_loop:
    push ecx
    mov eax, ecx
    add al, '0'
    mov [input_key], al
    mov eax, 4
    mov ebx, 1
    mov ecx, input_key
    mov edx, 1
    int 0x80

    mov byte [input_key], ':'
    mov eax, 4
    mov ecx, input_key
    mov edx, 1
    int 0x80

    mov byte [input_key], ' '
    mov eax, 4
    mov ecx, input_key
    mov edx, 1
    int 0x80

    mov edi, [esi]
.star_loop:
    cmp edi, 0
    jle .end_star_loop
    mov eax, 4
    mov ebx, 1
    mov ecx, star
    mov edx, 1
    int 0x80
    dec edi
    jmp .star_loop

.end_star_loop:
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    add esi, 4
    pop ecx
    inc ecx
    cmp ecx, BOMB_SLOTS + 1
    jl .print_loop

    popa
    ret

check_input:
    mov eax, 3
    mov ebx, 0
    mov ecx, input_key
    mov edx, 2
    int 0x80

    cmp byte [input_key], '1'
    jb .invalid
    cmp byte [input_key], '5'
    ja .invalid

    sub byte [input_key], '0'
    movzx eax, byte [input_key]
    mov [input_key], eax
    ret

.invalid:
    mov byte [input_key], 0
    ret

validate_hit:
    mov ecx, BOMB_SLOTS
    mov esi, bomb_targets
    mov eax, [esi]
    mov edi, 1
    mov ebx, 2
    add esi, 4

.find_max:
    mov edx, [esi]
    cmp edx, eax
    jl .next
    ; maior ou igual → atualiza (prioriza menor índice)
    mov eax, edx
    mov edi, ebx

.next:
    inc ebx
    add esi, 4
    loop .find_max

    movzx eax, byte [input_key]
    cmp eax, edi
    je .hit

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_miss
    mov edx, 7
    int 0x80
    ret

.hit:
    add dword [score], 1
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_hit
    mov edx, 15
    int 0x80
    ret

show_game_state:
    pusha

    ; --- Separador inicial ---
    mov eax, 4
    mov ebx, 1
    mov ecx, separator
    mov edx, 32
    int 0x80

    ; ROUND
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_round
    mov edx, 7
    int 0x80

    mov eax, [current_round]
    call print_number

    ; SCORE
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_score
    mov edx, 7
    int 0x80

    mov eax, [score]
    call print_number

    ; --- Separador final ---
    mov eax, 4
    mov ebx, 1
    mov ecx, separator
    mov edx, 32
    int 0x80

    popa
    ret

show_final_score:
    pusha
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_score
    mov edx, 7
    int 0x80

    mov eax, [score]
    call print_number

    mov eax, [score]
    cmp eax, 8
    jl .fail

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_hero
    mov edx, 19
    int 0x80
    jmp .done

.fail:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_fail
    mov edx, 15
    int 0x80

.done:
    ; Quebra a linha antes do separador
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    
    ; separador final
    mov eax, 4
    mov ebx, 1
    mov ecx, separator
    mov edx, 32
    int 0x80

    popa
    ret

print_number:
    ; Imprime número em EAX (até 99) com padding zero + newline
    pusha
    mov ecx, num_buffer
    mov ebx, 10
    xor edx, edx
    div ebx
    add al, '0'
    mov [ecx], al
    add dl, '0'
    mov [ecx+1], dl
    mov byte [ecx+2], 0xA
    mov eax, 4
    mov ebx, 1
    mov ecx, num_buffer
    mov edx, 3
    int 0x80
    popa
    ret

exit_game:
    mov eax, 1
    xor ebx, ebx
    int 0x80
