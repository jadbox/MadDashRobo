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
	public class SpriteController implements IController
	{
		public var view:Sprite;
		private var entity:Entity;
		private var assetClass:Class;
		private var container:Sprite;
		
		public function SpriteController(container:Sprite, assetClass:Class):void {
			this.assetClass = assetClass;
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
			view = new Sprite();
			view.addChild(Assets.getImage(assetClass));
			view.x = Math.ceil(-view.width/2);
			view.y = Math.ceil(-view.height/2);
			//starling.core.Starling.juggler.add(
			container.addChild(view);
			//Game.view.addChild(view = new MovieClip(null));
		}
		
		public function onDestroy():void 
		{
			Game.view.removeChild(view);
		}
	}

}