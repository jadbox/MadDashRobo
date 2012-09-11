package jboost.test 
{
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class CaseTest 
	{
		public var name:String;
		public var before:Function;
		public var after:Function;
		public var run:Function;
		
		public function CaseTest(name:String) 
		{
			trace("Running CaseTest: " +name);
			this.name = name;
		}
		public function assertTrue(errmsg:String, val:Object):void {
			if (val == false) throw new Error(errmsg);
		}
		public function assertNNull(errmsg:String, val:Object):void {
			if (val == null) throw new Error(errmsg);
		}
		public function assertNull(errmsg:String, val:Object):void {
			if (val != null) throw new Error(errmsg);
		}
	}

}