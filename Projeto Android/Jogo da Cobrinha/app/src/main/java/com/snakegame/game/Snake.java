package com.snakegame.game;

import android.graphics.Point;
import java.util.ArrayList;
import java.util.List;

/**
 * Modelo da cobra do jogo.
 * Gerencia a posição de cada segmento e a lógica de movimento.
 */
public class Snake {

    private final List<Point> body; // Lista de segmentos; índice 0 é a cabeça
    private Direction direction;
    private Direction nextDirection; // Direção enfileirada para o próximo tick

    public Snake(int startX, int startY) {
        body = new ArrayList<>();
        // Começa com 3 segmentos
        body.add(new Point(startX, startY));
        body.add(new Point(startX - 1, startY));
        body.add(new Point(startX - 2, startY));
        direction = Direction.RIGHT;
        nextDirection = Direction.RIGHT;
    }

    /**
     * Enfileira a próxima direção (ignorada se for oposta à atual).
     */
    public void setNextDirection(Direction dir) {
        if (!dir.isOpposite(direction)) {
            nextDirection = dir;
        }
    }

    /**
     * Move a cobra um passo na direção atual.
     * Retorna true se cresceu (comeu comida), false caso contrário.
     * O chamador deve verificar colisão antes de chamar este método.
     */
    public Point getNextHeadPosition() {
        direction = nextDirection;
        Point head = body.get(0);
        switch (direction) {
            case UP:    return new Point(head.x, head.y - 1);
            case DOWN:  return new Point(head.x, head.y + 1);
            case LEFT:  return new Point(head.x - 1, head.y);
            default:    return new Point(head.x + 1, head.y); // RIGHT
        }
    }

    /**
     * Avança a cobra: adiciona nova cabeça e remove a cauda.
     */
    public void move(Point newHead) {
        body.add(0, newHead);
        body.remove(body.size() - 1);
    }

    /**
     * Avança a cobra e cresce (não remove a cauda).
     */
    public void moveAndGrow(Point newHead) {
        body.add(0, newHead);
    }

    /**
     * Verifica se o ponto fornecido colide com algum segmento do corpo da cobra.
     */
    public boolean collidesWithBody(Point point) {
        for (Point segment : body) {
            if (segment.equals(point)) return true;
        }
        return false;
    }

    /**
     * Verifica se o ponto é o mesmo que a cabeça (colisão com a própria cabeça).
     * Usado para verificar auto-colisão com os segmentos exceto a cabeça.
     */
    public boolean collidesWithBodyExcludingHead(Point point) {
        for (int i = 1; i < body.size(); i++) {
            if (body.get(i).equals(point)) return true;
        }
        return false;
    }

    public List<Point> getBody() {
        return body;
    }

    public Point getHead() {
        return body.get(0);
    }

    public Direction getDirection() {
        return direction;
    }

    public int getLength() {
        return body.size();
    }
}
