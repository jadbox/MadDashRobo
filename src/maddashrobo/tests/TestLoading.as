package maddashrobo.tests 
{
	import jboost.LoaderUtil;
	import jboost.test.CaseTest;
	import starling.display.Image;
	import maddashrobo.Game;
	
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class TestLoading extends CaseTest 
	{
		
		public function TestLoading() 
		{
			super("LoadingTest");
			/*LoaderUtil.getXML("test.xml", function(xml:XML):void {
				assertNNull("xml is null", xml);
				assertTrue("node eval", xml.book[0].toString() == "abc123");
			});*/
			
			LoaderUtil.getImage("touch_marker.png", 
				function(starlImg:Image):void
				{
					assertNNull("oopsy daisies", starlImg);
					trace("got starlImg: " + starlImg );
					Game.view.addChild(starlImg);
				}
			);
		}
		
	}

}