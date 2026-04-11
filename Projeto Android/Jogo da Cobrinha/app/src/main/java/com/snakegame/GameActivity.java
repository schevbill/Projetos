package com.snakegame;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.snakegame.game.Direction;
import com.snakegame.game.GameEngine;
import com.snakegame.game.SnakeGameView;
import com.snakegame.utils.PreferencesManager;
import com.snakegame.utils.SoundManager;

/**
 * Activity que hospeda o jogo. Gerencia o ciclo de vida (pause/resume)
 * e conecta os botões de controle ao SnakeGameView.
 */
public class GameActivity extends AppCompatActivity {

    private SnakeGameView gameView;
    private PreferencesManager prefs;
    private SoundManager soundManager;
    private TextView tvScore;
    private TextView tvBtnPause;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Tela cheia e sempre ligada
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        getWindow().setFlags(
                WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);

        setContentView(R.layout.activity_game);

        prefs = new PreferencesManager(this);
        soundManager = new SoundManager(this, prefs.isSoundEnabled(), prefs.isMusicEnabled());

        tvScore    = findViewById(R.id.tvScore);
        tvBtnPause = findViewById(R.id.btnPause);

        // Cria a view do jogo com as configurações salvas
        FrameLayout gameContainer = findViewById(R.id.gameContainer);
        gameView = new SnakeGameView(
                this,
                prefs.getDifficulty(),
                prefs.isWrapAround(),
                prefs.getTheme(),
                soundManager,
                prefs
        );
        gameContainer.addView(gameView);

        // Listener de fim de jogo
        gameView.setGameOverListener(score -> {
            prefs.saveHighScore(score);
            Intent intent = new Intent(GameActivity.this, GameOverActivity.class);
            intent.putExtra(GameOverActivity.EXTRA_SCORE, score);
            intent.putExtra(GameOverActivity.EXTRA_HIGH_SCORE, prefs.getHighScore());
            startActivity(intent);
            finish();
        });

        // Listener de atualização de pontuação
        gameView.setScoreUpdateListener(score ->
                tvScore.setText(getString(R.string.score_label, score))
        );

        // ── Botões de direção ──────────────────────────────────
        findViewById(R.id.btnUp).setOnClickListener(v ->
                gameView.onDirectionButton(Direction.UP));
        findViewById(R.id.btnDown).setOnClickListener(v ->
                gameView.onDirectionButton(Direction.DOWN));
        findViewById(R.id.btnLeft).setOnClickListener(v ->
                gameView.onDirectionButton(Direction.LEFT));
        findViewById(R.id.btnRight).setOnClickListener(v ->
                gameView.onDirectionButton(Direction.RIGHT));

        // ── Botão Pausar ───────────────────────────────────────
        tvBtnPause.setOnClickListener(v -> togglePause());
    }

    private void togglePause() {
        if (gameView.isPaused()) {
            gameView.resume();
            soundManager.startMusic();
            tvBtnPause.setText(R.string.btn_pause);
        } else {
            gameView.pause();
            soundManager.pauseMusic();
            tvBtnPause.setText(R.string.btn_resume);
        }
    }

    @Override
    protected void onPause() {
        super.onPause();
        gameView.pause();
        soundManager.pauseMusic();
    }

    @Override
    protected void onResume() {
        super.onResume();
        soundManager.startMusic();
        // Não retoma automaticamente para dar ao jogador chance de se preparar
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        soundManager.release();
    }
}
