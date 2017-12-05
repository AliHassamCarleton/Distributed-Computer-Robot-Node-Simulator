
public static enum nodeDirection { LEFT, RIGHT };

public class Robot {

    private float radius;
    private color myColor;
    private int intSpeed, tally, numRobots;
    private nodeDirection nodedirection;
    private Node currentNode, orginNode;

    public Robot(int s, Node start, int n) {
        currentNode = start;
        orginNode = start;
        numRobots = n;
        intSpeed = s;
        tally = 1;
        radius = currentNode.getRadius() + 20;
        myColor = color(floor(random(256)), floor(random(256)), floor(random(256)));
    }

    public void update() {

        if (tally == numRobots) {
          return;
        }

        if (currentNode == orginNode) {
          chooseNewDirection();
        }

        int i=0;

        while (i<intSpeed){

          currentNode = nodedirection == nodeDirection.LEFT ? currentNode.getLeft() : currentNode.getRight();
          i++;

        }



    }

    public void draw() {
        noFill();
        strokeWeight(5);
        stroke(myColor);
        ellipse(currentNode.getX(), currentNode.getY(), radius, radius);
    }

    public void eat(Robot r) {
        tally += r.getTally();
        chooseNewDirection();
    }

    private void chooseNewDirection() {
        nodedirection = (random(1) > 0.5) ? nodeDirection.LEFT : nodeDirection.RIGHT;
    }

    public int getTally() {
      return tally;
    }

    public Node getNode() {
      return currentNode;
    }

}
