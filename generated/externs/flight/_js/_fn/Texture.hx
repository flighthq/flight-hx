package flight._js._fn;

@:jsRequire("flight")
extern class Texture {
	@:native("flight_create_cube_texture")
	public static function createCubeTexture():flight._js.CubeTexture;
	@:native("flight_clone_cube_texture")
	public static function cloneCubeTexture(source:flight._js.CubeTexture):flight._js.CubeTexture;
	@:native("flight_copy_cube_texture")
	public static function copyCubeTexture(out:flight._js.CubeTexture, source:flight._js.CubeTexture):Void;
	@:native("flight_equals_cube_texture")
	public static function equalsCubeTexture(a:flight._js.CubeTexture, b:flight._js.CubeTexture):Bool;
	@:native("flight_get_cube_texture_face_size")
	public static function getCubeTextureFaceSize(cube:flight._js.CubeTexture):Int;
	@:native("flight_is_cube_texture_complete")
	public static function isCubeTextureComplete(cube:flight._js.CubeTexture):Bool;
	@:native("flight_create_anisotropic_sampler")
	public static function createAnisotropicSampler(level:Float):flight._js.Sampler;
	@:native("flight_create_clamp_linear_sampler")
	public static function createClampLinearSampler():flight._js.Sampler;
	@:native("flight_create_pixel_art_sampler")
	public static function createPixelArtSampler():flight._js.Sampler;
	@:native("flight_create_sampler")
	public static function createSampler():flight._js.Sampler;
	@:native("flight_create_tiling_sampler")
	public static function createTilingSampler():flight._js.Sampler;
	@:native("flight_clone_sampler")
	public static function cloneSampler(source:flight._js.Sampler):flight._js.Sampler;
	@:native("flight_copy_sampler")
	public static function copySampler(out:flight._js.Sampler, source:flight._js.Sampler):Void;
	@:native("flight_equals_sampler")
	public static function equalsSampler(a:flight._js.Sampler, b:flight._js.Sampler):Bool;
	@:native("flight_create_texture")
	public static function createTexture(opts:flight._js.CreateTextureOptions):flight._js.Texture;
	@:native("flight_create_texture_2d")
	public static function createTexture2d():flight._js.Texture2D;
	@:native("flight_clone_texture__texture")
	public static function cloneTextureTexture(source:flight._js.Texture):flight._js.Texture;
	@:native("flight_copy_texture__texture__texture")
	public static function copyTextureTextureTexture(out:flight._js.Texture, source:flight._js.Texture):Void;
	@:native("flight_get_texture_height__texture")
	public static function getTextureHeightTexture(texture:flight._js.Texture):Int;
	@:native("flight_get_texture_inverse_uv_matrix__texture")
	public static function getTextureInverseUvMatrixTexture(out:flight._js.Matrix3, texture:flight._js.Texture):Void;
	@:native("flight_get_texture_source__texture")
	public static function getTextureSourceTexture(texture:flight._js.Texture):Dynamic;
	@:native("flight_get_texture_source_kind__texture")
	public static function getTextureSourceKindTexture(texture:flight._js.Texture):Dynamic;
	@:native("flight_get_texture_uv_matrix__texture")
	public static function getTextureUvMatrixTexture(out:flight._js.Matrix3, texture:flight._js.Texture):Void;
	@:native("flight_get_texture_view_size__texture")
	public static function getTextureViewSizeTexture(out:flight._js.Vector2, texture:flight._js.Texture):Void;
	@:native("flight_get_texture_width__texture")
	public static function getTextureWidthTexture(texture:flight._js.Texture):Int;
	@:native("flight_has_texture_source__texture")
	public static function hasTextureSourceTexture(texture:flight._js.Texture):Bool;
	@:native("flight_has_texture_uv_transform__texture")
	public static function hasTextureUvTransformTexture(texture:flight._js.Texture):Bool;
	@:native("flight_is_texture_ready__texture")
	public static function isTextureReadyTexture(texture:flight._js.Texture):Bool;
	@:native("flight_reset_texture_uv_transform__texture")
	public static function resetTextureUvTransformTexture(texture:flight._js.Texture):Void;
	@:native("flight_set_texture_flip__texture")
	public static function setTextureFlipTexture(texture:flight._js.Texture, flipX:Bool, flipY:Bool):Void;
	@:native("flight_set_texture_uv_from_pixel_rect__texture")
	public static function setTextureUvFromPixelRectTexture(texture:flight._js.Texture, x:Float, y:Float, width:Float, height:Float):Void;
	@:native("flight_set_texture_uv_offset__texture")
	public static function setTextureUvOffsetTexture(texture:flight._js.Texture, x:Float, y:Float):Void;
	@:native("flight_set_texture_uv_rotation__texture")
	public static function setTextureUvRotationTexture(texture:flight._js.Texture, radians:Float):Void;
	@:native("flight_set_texture_uv_scale__texture")
	public static function setTextureUvScaleTexture(texture:flight._js.Texture, x:Float, y:Float):Void;
	@:native("flight_transform_texture_uv__texture")
	public static function transformTextureUvTexture(out:flight._js.Vector2, texture:flight._js.Texture, u:Float, v:Float):Void;
	@:native("flight_get_texture_sample_color_space")
	public static function getTextureSampleColorSpace(source:Int, working:Int):Int;
	@:native("flight_should_decode_texture_on_sample")
	public static function shouldDecodeTextureOnSample(source:Int, working:Int):Bool;
	@:native("flight_should_premultiply_texture_on_upload")
	public static function shouldPremultiplyTextureOnUpload(source:Int, working:Int):Bool;
	@:native("flight_invalidate_voxel_grid")
	public static function invalidateVoxelGrid(voxelGrid:flight._js.VoxelGrid):Void;
	@:native("flight_free_cube_texture")
	public static function freeCubeTexture(ptr:flight._js.CubeTexture):Void;
	@:native("flight_free_sampler")
	public static function freeSampler(ptr:flight._js.Sampler):Void;
	@:native("flight_free_texture")
	public static function freeTexture(ptr:flight._js.Texture):Void;
	@:native("flight_free_texture2_d")
	public static function freeTexture2D(ptr:flight._js.Texture2D):Void;
	@:native("flight_free_texture_source_ref")
	public static function freeTextureSourceRef(ptr:flight._js.TextureSourceRef):Void;
	@:native("flight_free_texture_source_kind")
	public static function freeTextureSourceKind(ptr:flight._js.TextureSourceKind):Void;
}
