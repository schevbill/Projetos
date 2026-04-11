# Snake Game — Como Abrir e Compilar

## Pré-requisitos
- **Android Studio** (versão Hedgehog ou mais recente)
- **JDK 17** ou superior
- **Android SDK** com API 34 instalado

## Passos

### 1. Abrir no Android Studio
1. Abra o Android Studio
2. Clique em **File → Open**
3. Navegue até esta pasta e clique em **OK**
4. Aguarde o Gradle sincronizar (pode demorar alguns minutos na primeira vez)

### 2. Compilar e executar
- Conecte um dispositivo Android via USB (ative "Depuração USB" nas configurações)
- Ou crie um **AVD** (emulador) em Tools → Device Manager
- Pressione **▶ Run** (Shift+F10)

### 3. Adicionar sons (opcional)
Execute o script Python para gerar sons simples:
```
pip install numpy scipy
python generate_sounds.py
```
Ou adicione arquivos `.mp3` manualmente em `app/src/main/res/raw/`:
- `eat.mp3`
- `game_over.mp3`
- `click.mp3`
- `background_music.mp3`

> O jogo funciona sem sons — os efeitos são gerados sinteticamente por padrão.

## Estrutura do Projeto

```
app/src/main/java/com/snakegame/
├── MainActivity.java        ← Tela inicial (Jogar / Configurações)
├── GameActivity.java        ← Tela do jogo (hospeda o SurfaceView)
├── GameOverActivity.java    ← Tela de Game Over
├── SettingsActivity.java    ← Configurações do jogo
├── game/
│   ├── Direction.java       ← Enum de direções (UP/DOWN/LEFT/RIGHT)
│   ├── Snake.java           ← Modelo da cobra (posição, movimento)
│   ├── Food.java            ← Modelo do alimento (tipos, pontuação)
│   ├── GameEngine.java      ← Lógica do jogo (tick, colisão, velocidade)
│   └── SnakeGameView.java   ← SurfaceView + Game Loop + renderização
└── utils/
    ├── PreferencesManager.java  ← SharedPreferences (recorde, config)
    └── SoundManager.java        ← Sons sintéticos via AudioTrack
```

## Funcionalidades

| Recurso | Detalhe |
|---|---|
| Controle | Swipe (gestos) + botões D-Pad na tela |
| Dificuldade | Fácil / Médio / Difícil / Insano |
| Temas | Clássico (verde) / Neon (ciano) / Retrô (amarelo) |
| Tipos de comida | Normal (10pts) / Bônus (30pts) / Super (50pts) |
| Bordas | Modo com paredes ou bordas atravessáveis |
| Pontuação | Salva recorde com SharedPreferences |
| Vibração | Ao colidir (configurável) |
| Sons | Gerados sinteticamente (sem arquivos externos) |
