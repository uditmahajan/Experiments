HSwarm swarm;
HDrawablePool pool, pool2;
HTimer timer;

void setup() {
	size(640,640);
	H.init(this).background(#202020).autoClear(false);
	smooth();

	swarm = new HSwarm()
		.addGoal(1.5*width,height)
		.speed(1)
		.turnEase(0.05f)
		.twitch(5)
	;

	pool = new HDrawablePool(10);
	pool.autoAddToStage()
		.add (
			new HRect()
			.rounding(4)
			.size(random(1),random(1))
		)

		// .colorist(new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600).fillOnly())
		.colorist(new HColorPool(255).fillOnly())

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.noStroke()
						.loc( 0, random(height-100, height))
						.anchorAt( H.CENTER )
					;

					swarm.addTarget(d);
				}
			}
		)
	;

	pool2 = new HDrawablePool(10);
	pool2.autoAddToStage()
		.add (
			new HRect()
			.rounding(4)
			.size(1,1)
		)

		// .colorist(new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600).fillOnly())
		.colorist(new HColorPool(255).fillOnly())

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.noStroke()
						.loc( 0, random(height-100, height))
						.anchorAt( H.CENTER )
					;

					swarm.addTarget(d);
				}
			}
		)
	;


	timer = new HTimer()
		.numCycles( pool.numActive() )
		.numCycles( pool2.numActive() )
		.interval(250)
		.callback(
			new HCallback() { 
				public void run(Object obj) {
					pool.request();
					pool2.request();
				}
			}
		)
	;
}

void draw() {
	H.drawStage();
	// saveFrame("../frames/#########.tif"); if (frameCount == 400) exit();

}

