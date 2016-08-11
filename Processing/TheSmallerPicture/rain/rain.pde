Rain r1;

int numDrops = 100;
Rain[] drops = new Rain[numDrops]; // Declare and create the array

void setup() {
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

void draw(){
  fill(255,80);
  rect(0,0,450,320);
  //Loop through array to use objects.
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }
  // saveFrame("../frames/#########.tif"); if (frameCount == 600) exit();
}

class Rain {
  float r = random(width);
  float y = random(-height);

  void fall() {
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
