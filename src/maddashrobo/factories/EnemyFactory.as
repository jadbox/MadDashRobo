package maddashrobo.factories 
{
	import jboost.Entity;
	import jboost.IController;
	import maddashrobo.controllers.MovieClipController;
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class EnemyFactory extends AbstractEntityFactory 
	{
		
		public function EnemyFactory() 
		{
			
		}
		protected override function makeEntity():Entity {
			return new Entity();
		}
		protected override function makeControllers():Array {
			return [];
		}
		protected override function makeView():IController {
			return new MovieClipController("placeholder");;
		} 
		public override function get type():String {
			return "enemy";
		}
	}

}