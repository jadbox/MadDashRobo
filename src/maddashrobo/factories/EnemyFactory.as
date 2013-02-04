package maddashrobo.factories 
{
	import jboost.Entity;
	import jboost.IController;
	import maddashrobo.controllers.EnemyController;
	import maddashrobo.controllers.SpriteController;
	import maddashrobo.Assets;
	import maddashrobo.Game;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class EnemyFactory extends AbstractEntityFactory 
	{
		private var enemyLayer:Sprite;
		
		public function EnemyFactory(layer:Sprite) 
		{
			if (null != layer) enemyLayer = layer;
			else enemyLayer = Game.view;
		}
		protected override function makeEntity():Entity {
			return new Entity();
		}
		protected override function makeControllers():Array {
			return [new EnemyController()];
		}
		protected override function makeView():IController {
			return new SpriteController(enemyLayer, Assets.PollenTexture);
		} 
		public override function get type():String {
			return "enemy";
		}
	}

}