package flight._cpp._fn;

extern class Video {
	@:native("flight_can_play_video_type")
	public static function canPlayVideoType(backend:flight._cpp.HostVideoCapability, mimeType:cpp.ConstCharStar):Bool;
	@:native("flight_infer_video_mime_type")
	public static function inferVideoMimeType(url:cpp.ConstCharStar):cpp.ConstCharStar;
	@:native("flight_create_video_resource")
	public static function createVideoResource():flight._cpp.VideoResource;
	@:native("flight_destroy_video_resource")
	public static function destroyVideoResource(hostVideo:flight._cpp.HostVideoCapability, resource:flight._cpp.VideoResource):Void;
	@:native("flight_dispose_video_resource")
	public static function disposeVideoResource(hostVideo:flight._cpp.HostVideoCapability, resource:flight._cpp.VideoResource):Void;
	@:native("flight_get_video_resource_duration")
	public static function getVideoResourceDuration(hostVideo:flight._cpp.HostVideoCapability, resource:flight._cpp.VideoResource):Float;
	@:native("flight_get_video_resource_height")
	public static function getVideoResourceHeight(hostVideo:flight._cpp.HostVideoCapability, resource:flight._cpp.VideoResource):Single;
	@:native("flight_get_video_resource_width")
	public static function getVideoResourceWidth(hostVideo:flight._cpp.HostVideoCapability, resource:flight._cpp.VideoResource):Single;
	@:native("flight_has_video_resource_element")
	public static function hasVideoResourceElement(resource:flight._cpp.VideoResource):Bool;
	@:native("flight_is_video_resource_empty")
	public static function isVideoResourceEmpty(hostVideo:flight._cpp.HostVideoCapability, resource:flight._cpp.VideoResource):Bool;
	@:native("flight_is_video_resource_ready")
	public static function isVideoResourceReady(hostVideo:flight._cpp.HostVideoCapability, resource:flight._cpp.VideoResource):Bool;
	@:native("flight_free_video_resource")
	public static function freeVideoResource(ptr:flight._cpp.VideoResource):Void;
}
