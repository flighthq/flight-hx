package flight._cpp._fn;

extern class Texture {
	@:native("flight_create_cube_texture")
	public static function createCubeTexture():flight._cpp.CubeTexture;
	@:native("flight_clone_cube_texture")
	public static function cloneCubeTexture(source:flight._cpp.CubeTexture):flight._cpp.CubeTexture;
	@:native("flight_copy_cube_texture")
	public static function copyCubeTexture(out:flight._cpp.CubeTexture, source:flight._cpp.CubeTexture):Void;
	@:native("flight_equals_cube_texture")
	public static function equalsCubeTexture(a:flight._cpp.CubeTexture, b:flight._cpp.CubeTexture):Bool;
	@:native("flight_get_cube_texture_face_size")
	public static function getCubeTextureFaceSize(cube:flight._cpp.CubeTexture):Int;
	@:native("flight_is_cube_texture_complete")
	public static function isCubeTextureComplete(cube:flight._cpp.CubeTexture):Bool;
	@:native("flight_create_anisotropic_sampler")
	public static function createAnisotropicSampler(level:Single):flight._cpp.Sampler;
	@:native("flight_create_clamp_linear_sampler")
	public static function createClampLinearSampler():flight._cpp.Sampler;
	@:native("flight_create_pixel_art_sampler")
	public static function createPixelArtSampler():flight._cpp.Sampler;
	@:native("flight_create_sampler")
	public static function createSampler():flight._cpp.Sampler;
	@:native("flight_create_tiling_sampler")
	public static function createTilingSampler():flight._cpp.Sampler;
	@:native("flight_clone_sampler")
	public static function cloneSampler(source:flight._cpp.Sampler):flight._cpp.Sampler;
	@:native("flight_copy_sampler")
	public static function copySampler(out:flight._cpp.Sampler, source:flight._cpp.Sampler):Void;
	@:native("flight_equals_sampler")
	public static function equalsSampler(a:flight._cpp.Sampler, b:flight._cpp.Sampler):Bool;
	@:native("flight_create_texture")
	public static function createTexture(opts:flight._cpp.CreateTextureOptions):flight._cpp.Texture;
	@:native("flight_create_texture_2d")
	public static function createTexture2d():flight._cpp.Texture2D;
	@:native("flight_clone_texture__texture")
	public static function cloneTextureTexture(source:flight._cpp.Texture):flight._cpp.Texture;
	@:native("flight_copy_texture__texture__texture")
	public static function copyTextureTextureTexture(out:flight._cpp.Texture, source:flight._cpp.Texture):Void;
	@:native("flight_get_texture_height__texture")
	public static function getTextureHeightTexture(texture:flight._cpp.Texture):Int;
	@:native("flight_get_texture_inverse_uv_matrix__texture")
	public static function getTextureInverseUvMatrixTexture(out:flight._cpp.Matrix3, texture:flight._cpp.Texture):Void;
	@:native("flight_get_texture_source__texture")
	public static function getTextureSourceTexture(texture:flight._cpp.Texture):flight._cpp.TextureSourceRef;
	@:native("flight_get_texture_source_kind__texture")
	public static function getTextureSourceKindTexture(texture:flight._cpp.Texture):flight._cpp.TextureSourceKind;
	@:native("flight_get_texture_uv_matrix__texture")
	public static function getTextureUvMatrixTexture(out:flight._cpp.Matrix3, texture:flight._cpp.Texture):Void;
	@:native("flight_get_texture_view_size__texture")
	public static function getTextureViewSizeTexture(out:flight._cpp.Vector2, texture:flight._cpp.Texture):Void;
	@:native("flight_get_texture_width__texture")
	public static function getTextureWidthTexture(texture:flight._cpp.Texture):Int;
	@:native("flight_has_texture_source__texture")
	public static function hasTextureSourceTexture(texture:flight._cpp.Texture):Bool;
	@:native("flight_has_texture_uv_transform__texture")
	public static function hasTextureUvTransformTexture(texture:flight._cpp.Texture):Bool;
	@:native("flight_is_texture_ready__texture")
	public static function isTextureReadyTexture(texture:flight._cpp.Texture):Bool;
	@:native("flight_reset_texture_uv_transform__texture")
	public static function resetTextureUvTransformTexture(texture:flight._cpp.Texture):Void;
	@:native("flight_set_texture_flip__texture")
	public static function setTextureFlipTexture(texture:flight._cpp.Texture, flipX:Bool, flipY:Bool):Void;
	@:native("flight_set_texture_uv_from_pixel_rect__texture")
	public static function setTextureUvFromPixelRectTexture(texture:flight._cpp.Texture, x:Single, y:Single, width:Single, height:Single):Void;
	@:native("flight_set_texture_uv_offset__texture")
	public static function setTextureUvOffsetTexture(texture:flight._cpp.Texture, x:Single, y:Single):Void;
	@:native("flight_set_texture_uv_rotation__texture")
	public static function setTextureUvRotationTexture(texture:flight._cpp.Texture, radians:Single):Void;
	@:native("flight_set_texture_uv_scale__texture")
	public static function setTextureUvScaleTexture(texture:flight._cpp.Texture, x:Single, y:Single):Void;
	@:native("flight_transform_texture_uv__texture")
	public static function transformTextureUvTexture(out:flight._cpp.Vector2, texture:flight._cpp.Texture, u:Single, v:Single):Void;
	@:native("flight_get_texture_sample_color_space")
	public static function getTextureSampleColorSpace(source:Int, working:Int):Int;
	@:native("flight_should_decode_texture_on_sample")
	public static function shouldDecodeTextureOnSample(source:Int, working:Int):Bool;
	@:native("flight_should_premultiply_texture_on_upload")
	public static function shouldPremultiplyTextureOnUpload(source:Int, working:Int):Bool;
	@:native("flight_invalidate_voxel_grid")
	public static function invalidateVoxelGrid(voxelGrid:flight._cpp.VoxelGrid):Void;
	@:native("flight_free_cube_texture")
	public static function freeCubeTexture(ptr:flight._cpp.CubeTexture):Void;
	@:native("flight_free_sampler")
	public static function freeSampler(ptr:flight._cpp.Sampler):Void;
	@:native("flight_free_texture")
	public static function freeTexture(ptr:flight._cpp.Texture):Void;
	@:native("flight_free_texture2_d")
	public static function freeTexture2D(ptr:flight._cpp.Texture2D):Void;
	@:native("flight_free_texture_source_ref")
	public static function freeTextureSourceRef(ptr:flight._cpp.TextureSourceRef):Void;
	@:native("flight_free_texture_source_kind")
	public static function freeTextureSourceKind(ptr:flight._cpp.TextureSourceKind):Void;
}
