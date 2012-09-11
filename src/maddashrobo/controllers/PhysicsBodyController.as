package maddashrobo.controllers 
{
	import jboost.Entity;
	import jboost.IController;
	import nape.phys.Body;
	import nape.space.Space;
	
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class PhysicsBodyController implements IController 
	{
		private static space:Space; // might get moved to some centrol location
		
		private var body:Body;
		
		public function PhysicsController() 
		{
			
		}
		
		/* INTERFACE jboost.IController */
		
		public function onUpdate(time:Number):void 
		{
			
		}
		
		public function onSetup(entity:Entity):void 
		{
			
		}
		
		public function onDestroy():void 
		{
			
		}
		
	}

}