package com.snakegame.utils;

import android.media.AudioAttributes;
import android.media.AudioFormat;
import android.media.AudioManager;
import android.media.AudioTrack;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Gerencia efeitos sonoros gerados sinteticamente via AudioTrack.
 * Não requer nenhum arquivo de áudio externo — os sons são gerados em código.
 *
 * Para adicionar música de fundo real, basta adicionar um arquivo MP3 em
 * res/raw/background_music.mp3 e descomentar o bloco de MediaPlayer em GameActivity.
 */
public class SoundManager {

    private static final int SAMPLE_RATE = 44100;

    private final ExecutorService executor = Executors.newCachedThreadPool();
    private boolean soundEnabled;
    private boolean musicEnabled;

    public SoundManager(android.content.Context context, boolean soundEnabled, boolean musicEnabled) {
        this.soundEnabled = soundEnabled;
        this.musicEnabled = musicEnabled;
    }

    // ── Efeitos sonoros ─────────────────────────────────────────

    /** Dois bipes ascendentes — cobra comeu. */
    public void playEat() {
        if (!soundEnabled) return;
        executor.submit(() -> {
            playTone(880, 60, 0.35f);
            sleep(20);
            playTone(1320, 80, 0.4f);
        });
    }

    /** Sequência descendente triste — game over. */
    public void playGameOver() {
        if (!soundEnabled) return;
        executor.submit(() -> {
            playTone(523, 120, 0.5f);
            sleep(40);
            playTone(392, 120, 0.5f);
            sleep(40);
            playTone(261, 250, 0.6f);
        });
    }

    /** Bipe curto de clique. */
    public void playClick() {
        if (!soundEnabled) return;
        executor.submit(() -> playTone(1200, 35, 0.3f));
    }

    // ── Música de fundo (stub — sem arquivo externo) ─────────────

    /**
     * Para adicionar música real:
     * 1. Coloque background_music.mp3 em res/raw/
     * 2. Adicione dependência e inicialize MediaPlayer aqui.
     */
    public void startMusic() { /* Integrar MediaPlayer se desejar */ }
    public void pauseMusic() { }
    public void stopMusic()  { }

    // ── Controle ─────────────────────────────────────────────────

    public void setSoundEnabled(boolean enabled) { this.soundEnabled = enabled; }
    public void setMusicEnabled(boolean enabled) { this.musicEnabled = enabled; }

    /** Libera recursos. Chamar em onDestroy(). */
    public void release() {
        executor.shutdownNow();
    }

    // ── Síntese ──────────────────────────────────────────────────

    /**
     * Gera e reproduz um tom senoidal diretamente no AudioTrack.
     * @param freqHz  Frequência em Hz
     * @param durationMs Duração em milissegundos
     * @param amplitude  Amplitude 0.0–1.0
     */
    private void playTone(double freqHz, int durationMs, float amplitude) {
        int numSamples = (int) (SAMPLE_RATE * durationMs / 1000.0);
        int fadeLen    = Math.min(numSamples / 5, (int) (SAMPLE_RATE * 0.01)); // 10ms de fade

        short[] samples = new short[numSamples];
        for (int i = 0; i < numSamples; i++) {
            double sample = amplitude * Math.sin(2 * Math.PI * i * freqHz / SAMPLE_RATE);
            // Fade in
            if (i < fadeLen) sample *= (double) i / fadeLen;
            // Fade out
            if (i > numSamples - fadeLen) sample *= (double) (numSamples - i) / fadeLen;
            samples[i] = (short) (sample * 32767);
        }

        int minBufSize = AudioTrack.getMinBufferSize(
                SAMPLE_RATE,
                AudioFormat.CHANNEL_OUT_MONO,
                AudioFormat.ENCODING_PCM_16BIT);

        int bufSize = Math.max(minBufSize, numSamples * 2);

        try {
            AudioTrack track = new AudioTrack.Builder()
                    .setAudioAttributes(new AudioAttributes.Builder()
                            .setUsage(AudioAttributes.USAGE_GAME)
                            .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                            .build())
                    .setAudioFormat(new AudioFormat.Builder()
                            .setSampleRate(SAMPLE_RATE)
                            .setEncoding(AudioFormat.ENCODING_PCM_16BIT)
                            .setChannelMask(AudioFormat.CHANNEL_OUT_MONO)
                            .build())
                    .setBufferSizeInBytes(bufSize)
                    .setTransferMode(AudioTrack.MODE_STATIC)
                    .build();

            track.write(samples, 0, numSamples);
            track.play();

            // Aguarda a reprodução terminar antes de liberar
            Thread.sleep(durationMs + 5);
            track.stop();
            track.release();
        } catch (Exception ignored) {
            // Sons são opcionais — falha silenciosa
        }
    }

    private void sleep(long ms) {
        try { Thread.sleep(ms); } catch (InterruptedException ignored) {}
    }
}
