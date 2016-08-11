import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class rain extends PApplet {

Rain r1;

int numDrops = 100;
Rain[] drops = new Rain[numDrops]; // Declare and create the array

public void setup() {
  size(450,320);
  background(255);
  smooth();
  noStroke();
  //Loop through array to create each object
  for (int i = 0; i < drops.length; i++) {

    drops[i] = new Rain(); // Create each object
    r1 = new Rain();
  }
}

public void draw(){
  fill(255,80);
  rect(0,0,450,320);
  //Loop through array to use objects.
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }
  saveFrame("../frames/#########.tif"); if (frameCount == 600) exit();
}

class Rain {
  float r = random(width);
  float y = random(-height);

  public void fall() {
    y = y + random(2, 10);
    r = r + random(1);
    fill(0);
    rect(r, y, 1, 5);

   if(y>height){
   r = random(height);
   y = random(-200);
   }

  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "rain" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
