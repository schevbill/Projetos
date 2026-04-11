package com.snakegame.game;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.RectF;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

import com.snakegame.utils.PreferencesManager;
import com.snakegame.utils.SoundManager;

import java.util.List;

/**
 * SurfaceView responsável por renderizar o jogo e capturar gestos do usuário.
 * Implementa o Game Loop em uma thread dedicada para não bloquear a UI.
 */
public class SnakeGameView extends SurfaceView implements SurfaceHolder.Callback {

    // ──────────────────────── Tema / Skin ────────────────────────
    public enum Theme {
        CLASSIC(0xFF4CAF50, 0xFF81C784, 0xFFFF5722, 0xFF212121),  // Verde clássico
        NEON   (0xFF00E5FF, 0xFF84FFFF, 0xFFFF4081, 0xFF0A0A0A),  // Neon cyberpunk
        RETRO  (0xFFFFEB3B, 0xFFFFF176, 0xFFE91E63, 0xFF1B1B1B);  // Amarelo retrô

        public final int headColor;
        public final int bodyColor;
        public final int foodColor;
        public final int bgColor;
        Theme(int h, int b, int f, int bg) {
            headColor = h; bodyColor = b; foodColor = f; bgColor = bg;
        }
    }

    // ──────────────────────── Constantes ────────────────────────
    private static final int GRID_COLS = 20;
    private static final int CELL_PADDING = 2; // px de padding dentro de cada célula
    private static final float SWIPE_MIN_DISTANCE = 50f;

    // ──────────────────────── Estado ────────────────────────
    private GameEngine engine;
    private GameThread gameThread;
    private boolean running = false;
    private boolean paused = false;
    private boolean gameOver = false;

    // ──────────────────────── Desenho ────────────────────────
    private int cellSize;
    private int gridWidth;
    private int gridHeight;
    private int offsetX;
    private int offsetY;
    private Theme theme;

    private final Paint paintHead = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint paintBody = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint paintFood = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint paintGrid = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint paintScore = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint paintOverlay = new Paint();

    // ──────────────────────── Dependências ────────────────────────
    private final SoundManager soundManager;
    private final PreferencesManager prefs;
    private Vibrator vibrator;
    private GestureDetector gestureDetector;

    // ──────────────────────── Callbacks ────────────────────────
    private GameOverListener gameOverListener;
    private ScoreUpdateListener scoreUpdateListener;

    public interface GameOverListener {
        void onGameOver(int score);
    }

    public interface ScoreUpdateListener {
        void onScoreUpdate(int score);
    }

    // ══════════════════════════════════════════════════════════════
    // Construtor
    // ══════════════════════════════════════════════════════════════
    public SnakeGameView(Context context, GameEngine.Difficulty difficulty, boolean wrapAround,
                         Theme theme, SoundManager soundManager, PreferencesManager prefs) {
        super(context);
        this.soundManager = soundManager;
        this.prefs = prefs;
        this.theme = theme;

        getHolder().addCallback(this);
        setFocusable(true);

        vibrator = (Vibrator) context.getSystemService(Context.VIBRATOR_SERVICE);

        // Detector de gestos para controle de swipe
        gestureDetector = new GestureDetector(context, new GestureDetector.SimpleOnGestureListener() {
            @Override
            public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
                if (e1 == null || e2 == null) return false;
                float dx = e2.getX() - e1.getX();
                float dy = e2.getY() - e1.getY();

                if (Math.abs(dx) > Math.abs(dy)) {
                    if (Math.abs(dx) > SWIPE_MIN_DISTANCE) {
                        engine.setDirection(dx > 0 ? Direction.RIGHT : Direction.LEFT);
                    }
                } else {
                    if (Math.abs(dy) > SWIPE_MIN_DISTANCE) {
                        engine.setDirection(dy > 0 ? Direction.DOWN : Direction.UP);
                    }
                }
                return true;
            }
        });

        // Inicializa o motor com grid calculado posteriormente (surfaceChanged)
        // Usamos valores provisórios; o engine será recriado em surfaceChanged
        gridWidth = GRID_COLS;
        gridHeight = 30; // placeholder
        engine = new GameEngine(gridWidth, gridHeight, difficulty, wrapAround);
    }

    // ══════════════════════════════════════════════════════════════
    // SurfaceHolder.Callback
    // ══════════════════════════════════════════════════════════════
    @Override
    public void surfaceCreated(SurfaceHolder holder) {
        // Aguarda surfaceChanged para ter as dimensões reais
    }

    @Override
    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
        // Calcula tamanho de célula baseado na largura disponível
        cellSize = width / GRID_COLS;
        gridWidth = GRID_COLS;
        gridHeight = height / cellSize;

        // Centraliza o grid
        offsetX = (width - gridWidth * cellSize) / 2;
        offsetY = (height - gridHeight * cellSize) / 2;

        // Recria o engine com as dimensões corretas do grid
        GameEngine.Difficulty diff = engine.getDifficulty();
        engine = new GameEngine(gridWidth, gridHeight, diff, false);

        configurePaints();
        startGameLoop();
    }

    @Override
    public void surfaceDestroyed(SurfaceHolder holder) {
        stopGameLoop();
    }

    // ══════════════════════════════════════════════════════════════
    // Configuração de Pinturas
    // ══════════════════════════════════════════════════════════════
    private void configurePaints() {
        paintHead.setColor(theme.headColor);
        paintHead.setStyle(Paint.Style.FILL);

        paintBody.setColor(theme.bodyColor);
        paintBody.setStyle(Paint.Style.FILL);

        paintFood.setStyle(Paint.Style.FILL);

        paintGrid.setColor(Color.argb(25, 255, 255, 255));
        paintGrid.setStyle(Paint.Style.STROKE);
        paintGrid.setStrokeWidth(0.5f);

        paintScore.setColor(Color.WHITE);
        paintScore.setTextSize(cellSize * 1.2f);
        paintScore.setTextAlign(Paint.Align.LEFT);
        paintScore.setFakeBoldText(true);

        paintOverlay.setColor(Color.argb(170, 0, 0, 0));
        paintOverlay.setStyle(Paint.Style.FILL);
    }

    // ══════════════════════════════════════════════════════════════
    // Game Loop
    // ══════════════════════════════════════════════════════════════
    private void startGameLoop() {
        running = true;
        gameOver = false;
        gameThread = new GameThread();
        gameThread.start();
    }

    private void stopGameLoop() {
        running = false;
        if (gameThread != null) {
            try {
                gameThread.join(1000);
            } catch (InterruptedException ignored) {}
        }
    }

    /** Thread do loop principal do jogo. */
    private class GameThread extends Thread {
        @Override
        public void run() {
            while (running) {
                if (!paused && !gameOver) {
                    GameEngine.GameResult result = engine.tick();
                    handleResult(result);
                }
                drawFrame();

                try {
                    Thread.sleep(engine.getCurrentInterval());
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            }
        }
    }

    private void handleResult(GameEngine.GameResult result) {
        switch (result) {
            case EATING:
                soundManager.playEat();
                if (scoreUpdateListener != null) {
                    post(() -> scoreUpdateListener.onScoreUpdate(engine.getScore()));
                }
                break;
            case GAME_OVER:
                gameOver = true;
                running = false;
                vibrate();
                soundManager.playGameOver();
                if (gameOverListener != null) {
                    post(() -> gameOverListener.onGameOver(engine.getScore()));
                }
                break;
            default:
                break;
        }
    }

    // ══════════════════════════════════════════════════════════════
    // Renderização
    // ══════════════════════════════════════════════════════════════
    private void drawFrame() {
        Canvas canvas = null;
        try {
            canvas = getHolder().lockCanvas();
            if (canvas == null) return;
            synchronized (getHolder()) {
                drawGame(canvas);
            }
        } finally {
            if (canvas != null) {
                getHolder().unlockCanvasAndPost(canvas);
            }
        }
    }

    private void drawGame(Canvas canvas) {
        // Fundo
        canvas.drawColor(theme.bgColor);

        // Grid sutil
        for (int x = 0; x <= gridWidth; x++) {
            canvas.drawLine(offsetX + x * cellSize, offsetY,
                            offsetX + x * cellSize, offsetY + gridHeight * cellSize, paintGrid);
        }
        for (int y = 0; y <= gridHeight; y++) {
            canvas.drawLine(offsetX, offsetY + y * cellSize,
                            offsetX + gridWidth * cellSize, offsetY + y * cellSize, paintGrid);
        }

        // Comida
        Food food = engine.getFood();
        drawFood(canvas, food);

        // Cobra
        List<Point> body = engine.getSnake().getBody();
        for (int i = 0; i < body.size(); i++) {
            drawCell(canvas, body.get(i), i == 0 ? paintHead : paintBody, i == 0);
        }

        // Pausa overlay
        if (paused) {
            canvas.drawRect(0, 0, getWidth(), getHeight(), paintOverlay);
            Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
            p.setColor(Color.WHITE);
            p.setTextSize(cellSize * 2f);
            p.setTextAlign(Paint.Align.CENTER);
            canvas.drawText("PAUSADO", getWidth() / 2f, getHeight() / 2f, p);
        }
    }

    private void drawFood(Canvas canvas, Food food) {
        Point pos = food.getPosition();
        int color;
        switch (food.getType()) {
            case BONUS: color = 0xFFFFD700; break; // Dourado
            case SUPER: color = 0xFFFF1744; break; // Vermelho vibrante
            default:    color = theme.foodColor;    break;
        }
        paintFood.setColor(color);

        float cx = offsetX + pos.x * cellSize + cellSize / 2f;
        float cy = offsetY + pos.y * cellSize + cellSize / 2f;
        float radius = (cellSize - CELL_PADDING * 2) / 2f;
        canvas.drawCircle(cx, cy, radius, paintFood);
    }

    private void drawCell(Canvas canvas, Point cell, Paint paint, boolean isHead) {
        float left   = offsetX + cell.x * cellSize + CELL_PADDING;
        float top    = offsetY + cell.y * cellSize + CELL_PADDING;
        float right  = left + cellSize - CELL_PADDING * 2;
        float bottom = top  + cellSize - CELL_PADDING * 2;
        float radius = isHead ? cellSize * 0.35f : cellSize * 0.25f;
        canvas.drawRoundRect(new RectF(left, top, right, bottom), radius, radius, paint);
    }

    // ══════════════════════════════════════════════════════════════
    // Entrada do usuário
    // ══════════════════════════════════════════════════════════════
    @Override
    public boolean onTouchEvent(MotionEvent event) {
        gestureDetector.onTouchEvent(event);
        return true;
    }

    /** Chamado pelos botões de direção na UI. */
    public void onDirectionButton(Direction dir) {
        engine.setDirection(dir);
    }

    // ══════════════════════════════════════════════════════════════
    // Controle de estado
    // ══════════════════════════════════════════════════════════════
    public void pause() {
        paused = true;
    }

    public void resume() {
        paused = false;
    }

    public boolean isPaused() {
        return paused;
    }

    public void restartGame() {
        engine.reset();
        gameOver = false;
        paused = false;
        if (!running) {
            running = true;
            gameThread = new GameThread();
            gameThread.start();
        }
    }

    // ══════════════════════════════════════════════════════════════
    // Vibração
    // ══════════════════════════════════════════════════════════════
    private void vibrate() {
        if (!prefs.isVibrationEnabled() || vibrator == null) return;
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            vibrator.vibrate(VibrationEffect.createOneShot(300, VibrationEffect.DEFAULT_AMPLITUDE));
        } else {
            vibrator.vibrate(300);
        }
    }

    // ══════════════════════════════════════════════════════════════
    // Setters de listener
    // ══════════════════════════════════════════════════════════════
    public void setGameOverListener(GameOverListener listener) {
        this.gameOverListener = listener;
    }

    public void setScoreUpdateListener(ScoreUpdateListener listener) {
        this.scoreUpdateListener = listener;
    }

    public int getScore() {
        return engine.getScore();
    }
}
