package maddashrobo.controllers 
{
	import jboost.IController;
	import maddashrobo.Game;
	import nape.geom.Vec2;
	import nape.space.Space;
	import nape.util.Debug;
	import nape.phys.Body;
	import nape.shape.Polygon;
	import nape.phys.BodyType;
	import nape.util.BitmapDebug;
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class NapeCore implements IController 
	{
		public static var space:Space;
		
		private var debug:Debug;
		private var game:Game;
		
		public function NapeCore() 
		{
			space = new Space(new Vec2());
		}
		public function onUpdate(time:Number):void {
			//space.step(time, 10, 10);
			// Step forward in simulation by the required number of seconds.
            space.step(1 / 60);
 
            // Render Space to the debug draw.
            //   We first clear the debug screen,
            //   then draw the entire Space,
            //   and finally flush the draw calls to the screen.
            debug.clear();
            debug.draw(space);
            debug.flush();
		}
		public function onSetup(entity:Object):void{
			game = entity as Game;
			var w:int = game.stage.stageWidth;
            var h:int = game.stage.stageHeight;
			debug = new BitmapDebug(w, h, game.stage.color);
            Game.view.addChild(debug.display);
			
			// Create the floor for the simulation.
            //   We use a STATIC type object, and give it a single
            //   Polygon with vertices defined by Polygon.rect utility
            //   whose arguments are (x, y) of top-left corner and the
            //   width and height.
            //
            //   A static object does not rotate, so we don't need to
            //   care that the origin of the Body (0, 0) is not in the
            //   centre of the Body's shapes.
            var floor:Body = new Body(BodyType.STATIC);
            floor.shapes.add(new Polygon(Polygon.rect(50, (h - 50), (w - 100), 1)));
            floor.space = space;
 
            // Create a tower of boxes.
            //   We use a DYNAMIC type object, and give it a single
            //   Polygon with vertices defined by Polygon.box utility
            //   whose arguments are the width and height of box.
            //
            //   Polygon.box(w, h) === Polygon.rect((-w / 2), (-h / 2), w, h)
            //   which means we get a box whose centre is the body origin (0, 0)
            //   and that when this object rotates about its centre it will
            //   act as expected.
            for (var i:int = 0; i < 16; i++) {
                var box:Body = new Body(BodyType.DYNAMIC);
                box.shapes.add(new Polygon(Polygon.box(16, 32)));
                box.position.setxy((w / 2), ((h - 50) - 32 * (i + 0.5)));
                box.space = space;
            }
		}
		public function onDestroy():void{
			
		}
	}

}