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
	public class HeroController implements IController 
	{
		private var entity:Entity;
		private var keyDict:Dictionary;
		
		public function HeroController() 
		{
			
		}
		
		public function onUpdate(time:Number):void
		{
			if (getKeyDown(Keyboard.LEFT) || getKeyDown(Keyboard.A))
			{
				entity.x -= 8;
			}
			if (getKeyDown(Keyboard.RIGHT) || getKeyDown(Keyboard.D))
			{
				entity.x += 8;
			}
			if (getKeyDown(Keyboard.UP) || getKeyDown(Keyboard.W))
			{
				entity.y -= 8;
			}
			if (getKeyDown(Keyboard.DOWN) || getKeyDown(Keyboard.S))
			{
				entity.y += 8;
			}
		}
		public function onSetup(entity:Object):void
		{
			this.entity = entity as Entity;
			this.entity.rotation = Math.PI / 2;
			this.entity.scale = .5;
			keyDict = new Dictionary();
			Game.view.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			Game.view.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
		
		private function getKeyDown(keycode:uint):Boolean
		{
			//trace("getkey");
			return (keyDict[keycode] != undefined && keyDict[keycode] == true);
		}
		
		private function keyDown(e:KeyboardEvent):void
		{
			trace("key down: " + e.keyCode);
			keyDict[e.keyCode] = true;
		}
		
		private function keyUp(e:KeyboardEvent):void
		{
			keyDict[e.keyCode] = false;
		}
		
		public function onDestroy():void
		{
			
		}
		
	}

}