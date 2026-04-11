package com.snakegame.game;

import android.graphics.Point;

/**
 * Motor do jogo: gerencia a lógica de atualização do estado a cada tick.
 * Independente de Android UI — fácil de testar isoladamente.
 */
public class GameEngine {

    public enum Difficulty {
        EASY(250),    // ms por tick
        MEDIUM(180),
        HARD(120),
        INSANE(70);

        public final long baseInterval;
        Difficulty(long ms) { this.baseInterval = ms; }
    }

    public enum GameResult {
        RUNNING, EATING, GAME_OVER
    }

    private final int gridWidth;
    private final int gridHeight;
    private Snake snake;
    private Food food;
    private int score;
    private int foodEaten;
    private Difficulty difficulty;
    private boolean wrapAround; // Modo bordas atravessáveis

    // Velocidade aumenta a cada X comidas ingeridas
    private static final int SPEED_UP_EVERY = 5;
    private static final float SPEED_FACTOR = 0.90f; // Reduz intervalo em 10%

    public GameEngine(int gridWidth, int gridHeight, Difficulty difficulty, boolean wrapAround) {
        this.gridWidth = gridWidth;
        this.gridHeight = gridHeight;
        this.difficulty = difficulty;
        this.wrapAround = wrapAround;
        reset();
    }

    /** Reinicia o jogo do zero. */
    public void reset() {
        snake = new Snake(gridWidth / 2, gridHeight / 2);
        food = new Food(gridWidth, gridHeight, snake.getBody());
        score = 0;
        foodEaten = 0;
    }

    /**
     * Executa um tick do jogo.
     * Retorna o resultado: ainda rodando, comeu, ou game over.
     */
    public GameResult tick() {
        Point nextHead = snake.getNextHeadPosition();

        // Trata bordas atravessáveis
        if (wrapAround) {
            nextHead.x = (nextHead.x + gridWidth) % gridWidth;
            nextHead.y = (nextHead.y + gridHeight) % gridHeight;
        }

        // Colisão com paredes
        if (!wrapAround && isOutOfBounds(nextHead)) {
            return GameResult.GAME_OVER;
        }

        // Colisão com o próprio corpo
        if (snake.collidesWithBodyExcludingHead(nextHead)) {
            return GameResult.GAME_OVER;
        }

        // Verifica se comeu a comida
        if (nextHead.equals(food.getPosition())) {
            snake.moveAndGrow(nextHead);
            score += food.getPoints();
            foodEaten++;
            food.spawn(gridWidth, gridHeight, snake.getBody());
            return GameResult.EATING;
        }

        snake.move(nextHead);
        return GameResult.RUNNING;
    }

    private boolean isOutOfBounds(Point p) {
        return p.x < 0 || p.x >= gridWidth || p.y < 0 || p.y >= gridHeight;
    }

    /**
     * Calcula o intervalo atual em ms, reduzindo conforme o progresso.
     */
    public long getCurrentInterval() {
        long interval = difficulty.baseInterval;
        int speedUps = foodEaten / SPEED_UP_EVERY;
        for (int i = 0; i < speedUps; i++) {
            interval = (long) (interval * SPEED_FACTOR);
        }
        // Limite mínimo de 50ms
        return Math.max(interval, 50);
    }

    public void setDirection(Direction dir) {
        snake.setNextDirection(dir);
    }

    public Snake getSnake() { return snake; }
    public Food getFood() { return food; }
    public int getScore() { return score; }
    public int getFoodEaten() { return foodEaten; }
    public int getGridWidth() { return gridWidth; }
    public int getGridHeight() { return gridHeight; }
    public Difficulty getDifficulty() { return difficulty; }
}
