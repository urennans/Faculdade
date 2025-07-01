section .data
    ; Constantes do jogo
    MAX_ROUNDS equ 10
    BOMB_SLOTS equ 5

    ; Mensagens formatadas com tamanhos calculados
    msg_round    db "ROUND: ", 0
    msg_round_len equ $ - msg_round - 1
    
    msg_score    db "SCORE: ", 0
    msg_score_len equ $ - msg_score - 1
    
    msg_bombs    db "TARGETS: [ ", 0
    msg_bombs_len equ $ - msg_bombs - 1
    
    msg_end      db " ]", 0xA, 0
    msg_end_len  equ $ - msg_end - 1
    
    space        db " ", 0
    newline      db 0xA, 0

    ; Variáveis do jogo
    score        dd 0
    current_round dd MAX_ROUNDS

section .bss
    bomb_targets resd BOMB_SLOTS  ; Array de alvos (5 elementos)
    ascii_buffer resb 12          ; Buffer para conversão numérica

section .text
    global _start

_start:
    call init_game

.game_loop:
    call show_game_status
    call generate_targets
    
    ; (Lógica de input será implementada aqui)
    
    dec dword [current_round]
    jnz .game_loop

    call show_final_score
    call exit_game

; ========== SUB-ROTINAS ==========

init_game:
    mov dword [score], 0
    mov dword [current_round], MAX_ROUNDS
    ret

show_game_status:
    pusha
    
    ; 1. Mostra ROUND
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_round
    mov edx, msg_round_len
    int 0x80

    mov eax, [current_round]
    call int_to_ascii
    mov ecx, eax
    mov edx, 2
    int 0x80

    call print_newline

    ; 2. Mostra SCORE
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_score
    mov edx, msg_score_len
    int 0x80

    mov eax, [score]
    call int_to_ascii
    mov ecx, eax
    mov edx, 2
    int 0x80

    call print_newline

    ; 3. Mostra TARGETS
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_bombs
    mov edx, msg_bombs_len
    int 0x80

    ; Exibe cada alvo
    mov esi, bomb_targets
    mov ecx, BOMB_SLOTS
.print_loop:
    mov eax, [esi]
    call int_to_ascii
    push ecx
    mov ecx, eax
    mov edx, 2
    mov eax, 4
    int 0x80

    ; Espaço entre números
    mov ecx, space
    mov edx, 1
    int 0x80

    add esi, 4
    pop ecx
    loop .print_loop

    ; Fecha colchetes
    mov ecx, msg_end
    mov edx, msg_end_len
    int 0x80

    popa
    ret

; Converte número em EAX para string ASCII (2 dígitos)
int_to_ascii:
    pusha
    mov ebx, 10
    xor ecx, ecx
    mov edi, ascii_buffer + 11  ; Preenche do final
    
.convert_loop:
    xor edx, edx
    div ebx
    add dl, '0'
    dec edi
    mov [edi], dl
    inc ecx
    test eax, eax
    jnz .convert_loop

    ; Preenche com zeros à esquerda
    mov al, '0'
.pad_loop:
    cmp ecx, 2
    jge .done
    dec edi
    mov [edi], al
    inc ecx
    jmp .pad_loop
    
.done:
    popa
    mov eax, edi
    ret

; Gera alvos aleatórios
generate_targets:
    pusha
    mov ecx, BOMB_SLOTS
    mov edi, bomb_targets

.loop:
    ; Syscall time() para semente
    mov eax, 13
    xor ebx, ebx
    int 0x80

    ; Fórmula aleatória simples
    xor edx, edx
    mov ebx, 100
    div ebx            ; EDX = 0-99
    mov [edi], edx

    add edi, 4
    loop .loop
    popa
    ret

print_newline:
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    ret

show_final_score:
    ; (Implementar depois)
    ret

exit_game:
    mov eax, 1
    xor ebx, ebx
    int 0x80