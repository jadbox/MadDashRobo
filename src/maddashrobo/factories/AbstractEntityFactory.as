package maddashrobo.factories 
{
	import entityboost.Entity;
	import entityboost.IController;
	
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class AbstractEntityFactory 
	{
		public final function make():Entity {
			var entity:Entity = makeEntity();
			var cs:Array = makeControllers();
			
			entity.addController(makeView());
			for each(var c:IController in cs) entity.addController(c);
			return entity;
		}
		protected function makeEntity():Entity {
			return new Entity();
		}
		protected function makeControllers():Array {
			return [];
		}
		protected function makeView():IController {
			throw new Error("must override");
			return null;
		}
		public function get type():String {
			throw new Error("must override");
			return "";
		}
	}
	
}