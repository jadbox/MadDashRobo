package maddashrobo.factories 
{
	import starling.display.Sprite;
	import jboost.Entity;
	import jboost.IController;
	import maddashrobo.controllers.HeroController;
	import maddashrobo.controllers.MovieClipController;
	import maddashrobo.Game;
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class HeroFactory extends AbstractEntityFactory 
	{
		private var heroLayer:Sprite;
		
		public function HeroFactory(layer:Sprite) 
		{
			if (null != layer) heroLayer = layer;
			else heroLayer = Game.view;
		}
		protected override function makeEntity():Entity {
			return new Entity();
		}
		protected override function makeControllers():Array {
			return [new HeroController()];
		}
		protected override function makeView():IController {
			return new MovieClipController(heroLayer, "legs", "LegGuyTexture");
		}
		public override function get type():String {
			return "hero";
		}
	}

}