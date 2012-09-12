package jboost.test 
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class CaseTest 
	{
		private var timer:Timer;
		private var testsFuncs:Array=[];
		private var testsFuncNames:Array=[];
		
		private var currentFunc:String;
		public var name:String;
		private var onComplete:Function;
		private var length:int;
		internal var errors:int=0;
		
		public function CaseTest(name:String, testsFuncsObject:Object, timeout:Number = 1000) 
		{
			trace("Running CaseTest: " +name);
			this.name = name;
			for(var key:String in testsFuncsObject) {
				testsFuncs.push(testsFuncsObject[key]);
				testsFuncNames.push(key);
			}
			
			length = testsFuncs.length;
			timer = new Timer(timeout);
			timer.addEventListener(TimerEvent.TIMER, asssertTimeout);
		}
		
		public function run(onComplete:Function = null):void {
			this.onComplete = onComplete || this.onComplete;
			timer.stop(); timer.reset();
			if (testsFuncs.length == 0) {
				trace("Completed CaseTest: " + name + " with " + length + " tests. Fails: "+errors);
				this.onComplete();
				return;
			}
			timer.start();
			var func:Function = testsFuncs.pop(); 
			currentFunc = testsFuncNames.pop();
			func(run);
		}
		
		private function asssertTimeout(e:TimerEvent):void {
			//throw new Error("Timed Out on "+name+"::"+currentFunc);
			trace("!!! Timed Out on " + name + "::" + currentFunc);
			errors++;
			run();
		}
		public function assertTrue(errmsg:String, val:Object):void {
			if (val == false) {
				trace("!!! " + name + "::" + currentFunc + " "+errmsg);
				errors++;
			}
			
		}
		public function assertNNull(errmsg:String, val:Object):void {
			if (val == null) {
				trace("!!! " + name + "::" + currentFunc + " "+errmsg);
				errors++;
			}
			
		}
		public function assertNull(errmsg:String, val:Object):void {
			if (val != null) {
				trace("!!! " + name + "::" + currentFunc + " "+errmsg);
				errors++;
			}
		}
	}

}