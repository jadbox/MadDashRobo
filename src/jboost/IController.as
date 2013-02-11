package jboost 
{
	import maddashrobo.Messages.IMessage;
	
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public interface IController 
	{
		function onUpdate(time:Number, messageVec:Vector.<IMessage>):void;
		function onSetup(entity:Object):void;
		function onDestroy():void;
		function getMessageListeners():Vector.<String>;
	}
	
}