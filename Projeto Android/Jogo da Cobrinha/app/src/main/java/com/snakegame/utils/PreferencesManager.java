package com.snakegame.utils;

import android.content.Context;
import android.content.SharedPreferences;

import com.snakegame.game.GameEngine;
import com.snakegame.game.SnakeGameView;

/**
 * Gerencia todas as preferências persistentes do jogo usando SharedPreferences.
 */
public class PreferencesManager {

    private static final String PREFS_NAME = "SnakeGamePrefs";

    // Chaves
    private static final String KEY_HIGH_SCORE    = "high_score";
    private static final String KEY_DIFFICULTY     = "difficulty";
    private static final String KEY_THEME          = "theme";
    private static final String KEY_WRAP_AROUND    = "wrap_around";
    private static final String KEY_SOUND_ENABLED  = "sound_enabled";
    private static final String KEY_MUSIC_ENABLED  = "music_enabled";
    private static final String KEY_VIBRATION      = "vibration_enabled";
    private static final String KEY_SHOW_GRID      = "show_grid";
    private static final String KEY_ADS_REMOVED     = "ads_removed";

    private final SharedPreferences prefs;

    public PreferencesManager(Context context) {
        prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    // ── Pontuação máxima ────────────────────────────────────────
    public int getHighScore() {
        return prefs.getInt(KEY_HIGH_SCORE, 0);
    }

    public void saveHighScore(int score) {
        if (score > getHighScore()) {
            prefs.edit().putInt(KEY_HIGH_SCORE, score).apply();
        }
    }

    // ── Dificuldade ─────────────────────────────────────────────
    public GameEngine.Difficulty getDifficulty() {
        String name = prefs.getString(KEY_DIFFICULTY, GameEngine.Difficulty.MEDIUM.name());
        try {
            return GameEngine.Difficulty.valueOf(name);
        } catch (IllegalArgumentException e) {
            return GameEngine.Difficulty.MEDIUM;
        }
    }

    public void setDifficulty(GameEngine.Difficulty difficulty) {
        prefs.edit().putString(KEY_DIFFICULTY, difficulty.name()).apply();
    }

    // ── Tema ────────────────────────────────────────────────────
    public SnakeGameView.Theme getTheme() {
        String name = prefs.getString(KEY_THEME, SnakeGameView.Theme.CLASSIC.name());
        try {
            return SnakeGameView.Theme.valueOf(name);
        } catch (IllegalArgumentException e) {
            return SnakeGameView.Theme.CLASSIC;
        }
    }

    public void setTheme(SnakeGameView.Theme theme) {
        prefs.edit().putString(KEY_THEME, theme.name()).apply();
    }

    // ── Bordas atravessáveis ─────────────────────────────────────
    public boolean isWrapAround() {
        return prefs.getBoolean(KEY_WRAP_AROUND, false);
    }

    public void setWrapAround(boolean enabled) {
        prefs.edit().putBoolean(KEY_WRAP_AROUND, enabled).apply();
    }

    // ── Som ──────────────────────────────────────────────────────
    public boolean isSoundEnabled() {
        return prefs.getBoolean(KEY_SOUND_ENABLED, true);
    }

    public void setSoundEnabled(boolean enabled) {
        prefs.edit().putBoolean(KEY_SOUND_ENABLED, enabled).apply();
    }

    // ── Música ───────────────────────────────────────────────────
    public boolean isMusicEnabled() {
        return prefs.getBoolean(KEY_MUSIC_ENABLED, true);
    }

    public void setMusicEnabled(boolean enabled) {
        prefs.edit().putBoolean(KEY_MUSIC_ENABLED, enabled).apply();
    }

    // ── Vibração ─────────────────────────────────────────────────
    public boolean isVibrationEnabled() {
        return prefs.getBoolean(KEY_VIBRATION, true);
    }

    public void setVibrationEnabled(boolean enabled) {
        prefs.edit().putBoolean(KEY_VIBRATION, enabled).apply();
    }

    // ── Remoção de Anúncios ──────────────────────────────────────
    public boolean isAdsRemoved() {
        return prefs.getBoolean(KEY_ADS_REMOVED, false);
    }

    public void setAdsRemoved(boolean removed) {
        prefs.edit().putBoolean(KEY_ADS_REMOVED, removed).apply();
    }
}
