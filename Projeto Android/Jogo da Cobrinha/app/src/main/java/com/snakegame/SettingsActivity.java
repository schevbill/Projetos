package com.snakegame;

import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.Switch;

import androidx.appcompat.app.AppCompatActivity;

import com.snakegame.game.GameEngine;
import com.snakegame.game.SnakeGameView;
import com.snakegame.utils.PreferencesManager;

/**
 * Tela de configurações: dificuldade, tema, som, vibração, bordas.
 */
public class SettingsActivity extends AppCompatActivity {

    private PreferencesManager prefs;

    private Spinner spinnerDifficulty;
    private Spinner spinnerTheme;
    private Switch switchSound;
    private Switch switchMusic;
    private Switch switchVibration;
    private Switch switchWrapAround;

    private static final String[] DIFFICULTY_LABELS = {"Fácil", "Médio", "Difícil", "Insano"};
    private static final GameEngine.Difficulty[] DIFFICULTIES = {
            GameEngine.Difficulty.EASY,
            GameEngine.Difficulty.MEDIUM,
            GameEngine.Difficulty.HARD,
            GameEngine.Difficulty.INSANE
    };

    private static final String[] THEME_LABELS = {"Clássico (Verde)", "Neon (Ciano)", "Retrô (Amarelo)"};
    private static final SnakeGameView.Theme[] THEMES = {
            SnakeGameView.Theme.CLASSIC,
            SnakeGameView.Theme.NEON,
            SnakeGameView.Theme.RETRO
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_settings);

        prefs = new PreferencesManager(this);

        spinnerDifficulty = findViewById(R.id.spinnerDifficulty);
        spinnerTheme      = findViewById(R.id.spinnerTheme);
        switchSound       = findViewById(R.id.switchSound);
        switchMusic       = findViewById(R.id.switchMusic);
        switchVibration   = findViewById(R.id.switchVibration);
        switchWrapAround  = findViewById(R.id.switchWrapAround);
        Button btnSave    = findViewById(R.id.btnSaveSettings);
        Button btnBack    = findViewById(R.id.btnBackSettings);

        // Popula spinners
        ArrayAdapter<String> diffAdapter = new ArrayAdapter<>(this,
                android.R.layout.simple_spinner_item, DIFFICULTY_LABELS);
        diffAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerDifficulty.setAdapter(diffAdapter);

        ArrayAdapter<String> themeAdapter = new ArrayAdapter<>(this,
                android.R.layout.simple_spinner_item, THEME_LABELS);
        themeAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerTheme.setAdapter(themeAdapter);

        // Carrega valores salvos
        loadCurrentSettings();

        btnSave.setOnClickListener(v -> {
            saveSettings();
            finish();
        });

        btnBack.setOnClickListener(v -> finish());
    }

    private void loadCurrentSettings() {
        // Dificuldade
        GameEngine.Difficulty currentDiff = prefs.getDifficulty();
        for (int i = 0; i < DIFFICULTIES.length; i++) {
            if (DIFFICULTIES[i] == currentDiff) {
                spinnerDifficulty.setSelection(i);
                break;
            }
        }

        // Tema
        SnakeGameView.Theme currentTheme = prefs.getTheme();
        for (int i = 0; i < THEMES.length; i++) {
            if (THEMES[i] == currentTheme) {
                spinnerTheme.setSelection(i);
                break;
            }
        }

        switchSound.setChecked(prefs.isSoundEnabled());
        switchMusic.setChecked(prefs.isMusicEnabled());
        switchVibration.setChecked(prefs.isVibrationEnabled());
        switchWrapAround.setChecked(prefs.isWrapAround());
    }

    private void saveSettings() {
        prefs.setDifficulty(DIFFICULTIES[spinnerDifficulty.getSelectedItemPosition()]);
        prefs.setTheme(THEMES[spinnerTheme.getSelectedItemPosition()]);
        prefs.setSoundEnabled(switchSound.isChecked());
        prefs.setMusicEnabled(switchMusic.isChecked());
        prefs.setVibrationEnabled(switchVibration.isChecked());
        prefs.setWrapAround(switchWrapAround.isChecked());
    }
}
