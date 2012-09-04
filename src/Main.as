package 
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import maddashrobo.Game;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class Main extends Sprite 
	{
		private var game:Game;
		private var mStarling:Starling;
		
		[SWF(width="800", height="600", frameRate="60", backgroundColor="#111111")]
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init); 
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			stage.scaleMode = StageScaleMode.NO_SCALE; 
			stage.align = StageAlign.TOP_LEFT;
			mStarling = new Starling(Game, stage, new Rectangle(0,0,800,600));
			
			mStarling.antiAliasing = 2; 
			mStarling.start();
		}
		
	}
	
}