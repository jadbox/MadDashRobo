package maddashrobo.factories 
{
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class HeroFactory extends AbstractEntityFactory 
	{
		
		public function HeroFactory() 
		{
			
		}
		public override function get type():String {
			return "hero";
		}
	}

}