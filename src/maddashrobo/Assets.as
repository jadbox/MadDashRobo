package maddashrobo 
{
	import starling.display.Image;
	import starling.textures.TextureAtlas;
	import starling.textures.Texture;
	import flash.utils.Dictionary;
	import flash.display.Bitmap;
	import starling.display.Sprite;
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author ...
	 */
	public class Assets 
	{
		
		/**
		 * Texture Atlas 
		 */
		[Embed(source="mySpritesheet.png")]
		public static const AtlasTextureGame:Class;
		
		[Embed(source="mySpritesheet.xml", mimeType="application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		//PoinsonMoth
		[Embed(source = "../../assets/graphics/mothsheet.xml", mimeType="application/octet-stream")]
		public static const MothTextureXml:Class;
		
		[Embed(source = "../../assets/graphics/mothsheet.png")]
		public static const MothTexture:Class;
		
		[Embed(source = "../../assets/graphics/legguy.xml", mimeType="application/octet-stream")]
		public static const LegGuyTextureXml:Class;
		
		[Embed(source = "../../assets/graphics/legguy.png")]
		public static const LegGuyTexture:Class;
		
		[Embed(source = "../../assets/graphics/pollen.png")]
		public static const PollenTexture:Class;
		
		[Embed(source = "../../assets/graphics/bgLayer1.jpg")]
		public static const BgTexture:Class;
		
		/**
		 * Texture Cache 
		 */
		private static var gameTextures:Dictionary = new Dictionary();
		private static var gameTextureAtlas:TextureAtlas;
		
		public static function getTextureAtlas(textureID:String):TextureAtlas
		{
			//textureID = "MothTexture";
			if (gameTextureAtlas == null)
			{
				var moth:XML = new MothTextureXml() as XML;
				var texture:Texture = getTexture(textureID);
				//var SheetXml:Class = getDefinitionByName(textureID + "Xml") as Class;
				var xml:XML = new XML(new Assets[textureID + "Xml"]());
				gameTextureAtlas=new TextureAtlas(texture, xml);
			}
			return gameTextureAtlas;
		}
		
		/**
		 * Returns a texture from this class based on a string key.
		 * 
		 * @param name A key that matches a static constant of Bitmap type.
		 * @return a starling texture.
		 */
		public static function getTexture(name:String):Texture
		{
			if (gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name]=Texture.fromBitmap(bitmap);
			}
			
			return gameTextures[name];
		}
		
		public static function getImage(imageClass:Class):Image
		{
			if (!imageClass is Class) return null;
			var texture:Texture = Texture.fromBitmap(new imageClass());
			return new Image(texture);
		}
		
		public function Assets() 
		{
			
		}
		
	}

}