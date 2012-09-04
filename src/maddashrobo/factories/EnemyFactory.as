package maddashrobo.factories 
{
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class EnemyFactory extends AbstractEntityFactory 
	{
		
		public function EnemyFactory() 
		{
			
		}
		public override function get type():String {
			return "enemy";
		}
	}

}