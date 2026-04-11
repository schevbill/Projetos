package com.snakegame.game;

import android.graphics.Point;
import java.util.List;
import java.util.Random;

/**
 * Representa o alimento que a cobra pode comer.
 */
public class Food {

    private Point position;
    private final Random random = new Random();

    // Tipos de comida com diferentes valores de pontuação
    public enum FoodType {
        NORMAL(10),   // Comida comum — verde
        BONUS(30),    // Comida bônus — dourada (aparece por tempo limitado)
        SUPER(50);    // Super comida — vermelha brilhante (rara)

        public final int points;
        FoodType(int points) { this.points = points; }
    }

    private FoodType type;

    public Food(int gridWidth, int gridHeight, List<Point> snakeBody) {
        spawn(gridWidth, gridHeight, snakeBody);
    }

    /**
     * Reposiciona o alimento em uma célula livre do grid.
     */
    public void spawn(int gridWidth, int gridHeight, List<Point> snakeBody) {
        Point candidate;
        int attempts = 0;
        do {
            candidate = new Point(random.nextInt(gridWidth), random.nextInt(gridHeight));
            attempts++;
        } while (isOccupied(candidate, snakeBody) && attempts < 200);

        position = candidate;

        // Define tipo aleatório com probabilidades: 70% normal, 20% bonus, 10% super
        int roll = random.nextInt(100);
        if (roll < 70) {
            type = FoodType.NORMAL;
        } else if (roll < 90) {
            type = FoodType.BONUS;
        } else {
            type = FoodType.SUPER;
        }
    }

    private boolean isOccupied(Point point, List<Point> snakeBody) {
        for (Point seg : snakeBody) {
            if (seg.equals(point)) return true;
        }
        return false;
    }

    public Point getPosition() {
        return position;
    }

    public FoodType getType() {
        return type;
    }

    public int getPoints() {
        return type.points;
    }
}
