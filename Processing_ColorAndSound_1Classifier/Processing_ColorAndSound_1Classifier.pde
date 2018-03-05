// This demo changes the pitch of the sound played and the screen color to match the class received
// Works with 1 classifier output, any number of classes
// Rebecca Fiebrink, 2016

//Necessary for OSC communication with Wekinator:
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress dest;

//No need to edit:
PFont myFont, myBigFont;
int frameNum = 0;
int currentHue = 100;
int currentTextHue = 255;
String currentMessage = "Waiting...";
int dogs = 0;
int jump = 0;
String[] messageNames = {"/output_1", "/output_2", "/output_3"};


void setup() {
  size(600,600, P3D);
  colorMode(HSB);
  smooth();
 
  
  //Initialize OSC communication
  oscP5 = new OscP5(this,12000); //listen for OSC messages on port 12000 (Wekinator default)
  dest = new NetAddress("127.0.0.1",6448); //send messages back to Wekinator on port 6448, localhost (this machine) (default)
  
  //Set up fonts
  myFont = createFont("Arial", 14);
  myBigFont = createFont("Arial", 60);
}

void draw() {
  frameRate(30);
  background(currentHue, 600, 600);
  PImage img;
  String name = Integer.toString(dogs).concat(".png");
  if(name.equals("20.png")){
    name = "20-Final.png"; 
  }
  
  if(dogs == 11){
    name = "Jump.png";
  }
  
  img = loadImage(name);
  image(img, 0, 0);
  //if(rapperCode == 1.0){
  //  img = loadImage("kanye.png");
  //  image(img, x-(float)w/3, y-(float)w/3, 1.6*w, 1.6*w);
  //} else if(rapperCode == 6.0){
  //  img = loadImage("drake.png");
  //  image(img, x-(float)3 * w/10, y-(float)w/3, 1.6*w, 1.6*w);
  //}
  //drawText();
}

//This is called automatically when OSC message is received
void oscEvent(OscMessage theOscMessage) {
 println("received message");
   println(theOscMessage);
   if(theOscMessage.checkAddrPattern(messageNames[0]) == true){
     dogs += 1;
   }
   
   if(theOscMessage.checkAddrPattern(messageNames[1]) == true){
     jump += 1;
     if(jump == 3){
       dogs += 1; 
     }
   }
   
  if (theOscMessage.checkAddrPattern("/wek/outputs") == true) {

    float f = theOscMessage.get(0).floatValue();
    println("received1");
    println(Float.toString(f));
    showMessage((int)f);
    
  }
  
}

void showMessage(int i) {
    currentHue = (int)generateColor(i);
    currentTextHue = (int)generateColor((i+1));
    currentMessage = Integer.toString(i);
    

}

//Write instructions to screen.
void drawText() {
    stroke(0);
    textFont(myFont);
    textAlign(LEFT, TOP); 
    fill(currentTextHue, 255, 255);

    text("Receives 1 classifier output message from wekinator", 10, 10);
    text("Listening for OSC message /wek/outputs, port 12000", 10, 30);
    
    textFont(myBigFont);
    text(currentMessage, 190, 180);
}


float generateColor(int which) {
  float f = 100; 
  int i = which;
  if (i <= 0) {
     return 100;
  } 
  else {
     return (generateColor(which-1) + 1.61*255) %255; 
  }
}