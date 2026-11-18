package flight._hl._fn;

extern class Video {
	@:hlNative("flight", "flight_can_play_video_type")
	public static function canPlayVideoType(backend:flight._hl.HostVideoCapability, mimeType:hl.Bytes):Bool;
	@:hlNative("flight", "flight_infer_video_mime_type")
	public static function inferVideoMimeType(url:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_create_video_resource")
	public static function createVideoResource():flight._hl.VideoResource;
	@:hlNative("flight", "flight_destroy_video_resource")
	public static function destroyVideoResource(hostVideo:flight._hl.HostVideoCapability, resource:flight._hl.VideoResource):Void;
	@:hlNative("flight", "flight_dispose_video_resource")
	public static function disposeVideoResource(hostVideo:flight._hl.HostVideoCapability, resource:flight._hl.VideoResource):Void;
	@:hlNative("flight", "flight_get_video_resource_duration")
	public static function getVideoResourceDuration(hostVideo:flight._hl.HostVideoCapability, resource:flight._hl.VideoResource):Float;
	@:hlNative("flight", "flight_get_video_resource_height")
	public static function getVideoResourceHeight(hostVideo:flight._hl.HostVideoCapability, resource:flight._hl.VideoResource):Single;
	@:hlNative("flight", "flight_get_video_resource_width")
	public static function getVideoResourceWidth(hostVideo:flight._hl.HostVideoCapability, resource:flight._hl.VideoResource):Single;
	@:hlNative("flight", "flight_has_video_resource_element")
	public static function hasVideoResourceElement(resource:flight._hl.VideoResource):Bool;
	@:hlNative("flight", "flight_is_video_resource_empty")
	public static function isVideoResourceEmpty(hostVideo:flight._hl.HostVideoCapability, resource:flight._hl.VideoResource):Bool;
	@:hlNative("flight", "flight_is_video_resource_ready")
	public static function isVideoResourceReady(hostVideo:flight._hl.HostVideoCapability, resource:flight._hl.VideoResource):Bool;
	@:hlNative("flight", "flight_free_video_resource")
	public static function freeVideoResource(ptr:flight._hl.VideoResource):Void;
}
