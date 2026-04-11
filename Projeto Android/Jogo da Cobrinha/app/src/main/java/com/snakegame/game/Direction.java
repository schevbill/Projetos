package com.snakegame.game;

/**
 * Enumeração das direções possíveis de movimento da cobra.
 */
public enum Direction {
    UP, DOWN, LEFT, RIGHT;

    /**
     * Verifica se a direção é oposta (para evitar que a cobra vire 180 graus).
     */
    public boolean isOpposite(Direction other) {
        if (this == UP && other == DOWN) return true;
        if (this == DOWN && other == UP) return true;
        if (this == LEFT && other == RIGHT) return true;
        if (this == RIGHT && other == LEFT) return true;
        return false;
    }
}
