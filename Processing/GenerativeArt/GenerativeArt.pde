import ddf.minim.*;
Minim minim;
AudioPlayer[] players = new AudioPlayer[4];

//class
class walker {

	int x,y;

	//constructor
	walker(){
		x = width/2;
		y = height/2;
	}

	void step(){
		int choice = int(random(4));

		float stepx = random(-1,1);
		float stepy = random(-1,1);

		if(choice==0){
			x++;
players[0].play();
                        players[0].rewind();
//                        x+=5;
			// x+= random(1,2);
			// x+=stepx;
		}
		else if (choice==1) {
			x--;
players[1].play();
                        players[1].rewind();
//                        x-=5;

			// x-=random(1,2);
			// x-=stepx;
		}
		else if (choice==2) {
			y++;
players[2].play();
                        players[2].rewind();
//                        y+=5;

			// y+=random(1,2);
			// y+=stepy;
		}
		else if (choice==3) {
			y--;
players[3].play();
                        players[3].rewind();
//                        y-=5;

			// y-=random(1,2);
			// y-=stepy;
		}

	}

	void display(){
		// stroke(255);
		noStroke();
		fill(255,10);

		if (a == 1) {
			stroke(255);
                        strokeWeight(1);
                        
			point(x,y);
                        	
		}
		
	}
}

// walker w;
walker w1, w2, w3, w4, w5, w6, w7, w8;
int a = 0;
int b = 0;

void setup() {
	size(512, 512);

//        frameRate(5);
	// w = new walker();
	w1 = new walker();

	background(0);
        minim = new Minim(this);
        players[0] = minim.loadFile("1.mp3");
        players[1] = minim.loadFile("2.mp3");
        players[2] = minim.loadFile("3.mp3");
        players[3] = minim.loadFile("4.mp3");
}

void draw() {
        noStroke();
        fill(0, 1);
        rect(0, 0, width, height);

	a = 1;
        
        
        if(b == 0){
          w1.display();
          w1.step();
        }
	b = (b+1)%2;


}
