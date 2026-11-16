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
	@:native("flight_get_video_channel_state_string")
	public static function getVideoChannelStateString(value:Int):cpp.ConstCharStar;
	@:native("flight_get_video_resource_duration")
	public static function getVideoResourceDuration(hostVideo:flight._cpp.HostVideoCapability, resource:flight._cpp.VideoResource):Float;
	@:native("flight_get_video_resource_height")
	public static function getVideoResourceHeight(hostVideo:flight._cpp.HostVideoCapability, resource:flight._cpp.VideoResource):Single;
	@:native("flight_get_video_resource_load_readiness_string")
	public static function getVideoResourceLoadReadinessString(value:Int):cpp.ConstCharStar;
	@:native("flight_get_video_resource_width")
	public static function getVideoResourceWidth(hostVideo:flight._cpp.HostVideoCapability, resource:flight._cpp.VideoResource):Single;
	@:native("flight_has_video_resource_element")
	public static function hasVideoResourceElement(resource:flight._cpp.VideoResource):Bool;
	@:native("flight_is_video_resource_empty")
	public static function isVideoResourceEmpty(hostVideo:flight._cpp.HostVideoCapability, resource:flight._cpp.VideoResource):Bool;
	@:native("flight_is_video_resource_ready")
	public static function isVideoResourceReady(hostVideo:flight._cpp.HostVideoCapability, resource:flight._cpp.VideoResource):Bool;
	@:native("flight_parse_video_channel_state")
	public static function parseVideoChannelState(value:cpp.ConstCharStar):Int;
	@:native("flight_parse_video_resource_load_readiness")
	public static function parseVideoResourceLoadReadiness(value:cpp.ConstCharStar):Int;
	@:native("flight_create_video_texture")
	public static function createVideoTexture(hostVideo:flight._cpp.HostVideoCapability, source:flight._cpp.VideoResource, opts:flight._cpp.CreateTextureCommonOptions):flight._cpp.Texture2D;
	@:native("flight_advance_video_texture__texture")
	public static function advanceVideoTextureTexture(hostVideo:flight._cpp.HostVideoCapability, texture:flight._cpp.Texture):Int;
	@:native("flight_clone_video_texture__texture")
	public static function cloneVideoTextureTexture(source:flight._cpp.Texture):flight._cpp.Texture;
	@:native("flight_copy_video_texture__texture__texture")
	public static function copyVideoTextureTextureTexture(out:flight._cpp.Texture, source:flight._cpp.Texture):Void;
	@:native("flight_destroy_video_texture")
	public static function destroyVideoTexture(texture:flight._cpp.Texture2D):Void;
	@:native("flight_get_video_texture_height__texture")
	public static function getVideoTextureHeightTexture(hostVideo:flight._cpp.HostVideoCapability, texture:flight._cpp.Texture):Single;
	@:native("flight_get_video_texture_inverse_uv_matrix__texture")
	public static function getVideoTextureInverseUvMatrixTexture(out:flight._cpp.Matrix3, texture:flight._cpp.Texture):Void;
	@:native("flight_get_video_texture_uv_matrix__texture")
	public static function getVideoTextureUvMatrixTexture(out:flight._cpp.Matrix3, texture:flight._cpp.Texture):Void;
	@:native("flight_get_video_texture_width__texture")
	public static function getVideoTextureWidthTexture(hostVideo:flight._cpp.HostVideoCapability, texture:flight._cpp.Texture):Single;
	@:native("flight_is_video_texture_frame_ready__texture")
	public static function isVideoTextureFrameReadyTexture(hostVideo:flight._cpp.HostVideoCapability, texture:flight._cpp.Texture):Bool;
	@:native("flight_reset_video_texture_frame__texture")
	public static function resetVideoTextureFrameTexture(texture:flight._cpp.Texture):Void;
	@:native("flight_set_video_texture_source__texture")
	public static function setVideoTextureSourceTexture(hostVideo:flight._cpp.HostVideoCapability, texture:flight._cpp.Texture, source:flight._cpp.VideoResource):Void;
	@:native("flight_free_video_resource")
	public static function freeVideoResource(ptr:flight._cpp.VideoResource):Void;
}
