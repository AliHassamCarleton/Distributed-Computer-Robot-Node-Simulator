//Dream Team:Alnoor, Ali, Grayson


public static enum nodeDirection { LEFT, RIGHT };

public class Robot { //creates robots to move around the ring 

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
        myColor = color(0, 0, 0);
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

    public void eat(Robot r) { //when robots converge on each other 
        tally += r.getTally();
        chooseNewDirection();
    }

    private void chooseNewDirection() { //when robot return to its initial position and need to flip coin again 
        nodedirection = (random(1) > 0.5) ? nodeDirection.LEFT : nodeDirection.RIGHT;
    }

    public int getTally() {
      return tally;
    }

    public Node getNode() {
      return currentNode;
    }

}