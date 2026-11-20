package flight.esm.types.textureatlas_contract;

#if (js && flight_esm)
typedef GridSliceOptions = { columns:Float, ?frameHeight:Null<Float>, ?frameWidth:Null<Float>, imageFile:String, imageHeight:Float, imageWidth:Float, ?marginX:Null<Float>, ?marginY:Null<Float>, ?namePrefix:Null<String>, rows:Float, ?spacingX:Null<Float>, ?spacingY:Null<Float> };

typedef TextureAtlas = { imageHeight:Float, imageName:Null<String>, imageWidth:Float, regions:Array<flight.esm.types.textureatlas_contract.Types.TextureAtlasRegion>, scale:Float, texture:Null<flight.esm.types.texture_contract.Types.Texture2D> };

typedef TextureAtlasRegion = { height:Float, id:Float, name:Null<String>, originalHeight:Null<Float>, originalWidth:Null<Float>, pageName:Null<String>, pivotX:Null<Float>, pivotY:Null<Float>, rotation:flight.esm.types.textureatlas.Types.TextureAtlasRotation, sourceX:Float, sourceY:Float, trimmed:Bool, x:Float, y:Float, width:Float };

typedef TextureAtlasRegionLike = { height:Float, width:Float, x:Float, y:Float, pivotX:Null<Float>, pivotY:Null<Float>, rotation:flight.esm.types.textureatlas.Types.TextureAtlasRotation, name:Null<String>, id:Float, originalHeight:Null<Float>, originalWidth:Null<Float>, pageName:Null<String>, sourceX:Float, sourceY:Float, trimmed:Bool };

typedef TextureAtlasRegionTextureExplanation = { status:flight.esm.types.textureatlas_contract.Types.TextureAtlasRegionTextureStatus };

typedef TextureAtlasRegionTextureGuard = ((atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas, regionId:Float, explanation:flight.esm.types.textureatlas_contract.Types.TextureAtlasRegionTextureExplanation) -> Void);

typedef TextureAtlasRegionTextureStatus = String;

typedef TextureAtlasRotation = flight.esm.types.textureatlas.Types.TextureAtlasRotation;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
