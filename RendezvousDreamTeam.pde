//Dream Team:Alnoor, Ali, Grayson

import java.util.ArrayList;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;

//Window params
int[] screen = { 1080, 600 };
float displayX, screenY;
int testcount=0;

//some global variables
Ring ring;

int speed, delay;
int nodes, robots;

Button[] buttons = { new Button("Add Bot", 20, 60, 100, 50),
                     new Button("Delete Bot", 20, 120, 100, 50),
                     new Button("Add Node", 20, 180, 100, 50),
                     new Button("Delete Node", 20, 240, 100, 50),
                     new Button("Inc Speed", 20, 300, 100, 50),
                     new Button("Dec Speed", 20, 360, 100, 50),
                     new Button("RESTART", 20, 530, 100, 50) };


ArrayList< ArrayList<Integer> > testList;

void settings() {
    size(screen[0], screen[1]);
}

void setup() {

    robots = 5;
    nodes = 20;

    delay = 200;
    speed = 1;
    displayX = screen[0]/2;
    screenY = screen[1]/2;
    frameRate(30);

    ring = new Ring(robots, nodes, speed);

    testcaseReader();
}

//read test cases and settings from config file
void testcaseReader() {

        String strTestline1;
        String strTestline2;
        String strTestline3;
        
        
            testList = new ArrayList< ArrayList<Integer> >();

            ArrayList<Integer> testCase = new ArrayList<Integer>();
            ArrayList<Integer> testCase2 = new ArrayList<Integer>();
            ArrayList<Integer> testCase3 = new ArrayList<Integer>();


            strTestline1= "5,15,1,1000";
            strTestline2= "4,15,1,1000";
            strTestline3= "3,15,1,1000";
            


            for (String i : strTestline1.split(","))
                testCase.add(Integer.parseInt(i));
            for (String c : strTestline2.split(",")){
                testCase2.add(Integer.parseInt(c));
            }
            for (String d : strTestline3.split(",")){
                testCase3.add(Integer.parseInt(d));
            }
            
            testList.add(testCase);
            testList.add(testCase2);
            testList.add(testCase3);
          
            testcount= 3;
        
}

//main program loop
void draw() {

        delay(delay);
        runTestCases();
        background(255);
        ring.updatePosition(); //move robots

        drawRing(ring);
        drawGUI();

        textAlign(LEFT, TOP);
        ring.updateRobots(); //check for collisions and merge robots

}

//run test cases without the GUI
void runTestCases() {
    
    for (int i=0; i<testList.size(); i++) {
          
      testcount--;
      
      if (testcount<0) //stops running upon completing necessary amount of tests
        break;
                
        Log log = new Log(testList.get(i).get(0), testList.get(i).get(1), testList.get(i).get(2));

        for (int j=0; j<testList.get(i).get(3); j++) {
            ring = new Ring(testList.get(i).get(0), testList.get(i).get(1), testList.get(i).get(2));
            ring.doTest();
            log.addtoJournal(str(ring.getiters()));
        }
        
        log.saveToFile();
         
    }
}

//draw the UI
void drawGUI() {
    PFont font;
    font = createFont("Comic.ttf", 32);
    textFont(font);
    for (int i = 0; i < buttons.length; i++) { buttons[i].Draw(); }
    textSize(32);
    textAlign(CENTER);
    text("Robots: " + str(robots), 950, screen[1]/2 - 64);
    text("Nodes: " + str(nodes), 950, screen[1]/2);
    text("Speed: " + str(speed), 950, screen[1]/2 + 64);
    textAlign(LEFT, TOP);
    fill(255, 0, 0);
    text("# Rounds: " + str(ring.getiters()), 850, 450);;
    String[] fontList = PFont.list();
    font = createFont("stocky.ttf", 32);
    textFont(font);
    fill(0,0,255);
    text("ROBOT RENDEZVOUS ", 350, 275);
}

//draw the ring (nodes & robots)
void drawRing(Ring r) {
    pushMatrix();
    translate(displayX, screenY);
    r.draw();
    popMatrix();
}

// the Button class
class Button {
  String label; // button label
  float x;      // top left corner x position
  float y;      // top left corner y position
  float w;      // width of button
  float h;      // height of button

  // constructor
  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }

  void Draw() {
    fill(218);
    stroke(141);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(14);
    text(label, x + (w / 2), y + (h / 2));
  }

  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
  }
}

void mousePressed()
{
  for (int i=0; i< buttons.length; i++) {
    if (buttons[i].MouseIsOver()) {
      if (buttons[i].label == "Add Bot") robots++;
      if (buttons[i].label == "Delete Bot" && robots > 1) robots -= 1;
      if (buttons[i].label == "Add Node") nodes++;
      if (buttons[i].label == "Delete Node" && nodes > 1) nodes -= 1;
      if (buttons[i].label == "Inc Speed") speed++;
      if (buttons[i].label == "Dec Speed" && speed > 1) speed -= 1;
      if (buttons[i].label == "RESTART") ring = new Ring(robots, nodes, speed);
     }
  }
}