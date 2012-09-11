package maddashrobo 
{
	import jboost.Entity;
	import jboost.EntityCollection;
	import jboost.IController;
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
		public static var entities:EntityCollection;
		
		private var started:Boolean;
		private var mLastFrameTimestamp:Number;
		private const factories:Object = { };
		private const _controllers:Array = new Array();
		
		public function Game() 
		{
				entities = new EntityCollection();
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
			return entities.add( AbstractEntityFactory(factories[factoryType]).make() );
		}
		
		public function start():void {
			started = true;
		}
		
		public function stop():void {
			started = false;
		}
		
		public function advanceTime(time:Number):void {
			if (!started) return;
			entities.update(time);
		}
	}

}