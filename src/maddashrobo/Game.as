package maddashrobo 
{
	import entityboost.Entity;
	import entityboost.IController;
	import entityboost.Indexer;
	import maddashrobo.factories.AbstractEntityFactory;
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.*;
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class Game extends Sprite implements IAnimatable
	{
		public static var view:Sprite;
		public static var indexer:Indexer;
		
		private var started:Boolean;
		private var mLastFrameTimestamp:Number;
		private const factories:Object = { };
		private const _controllers:Array = new Array();
		
		public function Game() 
		{
				indexer = new Indexer();
				mLastFrameTimestamp = 0;
				view = this;
				addEventListener(Event.ADDED_TO_STAGE, onStageAdded);
		}
		
		// Game engine-wide logic
		public function addController(controller:IController):void {
			_controllers.push(controller); 
			controller.onSetup(this);
		}
		
		public function removeController(controller:IController):void {
			_controllers.splice(_controllers.indexOf(controller), 1);
			controller.onDestroy();
		}
		
		private function onStageAdded(e:Event):void {
			GameConfig.configure(this);
			removeEventListener(Event.ADDED_TO_STAGE, onStageAdded);
			Starling.juggler.add(this);
			start();
		}
		
		public function addFactory(f:AbstractEntityFactory):void {
			factories[f.type] = f;
		}
		
		public function make(factoryType:String):Entity {
			return indexer.add( AbstractEntityFactory(factories[factoryType]).make() );
		}
		
		public function start():void {
			started = true;
		}
		
		public function stop():void {
			started = false;
		}
		
		public function advanceTime(time:Number):void {
			if (!started) return;
			indexer.update(time);
		}
	}

}