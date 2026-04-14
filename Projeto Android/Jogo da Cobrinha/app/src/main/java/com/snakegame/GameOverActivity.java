package com.snakegame;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.LoadAdError;
import com.google.android.gms.ads.interstitial.InterstitialAd;
import com.google.android.gms.ads.interstitial.InterstitialAdLoadCallback;

/**
 * Tela exibida ao fim do jogo com pontuação e opções de reiniciar ou sair.
 */
public class GameOverActivity extends AppCompatActivity {

    public static final String EXTRA_SCORE      = "score";
    public static final String EXTRA_HIGH_SCORE = "high_score";
    private InterstitialAd mInterstitialAd;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_game_over);

        loadInterstitialAd();

        int score     = getIntent().getIntExtra(EXTRA_SCORE, 0);
        int highScore = getIntent().getIntExtra(EXTRA_HIGH_SCORE, 0);

        TextView tvScore     = findViewById(R.id.tvGameOverScore);
        TextView tvHighScore = findViewById(R.id.tvGameOverHighScore);
        Button btnRestart    = findViewById(R.id.btnRestart);
        Button btnMainMenu   = findViewById(R.id.btnMainMenu);

        tvScore.setText(getString(R.string.your_score, score));
        tvHighScore.setText(getString(R.string.high_score_label, highScore));

        // Exibe "NOVO RECORDE!" se esta pontuação bateu o recorde
        TextView tvNewRecord = findViewById(R.id.tvNewRecord);
        if (score >= highScore && score > 0) {
            tvNewRecord.setVisibility(android.view.View.VISIBLE);
        }

        btnRestart.setOnClickListener(v -> {
            showInterstitialAndAction(() -> {
                startActivity(new Intent(this, GameActivity.class));
                finish();
            });
        });

        btnMainMenu.setOnClickListener(v -> {
            showInterstitialAndAction(() -> {
                startActivity(new Intent(this, MainActivity.class));
                finishAffinity();
            });
        });
    }

    private void loadInterstitialAd() {
        AdRequest adRequest = new AdRequest.Builder().build();

        // ID de teste para Intersticial: ca-app-pub-3940256099942544/1033173712
        InterstitialAd.load(this,"ca-app-pub-3940256099942544/1033173712", adRequest,
                new InterstitialAdLoadCallback() {
                    @Override
                    public void onAdLoaded(@NonNull InterstitialAd interstitialAd) {
                        mInterstitialAd = interstitialAd;
                    }

                    @Override
                    public void onAdFailedToLoad(@NonNull LoadAdError loadAdError) {
                        mInterstitialAd = null;
                    }
                });
    }

    private void showInterstitialAndAction(Runnable action) {
        if (mInterstitialAd != null) {
            mInterstitialAd.show(this);
            // Após fechar o anúncio ou se der erro, executa a ação
            mInterstitialAd.setFullScreenContentCallback(new com.google.android.gms.ads.FullScreenContentCallback() {
                @Override
                public void onAdDismissedFullScreenContent() {
                    action.run();
                }

                @Override
                public void onAdFailedToShowFullScreenContent(@NonNull com.google.android.gms.ads.AdError adError) {
                    action.run();
                }
            });
        } else {
            action.run();
        }
    }
}
