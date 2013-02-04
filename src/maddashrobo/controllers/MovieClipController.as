package maddashrobo.controllers 
{
	import jboost.Entity;
	import jboost.IController;
	import maddashrobo.Game;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import maddashrobo.Assets;
	import starling.core.Starling;
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class MovieClipController implements IController
	{
		public var view:MovieClip;
		private var entity:Entity;
		private var assetID:String;
		private var libID:String;
		private var container:Sprite;
		
		public function MovieClipController(container:Sprite, assetID:String, libID:String = "MothTexture" ):void {
			this.assetID = assetID;
			this.libID = libID;
			this.container = container;
		}
		/* INTERFACE jboost.IController */
		public function onUpdate(time:Number):void 
		{
			view.x = entity.x;
			view.y = entity.y;
			view.rotation = entity.rotation;
			view.scaleX = entity.scale;
			view.scaleY = entity.scale;
		}
		
		public function onSetup(entity:Object):void 
		{ 
			this.entity = entity as Entity;
			view = new MovieClip(Assets.getTextureAtlas(libID).getTextures(assetID), 20);
			view.x = Math.ceil(-view.width/2);
			view.y = Math.ceil(-view.height/2);
			starling.core.Starling.juggler.add(view);
			container.addChild(view);
			//Game.view.addChild(view = new MovieClip(null));
		}
		
		public function onDestroy():void 
		{
			Game.view.removeChild(view);
		}
	}

}