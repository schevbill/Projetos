"""
Gera arquivos de som simples para o Snake Game usando Python.
Requer: pip install numpy scipy
"""
import struct
import math
import wave
import os

RAW_DIR = "app/src/main/res/raw"
os.makedirs(RAW_DIR, exist_ok=True)

SAMPLE_RATE = 44100


def generate_wav(filename, samples):
    """Salva lista de samples (-1.0 a 1.0) como WAV mono 16-bit."""
    path = os.path.join(RAW_DIR, filename)
    with wave.open(path, 'w') as f:
        f.setnchannels(1)
        f.setsampwidth(2)
        f.setframerate(SAMPLE_RATE)
        data = b"".join(struct.pack('<h', max(-32768, min(32767, int(s * 32767)))) for s in samples)
        f.writeframes(data)
    print(f"Criado: {path}")


def tone(freq, duration, volume=0.5, fade=0.01):
    """Gera um tom senoidal com fade in/out."""
    n = int(SAMPLE_RATE * duration)
    fade_n = int(SAMPLE_RATE * fade)
    samples = []
    for i in range(n):
        t = i / SAMPLE_RATE
        s = volume * math.sin(2 * math.pi * freq * t)
        # Fade in
        if i < fade_n:
            s *= i / fade_n
        # Fade out
        if i > n - fade_n:
            s *= (n - i) / fade_n
        samples.append(s)
    return samples


def silence(duration):
    return [0.0] * int(SAMPLE_RATE * duration)


# Som ao comer (dois bipes rápidos crescentes)
eat = tone(440, 0.05, 0.4) + silence(0.02) + tone(880, 0.07, 0.5)
generate_wav("eat.wav", eat)

# Som de game over (sequência descendente)
game_over = (
    tone(440, 0.12, 0.5) + silence(0.04) +
    tone(330, 0.12, 0.5) + silence(0.04) +
    tone(220, 0.25, 0.6)
)
generate_wav("game_over.wav", game_over)

# Clique (bipe muito curto)
click = tone(1200, 0.03, 0.3)
generate_wav("click.wav", click)

# Música de fundo (melodia chiptune simples em loop)
notes = [
    (523, 0.2), (587, 0.2), (659, 0.2), (698, 0.2),
    (784, 0.4), (698, 0.2), (659, 0.2),
    (587, 0.4), (523, 0.4),
    (392, 0.2), (440, 0.2), (494, 0.2), (523, 0.2),
    (587, 0.4), (523, 0.2), (494, 0.2),
    (440, 0.4), (392, 0.4),
]
melody = []
for freq, dur in notes * 2:
    melody += tone(freq, dur * 0.85, 0.35) + silence(dur * 0.15)
generate_wav("background_music.wav", melody)

print("\nSons gerados com sucesso! Converta os .wav para .mp3 para menor tamanho.")
print("Ou renomeie para .mp3 — o MediaPlayer aceita .wav também.")
print("\nDica: renomeie os arquivos .wav para .mp3 no Android (funciona para testes).")
