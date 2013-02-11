package maddashrobo.Messages 
{
	import nape.geom.Vec2;
	/**
	 * ...
	 * @author ...
	 */
	public class VelocityMessage implements IMessage 
	{
		var velocity:Vec2;
		public function VelocityMessage(velocity:Vec2) 
		{
			this.velocity = velocity;
		}
		
		/* INTERFACE maddashrobo.Messages.IMessage */
		
		public function getType():String 
		{
			return "Velocity";
		}
		
		public function getVelocity():Vec2
		{
			return velocity;
		}
		
	}

}