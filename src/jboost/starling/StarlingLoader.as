package jboost.starling 
{
	import flash.display.Bitmap;
	import jboost.LoaderUtil;
	import starling.textures.Texture;	
	import starling.display.Image;
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class StarlingLoader 
	{
		
		public static function getImage(url:String, onComplete:Function):void
		{
			LoaderUtil.getAsset(url, function(content:*):void
				{
					var imageBitmap:Bitmap = content as Bitmap;
					if (imageBitmap == null) throw new Error("Bitmap is null");
					onComplete(new Image(Texture.fromBitmap(imageBitmap)));
				}
			);
		}
		
	}

}