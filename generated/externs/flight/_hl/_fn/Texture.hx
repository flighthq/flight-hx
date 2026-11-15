package flight._hl._fn;

extern class Texture {
	@:hlNative("flight", "flight_create_cube_texture")
	public static function createCubeTexture():flight._hl.CubeTexture;
	@:hlNative("flight", "flight_clone_cube_texture")
	public static function cloneCubeTexture(source:flight._hl.CubeTexture):flight._hl.CubeTexture;
	@:hlNative("flight", "flight_copy_cube_texture")
	public static function copyCubeTexture(out:flight._hl.CubeTexture, source:flight._hl.CubeTexture):Void;
	@:hlNative("flight", "flight_equals_cube_texture")
	public static function equalsCubeTexture(a:flight._hl.CubeTexture, b:flight._hl.CubeTexture):Bool;
	@:hlNative("flight", "flight_get_cube_texture_face_size")
	public static function getCubeTextureFaceSize(cube:flight._hl.CubeTexture):Int;
	@:hlNative("flight", "flight_is_cube_texture_complete")
	public static function isCubeTextureComplete(cube:flight._hl.CubeTexture):Bool;
	@:hlNative("flight", "flight_create_anisotropic_sampler")
	public static function createAnisotropicSampler(level:Single):flight._hl.Sampler;
	@:hlNative("flight", "flight_create_clamp_linear_sampler")
	public static function createClampLinearSampler():flight._hl.Sampler;
	@:hlNative("flight", "flight_create_pixel_art_sampler")
	public static function createPixelArtSampler():flight._hl.Sampler;
	@:hlNative("flight", "flight_create_sampler")
	public static function createSampler():flight._hl.Sampler;
	@:hlNative("flight", "flight_create_tiling_sampler")
	public static function createTilingSampler():flight._hl.Sampler;
	@:hlNative("flight", "flight_clone_sampler")
	public static function cloneSampler(source:flight._hl.Sampler):flight._hl.Sampler;
	@:hlNative("flight", "flight_copy_sampler")
	public static function copySampler(out:flight._hl.Sampler, source:flight._hl.Sampler):Void;
	@:hlNative("flight", "flight_equals_sampler")
	public static function equalsSampler(a:flight._hl.Sampler, b:flight._hl.Sampler):Bool;
	@:hlNative("flight", "flight_create_texture")
	public static function createTexture(opts:flight._hl.CreateTextureOptions):Int;
	@:hlNative("flight", "flight_create_texture_2d")
	public static function createTexture2d():flight._hl.Texture2D;
	@:hlNative("flight", "flight_clone_texture__texture")
	public static function cloneTextureTexture(source:flight._hl.Texture):Int;
	@:hlNative("flight", "flight_copy_texture__texture__texture")
	public static function copyTextureTextureTexture(out:flight._hl.Texture, source:flight._hl.Texture):Void;
	@:hlNative("flight", "flight_get_texture_height__texture")
	public static function getTextureHeightTexture(texture:flight._hl.Texture):Int;
	@:hlNative("flight", "flight_get_texture_inverse_uv_matrix__texture")
	public static function getTextureInverseUvMatrixTexture(out:flight._hl.Matrix3, texture:flight._hl.Texture):Void;
	@:hlNative("flight", "flight_get_texture_source__texture")
	public static function getTextureSourceTexture(texture:flight._hl.Texture):Dynamic;
	@:hlNative("flight", "flight_get_texture_source_kind__texture")
	public static function getTextureSourceKindTexture(texture:flight._hl.Texture):Dynamic;
	@:hlNative("flight", "flight_get_texture_uv_matrix__texture")
	public static function getTextureUvMatrixTexture(out:flight._hl.Matrix3, texture:flight._hl.Texture):Void;
	@:hlNative("flight", "flight_get_texture_view_size__texture")
	public static function getTextureViewSizeTexture(out:flight._hl.Vector2, texture:flight._hl.Texture):Void;
	@:hlNative("flight", "flight_get_texture_width__texture")
	public static function getTextureWidthTexture(texture:flight._hl.Texture):Int;
	@:hlNative("flight", "flight_has_texture_source__texture")
	public static function hasTextureSourceTexture(texture:flight._hl.Texture):Bool;
	@:hlNative("flight", "flight_has_texture_uv_transform__texture")
	public static function hasTextureUvTransformTexture(texture:flight._hl.Texture):Bool;
	@:hlNative("flight", "flight_is_texture_ready__texture")
	public static function isTextureReadyTexture(texture:flight._hl.Texture):Bool;
	@:hlNative("flight", "flight_reset_texture_uv_transform__texture")
	public static function resetTextureUvTransformTexture(texture:flight._hl.Texture):Void;
	@:hlNative("flight", "flight_set_texture_flip__texture")
	public static function setTextureFlipTexture(texture:flight._hl.Texture, flipX:Bool, flipY:Bool):Void;
	@:hlNative("flight", "flight_set_texture_uv_from_pixel_rect__texture")
	public static function setTextureUvFromPixelRectTexture(texture:flight._hl.Texture, x:Single, y:Single, width:Single, height:Single):Void;
	@:hlNative("flight", "flight_set_texture_uv_offset__texture")
	public static function setTextureUvOffsetTexture(texture:flight._hl.Texture, x:Single, y:Single):Void;
	@:hlNative("flight", "flight_set_texture_uv_rotation__texture")
	public static function setTextureUvRotationTexture(texture:flight._hl.Texture, radians:Single):Void;
	@:hlNative("flight", "flight_set_texture_uv_scale__texture")
	public static function setTextureUvScaleTexture(texture:flight._hl.Texture, x:Single, y:Single):Void;
	@:hlNative("flight", "flight_transform_texture_uv__texture")
	public static function transformTextureUvTexture(out:flight._hl.Vector2, texture:flight._hl.Texture, u:Single, v:Single):Void;
	@:hlNative("flight", "flight_get_texture_sample_color_space")
	public static function getTextureSampleColorSpace(source:Int, working:Int):Int;
	@:hlNative("flight", "flight_should_decode_texture_on_sample")
	public static function shouldDecodeTextureOnSample(source:Int, working:Int):Bool;
	@:hlNative("flight", "flight_should_premultiply_texture_on_upload")
	public static function shouldPremultiplyTextureOnUpload(source:Int, working:Int):Bool;
	@:hlNative("flight", "flight_invalidate_voxel_grid")
	public static function invalidateVoxelGrid(voxelGrid:flight._hl.VoxelGrid):Void;
	@:hlNative("flight", "flight_free_cube_texture")
	public static function freeCubeTexture(ptr:flight._hl.CubeTexture):Void;
	@:hlNative("flight", "flight_free_sampler")
	public static function freeSampler(ptr:flight._hl.Sampler):Void;
	@:hlNative("flight", "flight_free_texture2_d")
	public static function freeTexture2D(ptr:flight._hl.Texture2D):Void;
	@:hlNative("flight", "flight_free_texture_source_ref")
	public static function freeTextureSourceRef(ptr:flight._hl.TextureSourceRef):Void;
	@:hlNative("flight", "flight_free_texture_source_kind")
	public static function freeTextureSourceKind(ptr:flight._hl.TextureSourceKind):Void;
}
