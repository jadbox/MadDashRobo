package maddashrobo.controllers 
{
	import jboost.IController;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BackgroundController implements IController 
	{
		private var backgroundLayer:Sprite;
		
		public function BackgroundController(layer:Sprite) 
		{
			if (null != layer) backgroundLayer = layer;
		}
		
		/* INTERFACE jboost.IController */
		
		public function onUpdate(time:Number):void 
		{
			//backgroundLayer.x -= 2;
		}
		
		public function onSetup(entity:Object):void 
		{
			
		}
		
		public function onDestroy():void 
		{
			
		}
		
	}

}