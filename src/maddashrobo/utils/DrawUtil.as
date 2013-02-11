package maddashrobo.utils 
{
	import flash.geom.Rectangle;
	import starling.display.Image;
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author ...
	 */
	public class DrawUtil 
	{
		
		public static function DrawRect(rect:Rectangle):Image
		{
			var nBox:Sprite = new Sprite();
			nBox.graphics.beginFill(0xff00ff, .5);
			nBox.graphics.drawRect(rect.x, rect.y, rect.width, rect.height);
			nBox.graphics.endFill(); // -- I do this out of habit. O.O

			var nBMP_D:BitmapData = new BitmapData(rect.width, rect.height, true, 0x00000000);
			nBMP_D.draw(nBox); // -- this gives you the BitmapData

			var nTxtr:Texture = Texture.fromBitmapData(nBMP_D, false, false);
			var nImg:Image = new Image(nTxtr);
			
			return nImg;
		}
		
	}

}