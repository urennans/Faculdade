section .data
    banner db 0xA
             db "  ___   _   _   ___   ___   ___   ___    ___    _  _   ___    ___     ___    ___    __  __   ___   ___   ___ ", 0xA
             db " / __| | | | | | _ \ | __| | _ \ / __|  / _ \  | \| | |_ _|  / __|   | _ )  / _ \  |  \/  | | _ ) | __| | _ \", 0xA
             db " \__ \ | |_| | |  _/ | _|  |   / \__ \ | (_) | | .` |  | |  | (__    | _ \ | (_) | | |\/| | | _ \ | _|  |   /", 0xA
             db " |___/  \___/  |_|   |___| |_|_\ |___/  \___/  |_|\_| |___|  \___|   |___/  \___/  |_|  |_| |___/ |___| |_|_\", 0xA
             db "                                                                                                             ", 0xA 0         




    MAX_ROUNDS   equ 10                  			; Número máximo de rodadas do jogo
    BOMB_SLOTS   equ 5                    			; Número de alvos por rodada
    MAX_TARGET   equ 10                   			; Valor máximo de um alvo gerado

    msg_round    db "ROUND: ", 0           			; Texto fixo para exibir a rodada
    msg_score    db "SCORE: ", 0           			; Texto fixo para exibir a pontuação
    msg_targets  db "TARGETS:", 0x09, 0    			; Mensagem para exibir os alvos
    msg_hit      db "BOOM! Acertou!", 0xA, 0  			; Mensagem quando o jogador acerta
    msg_miss     db "ERROU!", 0xA, 0           			; Mensagem quando o jogador erra
    input_prompt db "Pressione uma tecla (1-5): ", 0 		; Prompt de entrada
    star         db "*", 0                    			; Símbolo de estrela para desenhar os alvos
    newline      db 0xA, 0                    			; Quebra de linha
    msg_hero     db "VOCÊ É UM HERÓI! ", 0xA, 0 		; Mensagem final se pontuação >= 8
    msg_fail     db "VOCÊ FALHOU!", 0xA, 0     			; Mensagem final se pontuação < 8
    separator    db "===============================", 0xA, 0 	; Linha separadora visual

    score         dd 0                        			; Armazena a pontuação atual
    current_round dd MAX_ROUNDS              			; Armazena a rodada atual

section .bss
    bomb_targets resd BOMB_SLOTS             			; Array para guardar os valores dos alvos
    input_key    resb 2                      			; Buffer para ler a entrada do usuário
    num_buffer   resb 4                      			; Buffer para imprimir números

section .text
    global _start

_start:
    call init_game                          			; Inicializa pontuação e rodada
    call show_banner

.game_loop:
    call show_game_state                     			; Mostra o estado atual (round e score)
    call generate_targets                   			; Gera os alvos aleatórios
    call print_stars                         			; Mostra os alvos com estrelas

    ; Exibe prompt de entrada
    mov eax, 4
    mov ebx, 1
    mov ecx, input_prompt
    mov edx, 30
    int 0x80

    call check_input                        			; Lê e valida a entrada do usuário
    call validate_hit                        			; Verifica se a escolha foi correta

    dec dword [current_round]               			; Decrementa a rodada
    jnz .game_loop                           			; Continua se ainda houver rodadas

    call show_final_score                    			; Mostra a pontuação final
    call exit_game                           			; Encerra o programa

init_game:
    mov dword [score], 0                    			; Zera a pontuação
    mov dword [current_round], MAX_ROUNDS   			; Define o número inicial de rodadas
    ret

show_banner:
    mov eax, 4
    mov ebx, 1
    mov ecx, banner
    mov edx, 600     ; 5 linhas x ~100 caracteres
    int 0x80
    ret

generate_targets:
    pusha
    mov ecx, BOMB_SLOTS                      			; Define o número de alvos
    mov edi, bomb_targets                   			; Ponteiro para o início do array

.loop:
    rdtsc                                   			; Gera número "aleatório" - (Read Time-Stamp Counter)
    xor edx, edx
    mov ebx, MAX_TARGET                      			; Define o limite máximo
    div ebx                                 			; Divide EAX por MAX_TARGET
    add edx, 1                               			; Ajusta resultado para intervalo 1-10
    mov [edi], edx                          			; Salva alvo no array
    add edi, 4                              			; Avança ponteiro para próximo alvo
    loop .loop
    popa							; "Desempilha todos os registradores"
    ret

print_stars:
    pusha
    ; Exibe "TARGETS:"
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_targets
    mov edx, 9
    int 0x80

    ; Quebra de linha
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov esi, bomb_targets                   			; Ponteiro para o array de alvos
    mov ecx, 1                              			; Índice dos alvos começa em 1

.print_loop:
    push ecx
    mov eax, ecx
    add al, '0'                              			; Converte número para ASCII
    mov [input_key], al
    mov eax, 4
    mov ebx, 1
    mov ecx, input_key
    mov edx, 1
    int 0x80

    ; Exibe ":"
    mov byte [input_key], ':'
    mov eax, 4
    mov ecx, input_key
    mov edx, 1
    int 0x80

    ; Exibe espaço
    mov byte [input_key], ' '
    mov eax, 4
    mov ecx, input_key
    mov edx, 1
    int 0x80

    ; Imprime as estrelas
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

    add esi, 4                               			; Próximo alvo
    pop ecx
    inc ecx
    cmp ecx, BOMB_SLOTS + 1
    jl .print_loop

    popa
    ret

check_input:
    mov eax, 3                             			; syscall read
    mov ebx, 0                               			; STDIN
    mov ecx, input_key
    mov edx, 2
    int 0x80

    cmp byte [input_key], '1'
    jb .invalid                              			; Abaixo de '1'
    cmp byte [input_key], '5'
    ja .invalid                              			; Acima de '5'

    sub byte [input_key], '0'                			; Converte de ASCII para número
    movzx eax, byte [input_key]
    mov [input_key], eax
    ret

.invalid:
    mov byte [input_key], 0                  			; Marca entrada inválida
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
    jg .update                               			; Atualiza apenas se for maior
    jmp .next

.update:
    mov eax, edx
    mov edi, ebx

.next:
    inc ebx
    add esi, 4
    loop .find_max

    movzx eax, byte [input_key]              			; Entrada do jogador
    cmp eax, edi
    je .hit

    ; ERROU
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
    ; Exibe separador
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

    ; Final separador
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

    ; HERÓI
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
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, separator
    mov edx, 32
    int 0x80

    popa
    ret

print_number:
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
    ; Encerra o programa