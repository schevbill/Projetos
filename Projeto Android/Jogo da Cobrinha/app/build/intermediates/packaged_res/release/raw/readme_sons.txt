INSTRUÇÕES PARA ADICIONAR SONS
==============================

Para habilitar os efeitos sonoros e a música do jogo, adicione os seguintes
arquivos nesta pasta (res/raw/):

  eat.mp3         — Som ao comer a comida (ex: "ding" curto)
  game_over.mp3   — Som ao perder o jogo (ex: "buzz" ou melodia triste)
  click.mp3       — Som de clique nos botões
  background_music.mp3 — Música de fundo em loop (estilo chiptune/retro)

FONTES GRATUITAS DE SONS:
  - https://freesound.org  (Licença Creative Commons)
  - https://opengameart.org
  - https://pixabay.com/music/

O jogo funciona normalmente SEM os arquivos de som — os erros são tratados
silenciosamente em SoundManager.java.

Para gerar sons simples com Python (requer numpy + scipy):
  python generate_sounds.py
