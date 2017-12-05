
public class Node {

    private float x, y, radius;

    private int id;

    private Node leftNode, rightNode;

    public Node(int i, float floatX, float floatY) {

        x = floatX;
        y = floatY;
        id = i;
        radius = 10;

    }

    public void draw() {

        fill(0);
        strokeWeight(1);
        stroke(0);
        ellipse(x, y, radius, radius);

    }

    public int getId() {
      return id;
    }

    public float getX() {
      return x;
    }

    public float getY() {
      return y;
    }

    public float getRadius() {
      return radius;
    }

    public Node getLeft() {
      return leftNode;
    }

    public Node getRight() {
      return rightNode;
    }

    public void setNodeleft(Node n) {
      leftNode = n;
    }

    public void setNoderight(Node n) {
      rightNode = n;
    }

}
