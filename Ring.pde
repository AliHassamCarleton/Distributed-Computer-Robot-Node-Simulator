//Alnoor, Ali, Grayson

public class Ring {

    private ArrayList<Robot> robots;
    private int robotSpeed, iters, numberofRobots, numberofNodes;
    private ArrayList<Node> nodes;

    public Ring(int numrobs, int numnodes, int speed) {

        numberofRobots = numrobs;
        robots = new ArrayList<Robot>(numberofRobots);
        numberofNodes = numnodes;
        nodes = new ArrayList<Node>(numberofNodes);

        robotSpeed = speed;
        iters = 0;

        float testr = 360/(float)numberofNodes;
        float  half = screen[1]/2 - 50;
        nodes.add(new Node(0, cos(radians(testr*0))* half, sin(radians(testr*0))* half));

        int i=1;
        while (i<numberofNodes){

          nodes.add(new Node(i, cos(radians(testr*i))* half, sin(radians(testr*i))* half));
          nodes.get(i).setNodeleft(nodes.get(i-1));
          nodes.get(i-1).setNoderight(nodes.get(i));

          i++;

        }


        nodes.get(0).setNodeleft(nodes.get(nodes.size()-1));
        nodes.get(nodes.size()-1).setNoderight(nodes.get(0));

        int c=0;

        while (c<numberofRobots){

          robots.add(new Robot(robotSpeed, nodes.get(floor(random(numberofNodes))), numberofRobots));
          c++;

        }

    }

    public int getnumberofRobots() {

      return numberofRobots;

    }

    public int getnumberofNodes() {

      return numberofNodes;

    }

    public int getrobotSpeed() {

      return robotSpeed;

    }

    public int getiters() {

      return iters;

    }

    public void doTest() {

        while (robots.size() > 1) {

            iters++;

            for (Robot r : robots){
              r.update();
            }

            updateRobots();

        }

    }

    public void updatePosition() {

        if (robots.size() > 1){
          iters++;
        }
        for (Robot r : robots){
          r.update();
        }

    }


    public void draw() {

        for (Node n : nodes) {
          n.draw();
        }

        int i=robots.size()-1;

        while (i>=0){

          robots.get(i).draw();

          i--;
        }
    }

    public boolean updateRobots() {

        if (robots.size() == 1) {
            return false;
        }


        ArrayList<Robot> newList = new ArrayList<Robot>();

        while (robots.size() > 0) {

            Robot currentRobot = robots.get(0);

            int j=1;

            while (j<robots.size()){

              if (nodeGap(currentRobot.getNode(), robots.get(j).getNode(), robotSpeed)) {

                  currentRobot.eat(robots.get(j));
                  robots.remove(j--);

                }
              j++;

            }

            newList.add(currentRobot);
            robots.remove(0);

        }
        robots = newList;
        return true;

    }

    private boolean nodeGap(Node n1, Node n2, int distance) {
        if (n1 == n2)
          return true;

        Node temp = n1;

        int i=0;

        while (i<distance){

          temp = temp.getLeft();
          if (temp == n2) return true;
          i++;

        }

        temp = n1;

        i=0;

        while (i<distance){
          temp = temp.getRight();
          if (temp == n2) return true;
          i++;
        }

        return false;
    }

}