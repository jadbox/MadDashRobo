package jboost.test 
{
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class TestRunner 
	{
		private var testsClasses:Array = [];
		
		public function TestRunner(testsClasses:Array) 
		{
			this.testsClasses = testsClasses;
			for each(var Test:Class in testsClasses) {
				var test:CaseTest = new Test() as CaseTest;
				trace("Completed CaseTest: " + test.name);
			}
		}		
	}

}