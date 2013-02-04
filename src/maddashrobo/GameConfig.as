package maddashrobo 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import maddashrobo.controllers.BackgroundController;
	import starling.display.Sprite;
	import jboost.Entity;
	import jboost.test.TestRunner;
	import maddashrobo.controllers.NapeCore;
	import maddashrobo.factories.*;
	import maddashrobo.tests.TestLoading;
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class GameConfig
	{
		public static function configure(game:Game):void {
			
			var heroLayer:Sprite = game.addLayer("hero");
			var worldLayer:Sprite = game.addLayer("world");
			
			game.addController(new BackgroundController(worldLayer));
			
			game.addController(new NapeCore()); // add core physics system
			
			game.addFactory(new EnemyFactory(worldLayer)); //replace EntityFactory with specific types
			game.addFactory(new HeroFactory(heroLayer));
			
			var hero:Entity = game.make("hero");
			hero.x = 0;
			hero.y = 0;
			
			var enemy:Entity = game.make("enemy");
			enemy.x = 400;
			enemy.y = Math.random() * 500;
			
			for (var i:int = 0; i < 20; i++ )
			{
				var enemy2:Entity = game.make("enemy");
				enemy2.x = 250;
				enemy2.y = 450 * Math.random();
			}
			
			
			var enemyTimer:Timer = new Timer(500);
			enemyTimer.addEventListener(TimerEvent.TIMER, function():void {
				var en:Entity = game.make("enemy");
				en.x = 400;
				en.y = Math.random() * 500;
			});
			enemyTimer.start();
			var run:TestRunner = new TestRunner(new Array(TestLoading));
			run.run();
		}
	}

}