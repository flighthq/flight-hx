package flight._js._fn;

@:jsRequire("@flighthq/texture")
extern class Texture {
	@:native("createCubeTexture")
	public static function createCubeTexture():flight._js.CubeTexture;
	@:native("cloneCubeTexture")
	public static function cloneCubeTexture(source:flight._js.CubeTexture):flight._js.CubeTexture;
	@:native("copyCubeTexture")
	public static function copyCubeTexture(out:flight._js.CubeTexture, source:flight._js.CubeTexture):Void;
	@:native("equalsCubeTexture")
	public static function equalsCubeTexture(a:Null<flight._js.CubeTexture>, b:Null<flight._js.CubeTexture>):Bool;
	@:native("getCubeTextureFaceSize")
	public static function getCubeTextureFaceSize(cube:flight._js.CubeTexture):Int;
	@:native("isCubeTextureComplete")
	public static function isCubeTextureComplete(cube:flight._js.CubeTexture):Bool;
	@:native("createAnisotropicSampler")
	public static function createAnisotropicSampler(level:Float):flight._js.Sampler;
	@:native("createClampLinearSampler")
	public static function createClampLinearSampler():flight._js.Sampler;
	@:native("createPixelArtSampler")
	public static function createPixelArtSampler():flight._js.Sampler;
	@:native("createSampler")
	public static function createSampler():flight._js.Sampler;
	@:native("createTilingSampler")
	public static function createTilingSampler():flight._js.Sampler;
	@:native("cloneSampler")
	public static function cloneSampler(source:flight._js.Sampler):flight._js.Sampler;
	@:native("copySampler")
	public static function copySampler(out:flight._js.Sampler, source:flight._js.Sampler):Void;
	@:native("equalsSampler")
	public static function equalsSampler(a:Null<flight._js.Sampler>, b:Null<flight._js.Sampler>):Bool;
	@:native("createTexture")
	public static function createTexture(opts:Null<flight._js.CreateTextureOptions>):flight._js.Texture;
	@:native("createTexture2D")
	public static function createTexture2d():flight._js.Texture2D;
	@:native("cloneTexture")
	public static function cloneTextureTexture(source:flight._js.Texture):flight._js.Texture;
	@:native("copyTexture")
	public static function copyTextureTextureTexture(out:flight._js.Texture, source:flight._js.Texture):Void;
	@:native("getTextureHeight")
	public static function getTextureHeightTexture(texture:flight._js.Texture):Int;
	@:native("getTextureInverseUvMatrix")
	public static function getTextureInverseUvMatrixTexture(out:flight._js.Matrix3, texture:flight._js.Texture):Void;
	@:native("getTextureSource")
	public static function getTextureSourceTexture(texture:flight._js.Texture):Null<flight._js.TextureSourceRef>;
	@:native("getTextureSourceKind")
	public static function getTextureSourceKindTexture(texture:flight._js.Texture):Null<flight._js.TextureSourceKind>;
	@:native("getTextureUvMatrix")
	public static function getTextureUvMatrixTexture(out:flight._js.Matrix3, texture:flight._js.Texture):Void;
	@:native("getTextureViewSize")
	public static function getTextureViewSizeTexture(out:flight._js.Vector2, texture:flight._js.Texture):Void;
	@:native("getTextureWidth")
	public static function getTextureWidthTexture(texture:flight._js.Texture):Int;
	@:native("hasTextureSource")
	public static function hasTextureSourceTexture(texture:flight._js.Texture):Bool;
	@:native("hasTextureUvTransform")
	public static function hasTextureUvTransformTexture(texture:flight._js.Texture):Bool;
	@:native("isTextureReady")
	public static function isTextureReadyTexture(texture:flight._js.Texture):Bool;
	@:native("resetTextureUvTransform")
	public static function resetTextureUvTransformTexture(texture:flight._js.Texture):Void;
	@:native("setTextureFlip")
	public static function setTextureFlipTexture(texture:flight._js.Texture, flipX:Bool, flipY:Bool):Void;
	@:native("setTextureUvFromPixelRect")
	public static function setTextureUvFromPixelRectTexture(texture:flight._js.Texture, x:Float, y:Float, width:Float, height:Float):Void;
	@:native("setTextureUvOffset")
	public static function setTextureUvOffsetTexture(texture:flight._js.Texture, x:Float, y:Float):Void;
	@:native("setTextureUvRotation")
	public static function setTextureUvRotationTexture(texture:flight._js.Texture, radians:Float):Void;
	@:native("setTextureUvScale")
	public static function setTextureUvScaleTexture(texture:flight._js.Texture, x:Float, y:Float):Void;
	@:native("transformTextureUv")
	public static function transformTextureUvTexture(out:flight._js.Vector2, texture:flight._js.Texture, u:Float, v:Float):Void;
	@:native("getTextureSampleColorSpace")
	public static function getTextureSampleColorSpace(source:Dynamic, working:Dynamic):Dynamic;
	@:native("shouldDecodeTextureOnSample")
	public static function shouldDecodeTextureOnSample(source:Dynamic, working:Dynamic):Bool;
	@:native("shouldPremultiplyTextureOnUpload")
	public static function shouldPremultiplyTextureOnUpload(source:Dynamic, working:Dynamic):Bool;
	@:native("invalidateVoxelGrid")
	public static function invalidateVoxelGrid(voxelGrid:flight._js.VoxelGrid):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCubeTexture(ptr:flight._js.CubeTexture):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSampler(ptr:flight._js.Sampler):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTexture(ptr:flight._js.Texture):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTexture2D(ptr:flight._js.Texture2D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextureSourceRef(ptr:flight._js.TextureSourceRef):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextureSourceKind(ptr:flight._js.TextureSourceKind):Void {}
}
