section .data
    
    banner       db "                                                                                 ⠀⠀⠀⠀⣀", 0xA
                 db "                                                                                 ⠀⠀⠀⠀⢸⣿⣿⣶⣦⣄⠀⢀", 0xA
                 db "  ██████╗██╗   ██╗██████╗ ███████╗██████╗   ██████╗ ██████╗ ███╗   ██╗██╗ ██████╗⠀⠀⠀⠀⢈⣿⣿⣿⣿⣿⣿⣾⡄⠀⠀⠀⠀⣼⣿⣦⡀", 0xA
                 db " ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗ ██╔════╝██╔═══██╗████╗  ██║██║██╔════╝⠀⠀⠀⠀⠀⠙⢿⣿⣿⡟⠛⠛⠿⡄⠀⠀⢰⣿⣿⣿⣿⣆", 0xA
                 db " ███████╗██║   ██║██████╔╝█████╗  ██████╔╝ ███████╗██║   ██║██╔██╗ ██║██║██║⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠙⢿⣧⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿", 0xA
                 db " ╚════██║██║   ██║██╔═══╝ ██╔══╝  ██╔══██╗ ╚════██║██║   ██║██║╚██╗██║██║██║⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠉⠂⠀⢀⣴⣿⣿⣌⠛⠿⣿⣿⣿", 0xA
                 db " ██████╔╝╚██████╔╝██║     ███████╗██║  ██║ ██████╔╝╚██████╔╝██║ ╚████║██║╚██████╗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣼⠻⣿⣿⣿⣷⣤⡈⠻⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀", 0xA
                 db " ╚═════╝  ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═╝ ╚═════╝⠀⠀⠀⠀⠀⠀⢠⣴⣶⣿⣿⣿⣿⣦⡘⢿⣿⣿⣿⣿⣦⣄⢸⣦⣄⠀⠀⠀⠀⠀⠀⠀", 0xA
                 db "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣄⠙⣿⣿⣿⣿⣿⣿⠿⠛⠂⠀⠀⠀⠀ ", 0xA
                 db "           ██████╗  ██████╗ ███╗   ███╗██████╗ ███████╗██████╗                   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠿⠿⠿⠿⠛⠓⠈⠻⣿⡿⠋⠀⢴⠆⠉⠉⣀⠀⠀⠀⠀", 0xA
                 db "           ██╔══██╗██╔═══██╗████╗ ████║██╔══██╗██╔════╝██╔══██╗                  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⡿⠁⢼⠇⠀⠰⡷⠄⠉⢁⠀⠀⠀", 0xA
                 db "           ██████╔╝██║   ██║██╔████╔██║██████╔╝█████╗  ██████╔╝                  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⢰⡄⠀⠿⠂⣠⣶⣿⣿⣇⠀⠀", 0xA
                 db "           ██╔══██╗██║   ██║██║╚██╔╝██║██╔══██╗██╔══╝  ██╔══██╗                  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠲⠀⢰⣿⣿⣿⣿⣿⣆⠀⠀", 0xA
                 db "           ██████╔╝╚██████╔╝██║ ╚═╝ ██║██████╔╝███████╗██║  ██║                  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣿⣿⣿⡀⠀", 0xA
                 db "           ╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝                  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠃⠀⠀", 0xA
                 db "                                                                                                                                  ", 0xA 0  
    banner_len equ $ - banner

    MAX_ROUNDS   equ 10                      ; Número máximo de rodadas do jogo
    BOMB_SLOTS   equ 5                       ; Número de alvos por rodada
    MAX_TARGET   equ 10                      ; Valor máximo de um alvo gerado

    ; Mensagens do jogo
    msg_welcome  db "                        Escolha a dificuldade", 0xA
                 db "                   +------------------------------+", 0xA
                 db "                   |   1 - Fácil (8 segundos)     |", 0xA
                 db "                   |   2 - Médio (5 segundos)     |", 0xA
                 db "                   |   3 - Difícil (2 segundos)   |", 0xA
                 db "                   +------------------------------+", 0xA
                 db "                           Selecione: ", 0
    msg_welcome_len equ $ - msg_welcome
    
    msg_invalid db "Opção inválida! Digite 1, 2 ou 3.", 0xA, 0
    msg_invalid_len equ $ - msg_invalid
    
    msg_round    db "                               ROUND: ", 0             ; Texto fixo para exibir a rodada
    msg_round_len   equ $ - msg_round
    
    msg_score    db "                               SCORE: ", 0             ; Texto fixo para exibir a pontuação
    msg_score_len   equ $ - msg_score
    
    msg_targets  db "TARGETS:", 0x09, 0      ; Mensagem para exibir os alvos
    
    msg_hit      db "                          -ˋ✷ BOOM! ACERTOU! ✷ˎ-ˊ", 0xA, 0                ; Mensagem quando o jogador acerta
    msg_hit_len     equ $ - msg_hit
    
    msg_miss     db "                               ✖ ERROU! ✖", 0xA, 0                         ; Mensagem quando o jogador erra
    msg_miss_len    equ $ - msg_miss
    
    msg_timeout  db "                            ᶻ𝗓 TEMPO ESGOTADO! ᶻ𝗓", 0xA, 0                   ; Mensagem quando o tempo acaba
    msg_timeout_len equ $ - msg_timeout
    
    input_prompt db "Pressione uma tecla (1-5): ⊹ ", 0 ; Prompt de entrada
    star         db "*", 0                   ; Símbolo de estrela para desenhar os alvos
    newline      db 0xA, 0                   ; Quebra de linha
    
    msg_hero     db "                          ═══════ ⋆★⋆ ═══════", 0xA  
                 db "                            VOCÊ É UM HERÓI!", 0xA, 0 ; Mensagem final se pontuação >= 8
                 db "                            ═════ ⋆★⋆ ═════", 0xA
    msg_hero_len equ $ - msg_hero
    
    msg_fail     db "                          ═══════ ˙◠˙ ═══════", 0xA      
                 db "                              VOCÊ FALHOU!", 0xA, 0   ; Mensagem final se pontuação < 8
                 db "                            ═════ ˙◠˙ ═════", 0xA 
    msg_fail_len equ $ - msg_fail
    
    separator    db "========================================================================================", 0xA, 0  ; Linha separadora visual

    ; Dificuldades (em segundos)
    easy_time    equ 8
    medium_time  equ 5
    hard_time    equ 2

    ; Estrutura para timeval (usada no select)
    timeval:
        tv_sec  dd 0    ; Segundos
        tv_usec dd 0    ; Microsegundos

section .bss
    bomb_targets resd BOMB_SLOTS             ; Array para guardar os valores dos alvos
    input_key    resb 2                      ; Buffer para ler a entrada do usuário
    num_buffer   resb 4                      ; Buffer para imprimir números
    round_buffer resb 6                      ; Buffer para exibir rodada (ex: "01/10")
    score_buffer resb 4                      ; Buffer para exibir pontuação
    difficulty   resd 1                      ; Armazena a dificuldade selecionada
    time_left    resd 1                      ; Armazena o tempo restante
    score        resd 1                      ; Armazena a pontuação atual
    current_round resd 1                     ; Armazena a rodada atual (1-10)
    input_fdset  resb 8                      ; File descriptor set para select
    print_char   resb 2                      ; Usado apenas para imprimir caracteres simples com segurança


section .text
    global _start

_start:
    call show_banner
    call select_difficulty                   ; Permite ao jogador selecionar a dificuldade
    call init_game                           ; Inicializa pontuação e rodada

.game_loop:
    call show_game_state                     ; Mostra o estado atual (round e score)
    call generate_targets                    ; Gera os alvos aleatórios
    call print_stars                         ; Mostra os alvos com estrelas

    ; Exibe prompt de entrada
    mov eax, 4
    mov ebx, 1
    mov ecx, input_prompt
    mov edx, 34
    int 0x80

    call check_input_with_timeout            ; Lê e valida a entrada do usuário com timeout
    call validate_hit                        ; Verifica se a escolha foi correta

    ; Incrementa a rodada (agora contamos de 1 a 10)
    inc dword [current_round]
    mov eax, [current_round]
    cmp eax, MAX_ROUNDS
    jle .game_loop                           ; Continua se ainda houver rodadas

    call show_final_score                    ; Mostra a pontuação final
    call exit_game                           ; Encerra o programa

; Mostra o banner do jogo
show_banner:
    pusha
    mov eax, 4
    mov ebx, 1
    mov ecx, banner
    mov edx, banner_len
    int 0x80
    popa
    ret

; Seleciona a dificuldade do jogo
select_difficulty:
    pusha
.select_loop:
    ; Exibe mensagem de boas-vindas e opções
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_welcome
    mov edx, msg_welcome_len
    int 0x80

    ; Lê a seleção do usuário
    mov eax, 3
    mov ebx, 0
    mov ecx, input_key
    mov edx, 2
    int 0x80

    ; Verifica se a entrada é válida (1-3)
    cmp byte [input_key], '1'
    je .valid_input
    cmp byte [input_key], '2'
    je .valid_input
    cmp byte [input_key], '3'
    je .valid_input
    
    ; Quebra de linha
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Se entrada inválida, exibe mensagem e repete
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_invalid
    mov edx, msg_invalid_len
    int 0x80
    
    ; Quebra de linha
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    jmp .select_loop

.valid_input:
    ; Configura o tempo baseado na dificuldade
    cmp byte [input_key], '1'
    je .set_easy
    cmp byte [input_key], '2'
    je .set_medium
    cmp byte [input_key], '3'
    je .set_hard

.set_easy:
    mov dword [difficulty], easy_time
    jmp .done
.set_medium:
    mov dword [difficulty], medium_time
    jmp .done
.set_hard:
    mov dword [difficulty], hard_time
.done:
    popa
    ret

; Inicializa o jogo
init_game:
    mov dword [score], 0                     ; Zera a pontuação
    mov dword [current_round], 1             ; Começa na rodada 1

                                             ; Inicializa o fdset para o select
    mov dword [input_fdset], 1               ; Bit para STDIN (fd 0)
    mov dword [input_fdset+4], 0             ; Limpa a parte alta
    mov byte [input_key], 0                  ; Limpa o buffer de entrada
    ret

; Gera os alvos aleatórios
generate_targets:
    pusha
    mov ecx, BOMB_SLOTS                      ; Define o número de alvos
    mov edi, bomb_targets                    ; Ponteiro para o início do array

.loop:
    rdtsc                                    ; Gera número "aleatório" - (Read Time-Stamp Counter)
    xor edx, edx
    mov ebx, MAX_TARGET                      ; Define o limite máximo
    div ebx                                  ; Divide EAX por MAX_TARGET
    add edx, 1                               ; Ajusta resultado para intervalo 1-10
    mov [edi], edx                           ; Salva alvo no array
    add edi, 4                               ; Avança ponteiro para próximo alvo
    loop .loop
    popa
    ret

; Imprime os alvos como estrelas
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

    mov esi, bomb_targets                    ; Ponteiro para o array de alvos
    mov ecx, 1                               ; Índice dos alvos começa em 1

.print_loop:
    push ecx
    mov eax, ecx
    add al, '0'                              ; Converte número para ASCII
    mov [input_key], al
    mov eax, 4
    mov ebx, 1
    mov ecx, input_key
    mov edx, 1
    int 0x80

    ; Exibe ":"
    mov byte [print_char], ':'
    mov eax, 4
    mov ecx, print_char
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

    add esi, 4                               ; Próximo alvo
    pop ecx
    inc ecx
    cmp ecx, BOMB_SLOTS + 1
    jl .print_loop

    popa
    ret

; Verifica entrada do usuário com timeout
check_input_with_timeout:
    pusha
    
    ; Limpa o buffer de entrada antes de cada leitura
    mov byte [input_key], 0
    
    ; Configura o file descriptor set para STDIN (fd 0) - Modo 32-bit
    mov dword [input_fdset], 1  ; Bit para STDIN (fd 0)
    mov dword [input_fdset+4], 0 ; Limpa a parte alta
    
    ; Configura o timeval com o tempo da dificuldade selecionada
    mov eax, [difficulty]
    mov [timeval], eax         ; tv_sec
    mov dword [timeval+4], 0   ; tv_usec
    
    ; Configura e chama select
    mov eax, 142               ; syscall select
    mov ebx, 1                 ; nfds = max fd + 1
    mov ecx, input_fdset       ; readfds
    mov edx, 0                 ; writefds
    mov esi, 0                 ; exceptfds
    mov edi, timeval           ; timeout
    int 0x80
    
    ; Verifica resultado do select
    test eax, eax
    jz .timeout                ; Timeout se retorno = 0
    js .timeout                ; Erro se retorno < 0
    
    ; Se chegou aqui, há dados para ler
    mov eax, 3                 ; syscall read
    mov ebx, 0                 ; STDIN
    mov ecx, input_key
    mov edx, 2                 ; Ler até 2 bytes (tecla + enter)
    int 0x80
    
    ; Verifica se leu algo válido
    cmp eax, 1
    jl .timeout                ; Se não leu nada válido
    
    ; Verifica se a entrada é válida (1-5)
    cmp byte [input_key], '1'
    jb .invalid
    cmp byte [input_key], '5'
    ja .invalid
    
    ; Entrada válida - converte para número
    sub byte [input_key], '0'
    popa
    ret

.timeout:
    ; Não imprime nada aqui!
    mov byte [input_key], 0
    popa
    ret

.invalid:
    mov byte [input_key], 0    ; Marca entrada inválida
    popa
    ret

; Valida se o jogador acertou o alvo
validate_hit:
    pusha
    
    ; Primeiro verifica se houve timeout (input_key = 0)
    cmp byte [input_key], 0
    je .timeout
    
    ; Encontra o alvo com maior valor e seu índice
    mov ecx, BOMB_SLOTS              ; Número de alvos
    mov esi, bomb_targets            ; Ponteiro para os alvos
    mov eax, [esi]                   ; Maior valor encontrado (inicia com primeiro alvo)
    mov edi, 1                       ; Índice do maior valor (começa em 1)
    mov ebx, 1                       ; Contador de índice (1-based)
    
.find_max:
    mov edx, [esi]
    cmp edx, eax
    jle .next                        ; Se for menor ou igual, vai para próximo
    
    ; Atualiza maior valor e índice se encontrar valor maior
    mov eax, edx
    mov edi, ebx
    
.next:
    inc ebx
    add esi, 4
    loop .find_max
    
    ; Compara a entrada do usuário (1-5) com o índice do maior valor
    movzx eax, byte [input_key]      ; Carrega a escolha do usuário (1-5)
    
    ; Verifica se o índice escolhido é válido
    cmp eax, 1
    jl .miss
    cmp eax, BOMB_SLOTS
    jg .miss
    
    ; Compara com o índice do maior valor
    cmp eax, edi
    je .hit

.miss:
    ; Linha em branco
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Se errou
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_miss
    mov edx, msg_miss_len
    int 0x80
    jmp .done
    
.hit:
    ; Linha em branco
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Se acertou
    inc dword [score]                ; Incrementa pontuação
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_hit
    mov edx, 58
    int 0x80
    jmp .done
    
.timeout:
    ; Linha em branco
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Timeout já foi tratado em check_input_with_timeout
    ; Não incrementa score
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_timeout
    mov edx, msg_timeout_len
    int 0x80
    
.done:
    popa
    ret

; Mostra o estado atual do jogo (rodada e pontuação)
show_game_state:
    pusha
    
    ; Linha em branco antes da rodada
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    
    ; Exibe separador
    mov eax, 4
    mov ebx, 1
    mov ecx, separator
    mov edx, 89
    int 0x80

    ; ROUND: XX/10
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_round
    mov edx, msg_round_len
    int 0x80

    ; Formata o número da rodada (ex: "01/10")
    mov eax, [current_round]
    mov ebx, eax
    xor edx, edx
    mov ecx, 10
    div ecx
    add al, '0'
    add dl, '0'
    mov [round_buffer], al
    mov [round_buffer+1], dl
    mov byte [round_buffer+2], '/'
    mov byte [round_buffer+3], '1'
    mov byte [round_buffer+4], '0'
    mov byte [round_buffer+5], 0

    ; Exibe rodada formatada
    mov eax, 4
    mov ebx, 1
    mov ecx, round_buffer
    mov edx, 5
    int 0x80

    ; Quebra de linha
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; SCORE: XX
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_score
    mov edx, msg_score_len
    int 0x80

    mov eax, [score]
    call print_number

    ; Final separador
    mov eax, 4
    mov ebx, 1
    mov ecx, separator
    mov edx, 89
    int 0x80

    popa
    ret

; Mostra a pontuação final e mensagem
show_final_score:
    pusha
    ; Exibe separador duplo
    mov eax, 4
    mov ebx, 1
    mov ecx, separator
    mov edx, 89
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, separator
    mov edx, 89
    int 0x80

    ; Exibe "RESULTADO FINAL:"
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_score
    mov edx, msg_score_len
    int 0x80

    mov eax, [score]
    call print_number

    ; Quebra de linha
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exibe mensagem final baseada na pontuação
    mov eax, [score]
    cmp eax, 8
    jl .fail

    ; Se pontuação >= 8: HERÓI
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_hero
    mov edx, msg_hero_len
    int 0x80
    
    ; Quebra de linha
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    jmp .done

.fail:
    ; Se pontuação < 8: FALHOU
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_fail
    mov edx, msg_fail_len
    int 0x80

.done:
    ; Exibe separador duplo
    mov eax, 4
    mov ebx, 1
    mov ecx, separator
    mov edx, 89
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, separator
    mov edx, 89
    int 0x80

    popa
    ret

; Imprime um número de 2 dígitos
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
    mov byte [ecx+3], 0
    
    ; Se for número de 1 dígito, ajusta a exibição
    cmp al, '0'
    jne .print
    mov [ecx], dl
    mov byte [ecx+1], 0xA
    mov byte [ecx+2], 0
    mov edx, 2
    jmp .do_print

.print:
    mov edx, 3

.do_print:
    mov eax, 4
    mov ebx, 1
    mov ecx, num_buffer
    int 0x80
    
    popa
    ret

; Encerra o programa
exit_game:
    mov eax, 1
    xor ebx, ebx
    int 0x80