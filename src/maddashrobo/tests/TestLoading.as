package maddashrobo.tests 
{
	import jboost.LoaderUtil;
	import jboost.test.CaseTest;
	
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class TestLoading extends CaseTest 
	{
		
		public function TestLoading() 
		{
			super("LoadingTest");
			LoaderUtil.getXML("test.xml", function(xml:XML):void {
				assertNNull("xml is null", xml);
				assertTrue("node eval", xml.book[0].toString() == "abc123");
			});
		}
		
	}

}