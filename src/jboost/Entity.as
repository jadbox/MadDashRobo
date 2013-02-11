package jboost 
{
	import flash.utils.Dictionary;
	import maddashrobo.Messages.IMessage;
	
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
		public var x:Number = 0; 
		public var y:Number = 0;
		public var rotation:Number = 0;
		public var scale:Number = 1;
		
		//internal use only
		internal var _next:Entity;
		internal var _prev:Entity;
		internal const _controllers:Array = new Array();
		//internal var _messages:Vector.<IMessage>;
		internal var _messages:Dictionary = new Dictionary(); //string -> Vector.<IMessage>
		
		public function Entity() 
		{
			
		}
		// Entity level game logic
		public function addController(controller:IController):void {
			_controllers.push(controller);
			controller.onSetup(this);
		}
		
		public function removeController(controller:IController):void {
			_controllers.splice(_controllers.indexOf(controller), 1);
			controller.onDestroy();
		}
		
		public function sendMessage(msg:IMessage):void
		{
			//_messages.push(msg);
			if (_messages[msg.getType()] != null)
			{
				Vector.<IMessage>(_messages[msg.getType()]).push(msg);
			}else
			{
				var messageCollection:Vector.<IMessage> = new Vector.<IMessage>();
				messageCollection.push(msg);
				_messages[msg.getType()] = messageCollection;
			}
		}
	}

}