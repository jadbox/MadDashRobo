package maddashrobo.controllers 
{
	import jboost.IController;
	import starling.display.Image;
	import starling.display.Sprite;
	import maddashrobo.Assets;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BackgroundController implements IController 
	{
		private var backgroundLayer:Sprite;
		private var backgroundSlices:Vector.<Image>;
		
		public function BackgroundController(layer:Sprite) 
		{
			if (null != layer) backgroundLayer = layer;
		}
		
		/* INTERFACE jboost.IController */
		
		public function onUpdate(time:Number):void 
		{
			//trace("updaten");
			//backgroundLayer.x -= 2;
			for each(var img:Image in backgroundSlices)
			{
				
				if (img.x <= -img.width)
				{
					img.x = (backgroundSlices.length - 1) * img.width;
				}
				img.x -= 5;
			}
		}
		
		public function onSetup(entity:Object):void 
		{
			backgroundSlices = new Vector.<Image>();
			var xPos:Number = 0;
			for (var i:int = 0; i < 3; i++ )
			{
				var bgImg:Image = Assets.getImage(Assets.BgTexture);
				this.backgroundLayer.addChild(bgImg);
				bgImg.x = xPos;
				xPos += bgImg.width;
				backgroundSlices.push(bgImg);
			}
		}
		
		public function onDestroy():void 
		{
			
		}
		
	}

}