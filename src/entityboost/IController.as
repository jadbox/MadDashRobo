package entityboost 
{
	
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public interface IController 
	{
		function onUpdate(time:Number):void;
		function onSetup(entity:Entity):void;
		function onDestroy():void;
	}
	
}