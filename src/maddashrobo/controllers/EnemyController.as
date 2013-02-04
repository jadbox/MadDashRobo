package maddashrobo.controllers 
{
	import flash.utils.Dictionary;
	import jboost.Entity;
	import jboost.IController;
	import flash.events.Event;
	import starling.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import maddashrobo.Game;
	
	/**
	 * ...
	 * @author ...
	 */
	public class EnemyController implements IController 
	{
		private var entity:Entity;
		
		public function EnemyController() 
		{
			
		}
		
		public function onUpdate(time:Number):void
		{
			entity.x -= 2;
		}
		public function onSetup(entity:Object):void
		{
			this.entity = entity as Entity;
		}
		
		public function onDestroy():void
		{
			
		}
		
	}

}