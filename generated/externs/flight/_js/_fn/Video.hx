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
	@:native("getVideoChannelStateString")
	public static function getVideoChannelStateString(value:Dynamic):String;
	@:native("getVideoResourceDuration")
	public static function getVideoResourceDuration(hostVideo:flight._js.HostVideoCapability, resource:flight._js.VideoResource):Float;
	@:native("getVideoResourceHeight")
	public static function getVideoResourceHeight(hostVideo:flight._js.HostVideoCapability, resource:flight._js.VideoResource):Float;
	@:native("getVideoResourceLoadReadinessString")
	public static function getVideoResourceLoadReadinessString(value:Dynamic):String;
	@:native("getVideoResourceWidth")
	public static function getVideoResourceWidth(hostVideo:flight._js.HostVideoCapability, resource:flight._js.VideoResource):Float;
	@:native("hasVideoResourceElement")
	public static function hasVideoResourceElement(resource:flight._js.VideoResource):Bool;
	@:native("isVideoResourceEmpty")
	public static function isVideoResourceEmpty(hostVideo:flight._js.HostVideoCapability, resource:flight._js.VideoResource):Bool;
	@:native("isVideoResourceReady")
	public static function isVideoResourceReady(hostVideo:flight._js.HostVideoCapability, resource:flight._js.VideoResource):Bool;
	@:native("parseVideoChannelState")
	public static function parseVideoChannelState(value:String):Null<Dynamic>;
	@:native("parseVideoResourceLoadReadiness")
	public static function parseVideoResourceLoadReadiness(value:String):Null<Dynamic>;
	@:native("createVideoTexture")
	public static function createVideoTexture(hostVideo:flight._js.HostVideoCapability, source:flight._js.VideoResource, opts:Null<flight._js.CreateTextureCommonOptions>):flight._js.Texture2D;
	@:native("advanceVideoTexture")
	public static function advanceVideoTextureTexture(hostVideo:flight._js.HostVideoCapability, texture:flight._js.Texture):Int;
	@:native("cloneVideoTexture")
	public static function cloneVideoTextureTexture(source:flight._js.Texture):flight._js.Texture;
	@:native("copyVideoTexture")
	public static function copyVideoTextureTextureTexture(out:flight._js.Texture, source:flight._js.Texture):Void;
	@:native("destroyVideoTexture")
	public static function destroyVideoTexture(texture:flight._js.Texture2D):Void;
	@:native("getVideoTextureHeight")
	public static function getVideoTextureHeightTexture(hostVideo:flight._js.HostVideoCapability, texture:flight._js.Texture):Float;
	@:native("getVideoTextureInverseUvMatrix")
	public static function getVideoTextureInverseUvMatrixTexture(out:flight._js.Matrix3, texture:flight._js.Texture):Void;
	@:native("getVideoTextureUvMatrix")
	public static function getVideoTextureUvMatrixTexture(out:flight._js.Matrix3, texture:flight._js.Texture):Void;
	@:native("getVideoTextureWidth")
	public static function getVideoTextureWidthTexture(hostVideo:flight._js.HostVideoCapability, texture:flight._js.Texture):Float;
	@:native("isVideoTextureFrameReady")
	public static function isVideoTextureFrameReadyTexture(hostVideo:flight._js.HostVideoCapability, texture:flight._js.Texture):Bool;
	@:native("resetVideoTextureFrame")
	public static function resetVideoTextureFrameTexture(texture:flight._js.Texture):Void;
	@:native("setVideoTextureSource")
	public static function setVideoTextureSourceTexture(hostVideo:flight._js.HostVideoCapability, texture:flight._js.Texture, source:flight._js.VideoResource):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeVideoResource(ptr:flight._js.VideoResource):Void {}
}
