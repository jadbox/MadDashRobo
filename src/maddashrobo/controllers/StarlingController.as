package maddashrobo.controllers 
{
	import entityboost.Entity;
	import entityboost.IController;
	import maddashrobo.Game;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class StarlingController implements IController
	{
		public var view:MovieClip;
		
		public function StarlingController(assetID:String):void {
			
		}
		/* INTERFACE entityboost.IController */
		public function onUpdate(time:Number):void 
		{
			
		}
		
		public function onSetup(entity:Entity):void 
		{ 
			// todo
			//Game.view.addChild(view = new MovieClip(null));
		}
		
		public function onDestroy():void 
		{
			Game.view.removeChild(view);
		}
	}

}