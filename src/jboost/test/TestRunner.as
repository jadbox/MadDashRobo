package jboost.test 
{
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class TestRunner 
	{
		private var testsClasses:Array = [];
		private var testsLength:int=0;
		private var errors:int;
		private var lastCase:CaseTest;
		
		public function TestRunner(testsClasses:Array) 
		{
			this.testsClasses = testsClasses;
			testsLength = testsClasses.length;
		}
		public function run():void {
			if (lastCase) errors += lastCase.errors;
			if (testsClasses.length == 0) {
				trace("Unit Tests completed with " + testsLength + " CaseTests. Test Fails: "+errors);
				return;
			}
			var Test:Class = testsClasses.pop();
			lastCase = new Test() as CaseTest;
			lastCase.run(run);
		}
	}

}