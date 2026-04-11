package com.snakegame;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

/**
 * Tela exibida ao fim do jogo com pontuação e opções de reiniciar ou sair.
 */
public class GameOverActivity extends AppCompatActivity {

    public static final String EXTRA_SCORE      = "score";
    public static final String EXTRA_HIGH_SCORE = "high_score";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_game_over);

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
            startActivity(new Intent(this, GameActivity.class));
            finish();
        });

        btnMainMenu.setOnClickListener(v -> {
            startActivity(new Intent(this, MainActivity.class));
            finishAffinity();
        });
    }
}
