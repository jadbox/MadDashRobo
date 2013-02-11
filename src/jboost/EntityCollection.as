package jboost 
{
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	import maddashrobo.Messages.IMessage;
	 
	public class EntityCollection 
	{
		
		private var _head:Entity;
		private var elements:int;
		
		public function EntityCollection() 
		{
			elements = 0;
		}
		
		public function get length():int {
			return elements;
		}
		
		public function get head():Entity {
			return head;
		}
		
		public function add(entity:Entity):Entity {
			entity._next = _head;
			if(_head) _head._prev = entity;
			elements++;
			return _head = entity;
		}
		
		public function remove(entity:Entity):void {
			if (entity._prev == null && entity._next == null) throw new Error("Entity was not added.");
			if (entity._prev) entity._prev._next = entity._next;
			if (entity._next) entity._next._prev = entity._prev;
			entity._next = entity._prev = null;
			if (entity == _head) _head = null;
			elements--;
		}
		
		public function update(time:Number):void {
			var i:Entity = _head;
			var c:IController;
			while (i) {
				for (var n:int = 0; n < i._controllers.length; n++) {
					var messageVec:Vector.<IMessage> = new Vector.<IMessage>();
					for each ( var str:String in c.getMessageListeners()) {
						if (i._messages[str] != null) messageVec.push(i._messages[str]);
					}
					//IController(i._controllers[n]).
					IController(i._controllers[n]).onUpdate(time, messageVec);
				}
				i = i._next;
			}
		}
	}

}