package flight.esm.texture;

#if (js && flight_esm)
@:jsRequire("@flighthq/texture/contract")
extern class Contract {
  public static final BitmapTextureSourceKind:String;
  public static final CompressedImageTextureSourceKind:String;
  public static final CubeFaceNegativeX:Float;
  public static final CubeFaceNegativeY:Float;
  public static final CubeFaceNegativeZ:Float;
  public static final CubeFacePositiveX:Float;
  public static final CubeFacePositiveY:Float;
  public static final CubeFacePositiveZ:Float;
  public static final ExternalTextureSourceKind:String;
  public static final ImageTextureSourceKind:String;
  public static final RenderTargetTextureSourceKind:String;
  public static final SamplerKind:String;
  public static final TextureKind:String;
  public static final VoxelGridTextureSourceKind:String;
  public static function advanceVideoTexture(hostVideo:flight.esm.types.video.Types.HostVideoCapability, texture:flight.esm.types.texture_contract.Types.TextureLike):Float;
  public static function cloneCubeTexture(source:Dynamic):{ colorSpace:flight.esm.types.texture_contract.Types.TextureColorSpace, sampler:flight.esm.types.texture_contract.Types.Sampler, version:Float, flipX:Bool, flipY:Bool, uvOffset:flight.esm.types.geometry.Types.Vector2, uvRotation:Float, uvScale:flight.esm.types.geometry.Types.Vector2, dimension:String, sources:flight.esm.types.texture_contract.Types.TextureSourceCubeFaces };
  public static function cloneSampler(source:flight.esm.types.texture_contract.Types.SamplerLike):flight.esm.types.texture_contract.Types.Sampler;
  public static function cloneTexture(source:flight.esm.types.texture_contract.Types.TextureLike):flight.esm.types.texture_contract.Types.Texture;
  public static function cloneVideoTexture(source:flight.esm.types.texture_contract.Types.TextureLike):flight.esm.types.texture_contract.Types.Texture;
  public static function copyCubeTexture(out:{ colorSpace:flight.esm.types.texture_contract.Types.TextureColorSpace, sampler:flight.esm.types.texture_contract.Types.Sampler, version:Float, flipX:Bool, flipY:Bool, uvOffset:flight.esm.types.geometry.Types.Vector2, uvRotation:Float, uvScale:flight.esm.types.geometry.Types.Vector2, dimension:String, sources:flight.esm.types.texture_contract.Types.TextureSourceCubeFaces }, source:Dynamic):Void;
  public static function copySampler(out:flight.esm.types.texture_contract.Types.SamplerLike, source:flight.esm.types.texture_contract.Types.SamplerLike):Void;
  public static function copyTexture(out:flight.esm.types.texture_contract.Types.TextureLike, source:flight.esm.types.texture_contract.Types.TextureLike):Void;
  public static function copyVideoTexture(out:flight.esm.types.texture_contract.Types.TextureLike, source:flight.esm.types.texture_contract.Types.TextureLike):Void;
  public static function createAnisotropicSampler(level:Float):flight.esm.types.texture_contract.Types.Sampler;
  public static function createClampLinearSampler():flight.esm.types.texture_contract.Types.Sampler;
  public static function createCubeTexture(?opts:Null<flight.esm.types.texture_contract.Types.CreateCubeTextureOptions>):{ colorSpace:flight.esm.types.texture_contract.Types.TextureColorSpace, sampler:flight.esm.types.texture_contract.Types.Sampler, version:Float, flipX:Bool, flipY:Bool, uvOffset:flight.esm.types.geometry.Types.Vector2, uvRotation:Float, uvScale:flight.esm.types.geometry.Types.Vector2, dimension:String, sources:flight.esm.types.texture_contract.Types.TextureSourceCubeFaces };
  public static function createPixelArtSampler():flight.esm.types.texture_contract.Types.Sampler;
  public static function createRenderTexture(options:flight.esm.types.render_contract.Types.CreateRenderTextureOptions):flight.esm.types.render_contract.Types.RenderTexture;
  public static function createSampler(?opts:Dynamic):flight.esm.types.texture_contract.Types.Sampler;
  @:overload(function(opts:Dynamic):{ colorSpace:flight.esm.types.texture_contract.Types.TextureColorSpace, sampler:flight.esm.types.texture_contract.Types.Sampler, version:Float, flipX:Bool, flipY:Bool, uvOffset:flight.esm.types.geometry.Types.Vector2, uvRotation:Float, uvScale:flight.esm.types.geometry.Types.Vector2, dimension:String, sources:Array<Null<flight.esm.types.texture_contract.Types.TextureSource>> } {})
  @:overload(function(opts:Dynamic):{ colorSpace:flight.esm.types.texture_contract.Types.TextureColorSpace, sampler:flight.esm.types.texture_contract.Types.Sampler, version:Float, flipX:Bool, flipY:Bool, uvOffset:flight.esm.types.geometry.Types.Vector2, uvRotation:Float, uvScale:flight.esm.types.geometry.Types.Vector2, dimension:String, source:Null<flight.esm.types.texture_contract.Types.VoxelGrid> } {})
  @:overload(function(opts:Dynamic):{ colorSpace:flight.esm.types.texture_contract.Types.TextureColorSpace, sampler:flight.esm.types.texture_contract.Types.Sampler, version:Float, flipX:Bool, flipY:Bool, uvOffset:flight.esm.types.geometry.Types.Vector2, uvRotation:Float, uvScale:flight.esm.types.geometry.Types.Vector2, dimension:String, sources:flight.esm.types.texture_contract.Types.TextureSourceCubeFaces } {})
  public static function createTexture(?opts:Dynamic):flight.esm.types.texture_contract.Types.Texture2D;
  public static function createTexture2D(?opts:Dynamic):flight.esm.types.texture_contract.Types.Texture2D;
  public static function createTilingSampler():flight.esm.types.texture_contract.Types.Sampler;
  public static function createVideoTexture(hostVideo:flight.esm.types.video.Types.HostVideoCapability, source:flight.esm.types.video.Types.VideoResource, ?opts:Dynamic):flight.esm.types.texture_contract.Types.Texture2D;
  public static function destroyVideoTexture(texture:flight.esm.types.texture_contract.Types.Texture2D):Void;
  public static function equalsCubeTexture(a:Dynamic, b:Dynamic):Bool;
  public static function equalsSampler(a:Null<flight.esm.types.texture_contract.Types.SamplerLike>, b:Null<flight.esm.types.texture_contract.Types.SamplerLike>):Bool;
  public static function equalsTexture(a:Dynamic, b:Dynamic):Bool;
  public static function getCubeTextureFaceSize(cube:Dynamic):Float;
  public static function getTextureHeight(texture:flight.esm.types.texture_contract.Types.TextureLike):Float;
  public static function getTextureInverseUvMatrix(out:flight.esm.types.geometry.Types.Matrix3Like, texture:flight.esm.types.texture_contract.Types.TextureLike):Void;
  public static function getTextureSampleColorSpace(source:flight.esm.types.texture_contract.Types.TextureColorSpace, working:flight.esm.types.render_contract.Types.RenderTargetColorSpace):flight.esm.types.texture_contract.Types.TextureColorSpace;
  public static function getTextureSource(texture:flight.esm.types.texture_contract.Types.TextureLike):Null<flight.esm.types.texture_contract.Types.TextureSource>;
  public static function getTextureSourceKind(texture:flight.esm.types.texture_contract.Types.TextureLike):Null<String>;
  public static function getTextureUvMatrix(out:flight.esm.types.geometry.Types.Matrix3Like, texture:flight.esm.types.texture_contract.Types.TextureUvTransform):Void;
  public static function getTextureViewSize(out:flight.esm.types.geometry.Types.Vector2Like, texture:flight.esm.types.texture_contract.Types.TextureLike):Void;
  public static function getTextureWidth(texture:flight.esm.types.texture_contract.Types.TextureLike):Float;
  public static function getVideoTextureHeight(hostVideo:flight.esm.types.video.Types.HostVideoCapability, texture:flight.esm.types.texture_contract.Types.TextureLike):Float;
  public static function getVideoTextureInverseUvMatrix(out:flight.esm.types.geometry.Types.Matrix3Like, texture:flight.esm.types.texture_contract.Types.TextureLike):Void;
  public static function getVideoTextureUvMatrix(out:flight.esm.types.geometry.Types.Matrix3Like, texture:flight.esm.types.texture_contract.Types.TextureLike):Void;
  public static function getVideoTextureWidth(hostVideo:flight.esm.types.video.Types.HostVideoCapability, texture:flight.esm.types.texture_contract.Types.TextureLike):Float;
  public static function hasTextureSource(texture:flight.esm.types.texture_contract.Types.TextureLike):Bool;
  public static function hasTextureUvTransform(texture:flight.esm.types.texture_contract.Types.TextureUvTransform):Bool;
  public static function initializeRenderTextureTarget(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.render_contract.Types.RenderTarget>, options:flight.esm.types.render_contract.Types.CreateRenderTextureOptions, colorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace):Void;
  public static function initializeSampler(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.texture_contract.Types.Sampler>, ?opts:Dynamic):Void;
  public static function initializeTexture2D(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.texture_contract.Types.Texture2D>, ?opts:Dynamic):Void;
  public static function initializeVideoImageResource(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.image_contract.Types.ImageResource>, source:Dynamic, version:Float):Void;
  public static function invalidateVoxelGrid(voxelGrid:flight.esm.types.texture_contract.Types.VoxelGrid):Void;
  public static function isCubeTextureComplete(cube:Dynamic):Bool;
  public static function isTextureReady(texture:flight.esm.types.texture_contract.Types.TextureLike):Bool;
  public static function isVideoTextureFrameReady(hostVideo:flight.esm.types.video.Types.HostVideoCapability, texture:flight.esm.types.texture_contract.Types.TextureLike):Bool;
  public static function resetTextureUvTransform(texture:flight.esm.types.texture_contract.Types.TextureLike):Void;
  public static function resetVideoTextureFrame(texture:flight.esm.types.texture_contract.Types.TextureLike):Void;
  public static function setCubeTextureFace(cube:{ colorSpace:flight.esm.types.texture_contract.Types.TextureColorSpace, sampler:flight.esm.types.texture_contract.Types.Sampler, version:Float, flipX:Bool, flipY:Bool, uvOffset:flight.esm.types.geometry.Types.Vector2, uvRotation:Float, uvScale:flight.esm.types.geometry.Types.Vector2, dimension:String, sources:flight.esm.types.texture_contract.Types.TextureSourceCubeFaces }, faceIndex:Float, source:Null<flight.esm.types.texture_contract.Types.TextureSource>):Void;
  public static function setTextureFlip(texture:flight.esm.types.texture_contract.Types.TextureLike, flipX:Bool, flipY:Bool):Void;
  public static function setTextureSource(texture:flight.esm.types.texture_contract.Types.TextureLike, source:Null<flight.esm.types.texture_contract.Types.TextureSource>):Void;
  public static function setTextureUvFromPixelRect(texture:flight.esm.types.texture_contract.Types.TextureLike, x:Float, y:Float, width:Float, height:Float):Void;
  public static function setTextureUvOffset(texture:flight.esm.types.texture_contract.Types.TextureLike, x:Float, y:Float):Void;
  public static function setTextureUvRotation(texture:flight.esm.types.texture_contract.Types.TextureLike, radians:Float):Void;
  public static function setTextureUvScale(texture:flight.esm.types.texture_contract.Types.TextureLike, x:Float, y:Float):Void;
  public static function setVideoTextureSource(hostVideo:flight.esm.types.video.Types.HostVideoCapability, texture:flight.esm.types.texture_contract.Types.TextureLike, source:flight.esm.types.video.Types.VideoResource):Void;
  public static function shouldDecodeTextureOnSample(source:flight.esm.types.texture_contract.Types.TextureColorSpace, working:flight.esm.types.render_contract.Types.RenderTargetColorSpace):Bool;
  public static function shouldPremultiplyTextureOnUpload(source:flight.esm.types.texture_contract.Types.TextureColorSpace, working:flight.esm.types.render_contract.Types.RenderTargetColorSpace):Bool;
  public static function transformTextureUv(out:flight.esm.types.geometry.Types.Vector2Like, texture:flight.esm.types.texture_contract.Types.TextureLike, u:Float, v:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
