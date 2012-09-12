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
			super("LoadingTest", 
				{simpleTest:simpleTest, xmlLoadTest:xmlLoadTest, imageLoadTest:imageLoadTest}
			);
		}
		
		private function simpleTest(cb:Function):void {
			assertTrue("test assert", true == true);
			cb(); // completed
		}
		
		private function xmlLoadTest(cb:Function):void {
			LoaderUtil.getXML("test.xml", function(xml:XML):void {
				assertNNull("xml is null", xml);
				assertTrue("node eval", xml.book[0].toString() == "abc123");
				cb();
			});
		}
		
		private function imageLoadTest(cb:Function):void {
			LoaderUtil.getImage("touch_marker.png", 
				function(starlImg:Image):void
				{
					assertNNull("oopsy daisies", starlImg);
					trace("got starlImg: " + starlImg );
					Game.view.addChild(starlImg);
					cb();
				}
			);
		}
	}

}