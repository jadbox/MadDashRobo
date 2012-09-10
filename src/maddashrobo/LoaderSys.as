package  
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class LoaderSys 
	{
		private static var loaders:Dictionary = new Dictionary();
		
		public function LoaderSys() 
		{
			
		}
		
		public static function getAsset(url:String, onComplete:Function):void {
			var unRequested:Boolean = loaders[url] == null;
			var loader:Loader = loaders[url]?loaders[url]:loaders[url] = new Loader();
			var loaded:Boolean = loader.contentLoaderInfo.bytesLoaded >= loader.contentLoaderInfo.bytesTotal;
			if (loaded) {
				onComplete(loader.content);
				return;
			}
			if (unRequested) loader.load(new URLRequest(url));
			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e:Event):void {
				loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, arguments.callee);
				onComplete(loader.content);
			});
		}
	}

}