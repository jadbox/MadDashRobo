package jboost 
{
	
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public interface IController 
	{
		function onUpdate(time:Number):void;
		function onSetup(entity:Object):void;
		function onDestroy():void;
	}
	
}