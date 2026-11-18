package flight._js._fn;

@:jsRequire("@flighthq/video")
extern class Video {
	@:native("canPlayVideoType")
	public static function canPlayVideoType(backend:flight._js.HostVideoCapability, mimeType:String):Bool;
	@:native("inferVideoMimeType")
	public static function inferVideoMimeType(url:String):Null<String>;
	@:native("createVideoResource")
	public static function createVideoResource():flight._js.VideoResource;
	@:native("destroyVideoResource")
	public static function destroyVideoResource(hostVideo:flight._js.HostVideoCapability, resource:flight._js.VideoResource):Void;
	@:native("disposeVideoResource")
	public static function disposeVideoResource(hostVideo:flight._js.HostVideoCapability, resource:flight._js.VideoResource):Void;
	@:native("getVideoResourceDuration")
	public static function getVideoResourceDuration(hostVideo:flight._js.HostVideoCapability, resource:flight._js.VideoResource):Float;
	@:native("getVideoResourceHeight")
	public static function getVideoResourceHeight(hostVideo:flight._js.HostVideoCapability, resource:flight._js.VideoResource):Float;
	@:native("getVideoResourceWidth")
	public static function getVideoResourceWidth(hostVideo:flight._js.HostVideoCapability, resource:flight._js.VideoResource):Float;
	@:native("hasVideoResourceElement")
	public static function hasVideoResourceElement(resource:flight._js.VideoResource):Bool;
	@:native("isVideoResourceEmpty")
	public static function isVideoResourceEmpty(hostVideo:flight._js.HostVideoCapability, resource:flight._js.VideoResource):Bool;
	@:native("isVideoResourceReady")
	public static function isVideoResourceReady(hostVideo:flight._js.HostVideoCapability, resource:flight._js.VideoResource):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeVideoResource(ptr:flight._js.VideoResource):Void {}
}
