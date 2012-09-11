package maddashrobo.controllers 
{
	import jboost.IController;
	import maddashrobo.Game;
	import nape.geom.Vec2;
	import nape.space.Space;
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class NapeCore implements IController 
	{
		public static var space:Space;
		
		public function NapeCore() 
		{
			space = new Space(new Vec2());
		}
		public function onUpdate(time:Number):void {
			space.step(time, 10, 10);
		}
		public function onSetup(entity:Object):void{
			var game:Game = entity as Game;
		}
		public function onDestroy():void{
			
		}
	}

}