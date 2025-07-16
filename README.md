SuperSonic Bomber
SuperSonic Bomber é um mini game desenvolvido em Assembly como projeto acadêmico da faculdade, onde o objetivo é acertar o alvo com maior densidade (representado pelo maior número de estrelas **) entre 5 opções, pressionando a tecla correta (1-5) dentro do tempo limite. O jogo possui 10 rodadas e a pontuação máxima é 10 acertos.

Como jogar
Ao iniciar, o jogador verá 5 opções numeradas (1 a 5).

Seu objetivo é identificar qual opção tem maior número de estrelas **.

Pressione a tecla correspondente (1 a 5) dentro do tempo estipulado para acertar.

São 10 rodadas no total.

A pontuação máxima é 10 acertos.

Tecnologias usadas
Assembly (linguagem principal do projeto)

Ambiente Linux para desenvolvimento e testes

Contribuições
O projeto foi desenvolvido em equipe, com contribuições importantes para lógica, testes e ajustes.

# Compile o código (ajuste conforme seu ambiente)
nasm -f elf32 game.asm -o game.o
ld -m elf_i386 game.o -o game

# Rode o jogo
./supersonic_bomber
