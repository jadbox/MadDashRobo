package  
{
	import flash.display.Sprite;
	import maddashrobo.tests.TestLoading;
	import jboost.test.TestRunner;
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class UnitTests extends Sprite
	{
		[SWF(width="800", height="600", frameRate="60", backgroundColor="#111111")]
		public function UnitTests() 
		{
			var runner:TestRunner = new TestRunner([TestLoading]);
			runner.run();
			return;
		}
		
	}

}