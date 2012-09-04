package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import maddashrobo.Game;
	 
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class Main extends Sprite 
	{
		private var game:Game;

		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init); 
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			game = new Game();
			game.start();
			addEventListener(Event.ENTER_FRAME, onFrame);
			addChild(Game.VIEW = new Sprite());
		}
		
		private function onFrame(e:Event):void {
			game.onFrame(e);
		}
		
	}
	
}