package maddashrobo.factories 
{
	import entityboost.Entity;
	import entityboost.IController;
	import maddashrobo.controllers.StarlingController;
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class HeroFactory extends AbstractEntityFactory 
	{
		
		public function HeroFactory() 
		{
			
		}
		protected override function makeEntity():Entity {
			return new Entity();
		}
		protected override function makeControllers():Array {
			return [];
		}
		protected override function makeView():IController {
			return new StarlingController("placeholder");;
		}
		public override function get type():String {
			return "hero";
		}
	}

}