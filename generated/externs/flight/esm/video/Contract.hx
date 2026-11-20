package flight.esm.video;

#if (js && flight_esm)
@:jsRequire("@flighthq/video/contract")
extern class Contract {
  public static function canPlayVideoType(backend:flight.esm.types.video.Types.HostVideoCapability, mimeType:String):Bool;
  public static function createVideoResource(?element:Dynamic, ?objectUrl:Null<String>, ?ownsElement:Null<Bool>):flight.esm.types.video.Types.VideoResource;
  public static function destroyVideoResource(hostVideo:flight.esm.types.video.Types.HostVideoCapability, resource:flight.esm.types.video.Types.VideoResource):Void;
  public static function detectVideoMimeType(data:Dynamic):Null<String>;
  public static function disposeVideoResource(hostVideo:flight.esm.types.video.Types.HostVideoCapability, resource:flight.esm.types.video.Types.VideoResource):Void;
  public static function getVideoResourceDuration(hostVideo:flight.esm.types.video.Types.HostVideoCapability, resource:flight.esm.types.video.Types.VideoResource):Float;
  public static function getVideoResourceHeight(hostVideo:flight.esm.types.video.Types.HostVideoCapability, resource:flight.esm.types.video.Types.VideoResource):Float;
  public static function getVideoResourceWidth(hostVideo:flight.esm.types.video.Types.HostVideoCapability, resource:flight.esm.types.video.Types.VideoResource):Float;
  public static function hasVideoResourceElement(resource:flight.esm.types.video.Types.VideoResource):Bool;
  public static function inferVideoMimeType(url:String):Null<String>;
  public static function initializeVideoResource(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.video.Types.VideoResource>, ?element:Dynamic, ?objectUrl:Null<String>, ?ownsElement:Null<Bool>):Void;
  public static function isVideoResourceEmpty(hostVideo:flight.esm.types.video.Types.HostVideoCapability, resource:flight.esm.types.video.Types.VideoResource):Bool;
  public static function isVideoResourceReady(hostVideo:flight.esm.types.video.Types.HostVideoCapability, resource:flight.esm.types.video.Types.VideoResource):Bool;
  public static function loadVideoResourceFromBlob(hostVideo:flight.esm.types.video.Types.HostVideoCapability, blob:js.html.Blob, ?options:Null<flight.esm.types.video.Types.VideoResourceLoadOptions>, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<flight.esm.types.video.Types.VideoResource>;
  public static function loadVideoResourceFromUrl(hostVideo:flight.esm.types.video.Types.HostVideoCapability, url:String, ?options:Null<flight.esm.types.video.Types.VideoResourceLoadOptions>, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<flight.esm.types.video.Types.VideoResource>;
  public static function loadVideoResourceFromUrls(hostVideo:flight.esm.types.video.Types.HostVideoCapability, sources:Array<flight.esm.types.video.Types.VideoResourceUrl>, ?options:Null<flight.esm.types.video.Types.VideoResourceLoadOptions>, ?signal:Null<js.html.AbortSignal>):js.lib.Promise<flight.esm.types.video.Types.VideoResource>;
  public static function selectVideoResourceUrl(backend:flight.esm.types.video.Types.HostVideoCapability, sources:Array<flight.esm.types.video.Types.VideoResourceUrl>):Null<flight.esm.types.video.Types.VideoResourceUrl>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
