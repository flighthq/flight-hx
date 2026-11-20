package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/loader")
extern class Loader {
  public static function cancelResourceLoad(loader:flight.esm.types.loader.Types.ResourceLoader):Void;
  public static function createResourceLoader(?options:Null<flight.esm.types.loader.Types.ResourceLoaderOptions>):flight.esm.types.loader.Types.ResourceLoader;
  public static function disposeResourceLoader(loader:flight.esm.types.loader.Types.ResourceLoader):Void;
  public static function enableResourceLoaderItemSignals(loader:flight.esm.types.loader.Types.ResourceLoader):flight.esm.types.loader.Types.ResourceLoaderItemSignals;
  public static function getResourceLoadBytes(loader:flight.esm.types.loader.Types.ResourceLoader):flight.esm.types.loader.Types.ResourceLoadBytes;
  public static function getResourceLoadCounts(loader:flight.esm.types.loader.Types.ResourceLoader):flight.esm.types.loader.Types.ResourceLoadCounts;
  public static function getResourceLoadItemStatus(loader:flight.esm.types.loader.Types.ResourceLoader, key:String):flight.esm.types.loader.Types.ResourceLoadItemStatus;
  public static function getResourceLoadProgress(loader:flight.esm.types.loader.Types.ResourceLoader, ?group:Null<String>):Float;
  public static function loadBytes(hostNet:flight.esm.types.net.Types.HostNetCapability, url:String, ?input:Null<flight.esm.types.loader.Types.LoadOptions>):js.lib.Promise<Null<js.lib.Uint8Array>>;
  public static function loadText(hostNet:flight.esm.types.net.Types.HostNetCapability, url:String, ?input:Null<flight.esm.types.loader.Types.LoadOptions>):js.lib.Promise<Null<String>>;
  public static function pauseResourceLoad(loader:flight.esm.types.loader.Types.ResourceLoader):Void;
  public static function queueResourceLoad<T>(loader:flight.esm.types.loader.Types.ResourceLoader, item:Dynamic):flight.esm.types.loader.Types.ResourceLoadHandle<T>;
  public static function resetResourceLoader(loader:flight.esm.types.loader.Types.ResourceLoader):Void;
  public static function resumeResourceLoad(loader:flight.esm.types.loader.Types.ResourceLoader):Void;
  public static function setResourceLoadPriority(loader:flight.esm.types.loader.Types.ResourceLoader, key:String, priority:Float):Void;
  public static function setResourceLoaderConcurrency(loader:flight.esm.types.loader.Types.ResourceLoader, maxConcurrent:Float):Void;
  public static function startResourceLoad(loader:flight.esm.types.loader.Types.ResourceLoader):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
