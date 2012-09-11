package jboost
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Jonathan Dunlap
	 */
	public class LoaderUtil
	{
		private static var loaders:Dictionary = new Dictionary();
		private static var atlases:Dictionary = new Dictionary();
		
		public function LoaderUtil() 
		{
			throw new Error("cannot instance");
		}
		
		public static function getAsset(url:String, onComplete:Function):void {
			var unRequested:Boolean = loaders[url] == null;
			var loader:Loader = loaders[url]?loaders[url]:loaders[url] = new Loader();
			var loaded:Boolean = loader.contentLoaderInfo.bytesLoaded >= loader.contentLoaderInfo.bytesTotal && loader.content!=null;
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
		
		public static function getXML(url:String, onComplete:Function):void {
			var unRequested:Boolean = loaders[url] == null;
			var loader:URLLoader = loaders[url]?loaders[url]:loaders[url] = new URLLoader();
			var loaded:Boolean = loader.data;
			if (loaded) {
				onComplete(XML(loader.data));
				return;
			}
			if (unRequested) loader.load(new URLRequest(url));
			
			loader.addEventListener(Event.COMPLETE, function(e:Event):void {
				loader.removeEventListener(Event.COMPLETE, arguments.callee);
				onComplete(XML(loader.data));
			});
		}
	}

}