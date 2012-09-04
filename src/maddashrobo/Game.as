package maddashrobo 
{
	import entityboost.Indexer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class Game
	{
		public static var VIEW:Sprite;
		
		private var indexer:Indexer;
		private var started:Boolean;
		private var mLastFrameTimestamp:Number;
		
		public function Game() 
		{
				indexer = new Indexer();
				mLastFrameTimestamp = 0;
		}
		
		public function start():void {
			started = true;
		}
		
		public function stop():void {
			started = false;
		}
		
		public function onFrame(e:Event):void {
			var now:Number = getTimer() / 1000.0;
            var passedTime:Number = now - mLastFrameTimestamp;
            mLastFrameTimestamp = now;
			if (!started) return;
			indexer.update(passedTime);
		}
	}

}