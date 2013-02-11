package maddashrobo.controllers 
{
	import flash.geom.Rectangle;
	import jboost.Entity;
	import jboost.IController;
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.Material;
	import nape.shape.Circle;
	import nape.shape.Polygon;
	import nape.space.Space;
	import nape.phys.BodyType;
	import starling.display.Sprite;
	import starling.display.Image;
	import maddashrobo.utils.DrawUtil;
	import maddashrobo.Game;
	
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class PhysicsBodyController implements IController 
	{
		private var physSpace:Space;
		private var entity:Entity;
		
		private var body:Body;
		
		private var debugSprite:Sprite;
		
		public function PhysicsBodyController() 
		{
			this.physSpace = NapeCore.space;
		}
		
		/* INTERFACE jboost.IController */
		
		public function onUpdate(time:Number):void 
		{
			//body.applyWorldForce(new Vec2(55, 0), new Vec2(55, 0));
			//body.applyImpulse(new Vec2(10,10))
			//body.force = new Vec2(55, 55);
			//body.position.x += 2;
			//body.applyLocalImpulse(new Vec2(10, 10));
			//body.applyRelativeImpulse(new Vec2(10, 10));
			//body.applyWorldImpulse(new Vec2(10, 10));
			body.velocity.x = 30;
			body.rotation = 0;
			//body.velocity(new Vec2(10,10));
			
			entity.x = body.position.x;
			entity.y = body.position.y;
			entity.rotation = body.rotation;
			
			debugSprite.x = body.position.x;
			debugSprite.y = body.position.y;
			debugSprite.rotation = body.rotation;
		}
		
		public function onSetup(entity:Object):void 
		{
			this.entity = entity as Entity;
			body = new Body(BodyType.DYNAMIC, new Vec2(entity.x, entity.y));
			body.shapes.add(new Polygon(Polygon.box(70, 200), new Material(.5, 2, 25, 13)));
			body.space = physSpace;
			
			debugSprite = new Sprite();
			debugSprite.addChild(DrawUtil.DrawRect(new Rectangle(0, 0, 70, 200)));
			Game.view.addChild(debugSprite);
		}
		
		public function onDestroy():void 
		{
			
		}
		
	}

}