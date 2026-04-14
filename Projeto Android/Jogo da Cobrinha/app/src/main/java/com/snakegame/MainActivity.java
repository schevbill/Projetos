package com.snakegame;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.ads.MobileAds;
import com.google.android.gms.ads.initialization.InitializationStatus;
import com.google.android.gms.ads.initialization.OnInitializationCompleteListener;
import com.snakegame.utils.PreferencesManager;
import com.snakegame.utils.SoundManager;

/**
 * Tela inicial do jogo com botões Jogar, Configurações e Recordes.
 */
public class MainActivity extends AppCompatActivity {

    private PreferencesManager prefs;
    private SoundManager soundManager;
    private TextView tvHighScore;
    private AdView mAdView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Inicializar AdMob
        MobileAds.initialize(this, new OnInitializationCompleteListener() {
            @Override
            public void onInitializationComplete(InitializationStatus initializationStatus) {
            }
        });

        // Mantém a tela sempre ligada
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);

        setContentView(R.layout.activity_main);

        // Configurar AdView
        mAdView = findViewById(R.id.adView);
        AdRequest adRequest = new AdRequest.Builder().build();
        mAdView.loadAd(adRequest);

        prefs = new PreferencesManager(this);
        soundManager = new SoundManager(this, prefs.isSoundEnabled(), prefs.isMusicEnabled());

        tvHighScore = findViewById(R.id.tvHighScore);

        // Botão Jogar
        findViewById(R.id.btnPlay).setOnClickListener(v -> {
            soundManager.playClick();
            startActivity(new Intent(this, GameActivity.class));
        });

        // Botão Configurações
        findViewById(R.id.btnSettings).setOnClickListener(v -> {
            soundManager.playClick();
            startActivity(new Intent(this, SettingsActivity.class));
        });
    }

    @Override
    protected void onResume() {
        super.onResume();
        // Atualiza recorde ao voltar das outras telas
        tvHighScore.setText(getString(R.string.high_score_label, prefs.getHighScore()));
        soundManager.startMusic();
    }

    @Override
    protected void onPause() {
        super.onPause();
        soundManager.pauseMusic();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        soundManager.release();
    }
}
