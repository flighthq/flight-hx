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
	@:hlNative("flight", "flight_get_video_channel_state_string")
	public static function getVideoChannelStateString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_video_resource_duration")
	public static function getVideoResourceDuration(hostVideo:flight._hl.HostVideoCapability, resource:flight._hl.VideoResource):Float;
	@:hlNative("flight", "flight_get_video_resource_height")
	public static function getVideoResourceHeight(hostVideo:flight._hl.HostVideoCapability, resource:flight._hl.VideoResource):Single;
	@:hlNative("flight", "flight_get_video_resource_load_readiness_string")
	public static function getVideoResourceLoadReadinessString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_video_resource_width")
	public static function getVideoResourceWidth(hostVideo:flight._hl.HostVideoCapability, resource:flight._hl.VideoResource):Single;
	@:hlNative("flight", "flight_has_video_resource_element")
	public static function hasVideoResourceElement(resource:flight._hl.VideoResource):Bool;
	@:hlNative("flight", "flight_is_video_resource_empty")
	public static function isVideoResourceEmpty(hostVideo:flight._hl.HostVideoCapability, resource:flight._hl.VideoResource):Bool;
	@:hlNative("flight", "flight_is_video_resource_ready")
	public static function isVideoResourceReady(hostVideo:flight._hl.HostVideoCapability, resource:flight._hl.VideoResource):Bool;
	@:hlNative("flight", "flight_parse_video_channel_state")
	public static function parseVideoChannelState(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_parse_video_resource_load_readiness")
	public static function parseVideoResourceLoadReadiness(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_create_video_texture")
	public static function createVideoTexture(hostVideo:flight._hl.HostVideoCapability, source:flight._hl.VideoResource, opts:flight._hl.CreateTextureCommonOptions):flight._hl.Texture2D;
	@:hlNative("flight", "flight_advance_video_texture__texture")
	public static function advanceVideoTextureTexture(hostVideo:flight._hl.HostVideoCapability, texture:flight._hl.Texture):Int;
	@:hlNative("flight", "flight_clone_video_texture__texture")
	public static function cloneVideoTextureTexture(source:flight._hl.Texture):Int;
	@:hlNative("flight", "flight_copy_video_texture__texture__texture")
	public static function copyVideoTextureTextureTexture(out:flight._hl.Texture, source:flight._hl.Texture):Void;
	@:hlNative("flight", "flight_destroy_video_texture")
	public static function destroyVideoTexture(texture:flight._hl.Texture2D):Void;
	@:hlNative("flight", "flight_get_video_texture_height__texture")
	public static function getVideoTextureHeightTexture(hostVideo:flight._hl.HostVideoCapability, texture:flight._hl.Texture):Single;
	@:hlNative("flight", "flight_get_video_texture_inverse_uv_matrix__texture")
	public static function getVideoTextureInverseUvMatrixTexture(out:flight._hl.Matrix3, texture:flight._hl.Texture):Void;
	@:hlNative("flight", "flight_get_video_texture_uv_matrix__texture")
	public static function getVideoTextureUvMatrixTexture(out:flight._hl.Matrix3, texture:flight._hl.Texture):Void;
	@:hlNative("flight", "flight_get_video_texture_width__texture")
	public static function getVideoTextureWidthTexture(hostVideo:flight._hl.HostVideoCapability, texture:flight._hl.Texture):Single;
	@:hlNative("flight", "flight_is_video_texture_frame_ready__texture")
	public static function isVideoTextureFrameReadyTexture(hostVideo:flight._hl.HostVideoCapability, texture:flight._hl.Texture):Bool;
	@:hlNative("flight", "flight_reset_video_texture_frame__texture")
	public static function resetVideoTextureFrameTexture(texture:flight._hl.Texture):Void;
	@:hlNative("flight", "flight_set_video_texture_source__texture")
	public static function setVideoTextureSourceTexture(hostVideo:flight._hl.HostVideoCapability, texture:flight._hl.Texture, source:flight._hl.VideoResource):Void;
	@:hlNative("flight", "flight_free_video_resource")
	public static function freeVideoResource(ptr:flight._hl.VideoResource):Void;
}
