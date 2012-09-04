package entityboost 
{
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class Entity 
	{
		//keep values simple
		public var name:String;
		public var type:int;
		public var state:int;
		
		// world location
		public var x:Number; 
		public var y:Number;
		
		//internal use only
		internal var _next:Entity;
		internal var _prev:Entity;
		internal const _controllers:Array = new Array();
		
		public function Entity() 
		{
			
		}
		
		public function addController(controller:IController):void {
			_controllers.push(controller);
			controller.onSetup(this);
		}
		
		public function removeController(controller:IController):void {
			_controllers.splice(_controllers.indexOf(controller), 1);
			controller.onDestroy();
		}
	}

}