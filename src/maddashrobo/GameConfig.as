package maddashrobo 
{
	import entityboost.Entity;
	import maddashrobo.factories.*;
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class GameConfig
	{
		public static function configure(game:Game):void {
			game.addFactory(new EnemyFactory()); //replace EntityFactory with specific types
			game.addFactory(new HeroFactory());
			
			var hero:Entity = game.make("hero");
			hero.x = 0;
			hero.y = 0;
			
			var enemy:Entity = game.make("enemy");
			enemy.x = 100;
			enemy.y = 0;
		}
	}

}