package flight.esm.types.texture_contract;

#if (js && flight_esm)
typedef AlphaType = String;

typedef CreateCubeTextureOptions = { ?colorSpace:Null<String>, ?sampler:Null<flight.esm.types.texture_contract.Types.SamplerLike>, ?sources:Null<flight.esm.types.texture_contract.Types.TextureSourceCubeFaces> };

typedef CreateTexture2DOptions = { ?version:Null<Float>, ?colorSpace:Null<String>, ?source:Null<flight.esm.types.texture_contract.Types.TextureSource>, ?sampler:Null<flight.esm.types.texture_contract.Types.Sampler>, ?flipX:Null<Bool>, ?flipY:Null<Bool>, ?uvOffset:Null<flight.esm.types.geometry.Types.Vector2>, ?uvRotation:Null<Float>, ?uvScale:Null<flight.esm.types.geometry.Types.Vector2>, ?dimension:Null<String>, ?resource:Null<flight.esm.types.texture_contract.Types.TextureResourceReference> };

typedef CreateTextureOptions = Dynamic;

typedef CubeTexture = { colorSpace:flight.esm.types.texture_contract.Types.TextureColorSpace, sampler:flight.esm.types.texture_contract.Types.Sampler, version:Float, flipX:Bool, flipY:Bool, uvOffset:flight.esm.types.geometry.Types.Vector2, uvRotation:Float, uvScale:flight.esm.types.geometry.Types.Vector2, dimension:String, sources:flight.esm.types.texture_contract.Types.TextureSourceCubeFaces };

typedef PixelFormat = String;

typedef Sampler = { anisotropy:Float, magFilter:flight.esm.types.texture_contract.Types.TextureFilter, minFilter:flight.esm.types.texture_contract.Types.TextureFilter, mipmaps:Bool, wrapU:flight.esm.types.texture_contract.Types.TextureWrap, wrapV:flight.esm.types.texture_contract.Types.TextureWrap };

typedef SamplerLike = { anisotropy:Float, magFilter:flight.esm.types.texture_contract.Types.TextureFilter, minFilter:flight.esm.types.texture_contract.Types.TextureFilter, mipmaps:Bool, wrapU:flight.esm.types.texture_contract.Types.TextureWrap, wrapV:flight.esm.types.texture_contract.Types.TextureWrap };

typedef Texture = Dynamic;

typedef Texture2D = { dimension:String, source:Null<flight.esm.types.texture_contract.Types.TextureSource>, colorSpace:flight.esm.types.texture_contract.Types.TextureColorSpace, sampler:flight.esm.types.texture_contract.Types.Sampler, version:Float, flipX:Bool, flipY:Bool, uvOffset:flight.esm.types.geometry.Types.Vector2, uvRotation:Float, uvScale:flight.esm.types.geometry.Types.Vector2 };

typedef TextureColorSpace = String;

typedef TextureDimension = String;

typedef TextureFilter = String;

typedef TextureLike = Dynamic;

typedef TextureResolutionExplanation = { kind:Null<String>, status:flight.esm.types.texture_contract.Types.TextureResolutionStatus };

typedef TextureResolutionStatus = String;

typedef TextureResourceReference = { ?textures:Null<Array<flight.esm.types.texture_contract.Types.Texture>> };

typedef TextureSource = { alphaType:flight.esm.types.texture_contract.Types.AlphaType, gamut:String, height:Float, kind:String, version:Float, width:Float };

typedef TextureSourceCubeFaces = Array<Null<flight.esm.types.texture_contract.Types.TextureSource>>;

typedef TextureSourceKind = String;

typedef TextureUvTransform = { flipX:Bool, flipY:Bool, uvOffset:flight.esm.types.geometry.Types.Vector2, uvRotation:Float, uvScale:flight.esm.types.geometry.Types.Vector2 };

typedef TextureWrap = String;

typedef VoxelGrid = { data:js.lib.Uint8Array, depth:Float, format:flight.esm.types.texture_contract.Types.PixelFormat, kind:String, alphaType:flight.esm.types.texture_contract.Types.AlphaType, gamut:String, height:Float, version:Float, width:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
