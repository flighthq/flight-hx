package flight.esm.types.textureatlas_formats;

#if (js && flight_esm)
typedef TextureAtlasAsepriteArrayDocument = { frames:Array<flight.esm.types.textureatlas_formats.Types.TextureAtlasAsepriteArrayFrame>, meta:flight.esm.types.textureatlas_formats.Types.TextureAtlasAsepriteMeta };

typedef TextureAtlasAsepriteArrayFrame = { filename:String, duration:Float, frame:flight.esm.types.textureatlas_formats.Types.TextureAtlasAsepriteRect, rotated:Bool, sourceSize:flight.esm.types.textureatlas_formats.Types.TextureAtlasAsepriteSize, spriteSourceSize:flight.esm.types.textureatlas_formats.Types.TextureAtlasAsepriteRect, trimmed:Bool };

typedef TextureAtlasAsepriteBaseFrame = { duration:Float, frame:flight.esm.types.textureatlas_formats.Types.TextureAtlasAsepriteRect, rotated:Bool, sourceSize:flight.esm.types.textureatlas_formats.Types.TextureAtlasAsepriteSize, spriteSourceSize:flight.esm.types.textureatlas_formats.Types.TextureAtlasAsepriteRect, trimmed:Bool };

typedef TextureAtlasAsepriteDocument = Dynamic;

typedef TextureAtlasAsepriteFrameTag = { direction:String, from:Float, name:String, to:Float, ?color:Null<String> };

typedef TextureAtlasAsepriteHashDocument = { frames:Dynamic, meta:flight.esm.types.textureatlas_formats.Types.TextureAtlasAsepriteMeta };

typedef TextureAtlasAsepriteHashFrame = flight.esm.types.textureatlas_formats.Types.TextureAtlasAsepriteBaseFrame;

typedef TextureAtlasAsepriteMeta = { app:String, format:String, ?frameTags:Null<Array<flight.esm.types.textureatlas_formats.Types.TextureAtlasAsepriteFrameTag>>, image:String, scale:Dynamic, size:flight.esm.types.textureatlas_formats.Types.TextureAtlasAsepriteSize, version:String };

typedef TextureAtlasAsepriteRect = { h:Float, w:Float, x:Float, y:Float };

typedef TextureAtlasAsepriteSize = { h:Float, w:Float };

typedef TextureAtlasFormatDescriptor = { entry:flight.esm.types.textureatlas_formats.Types.TextureAtlasFormatEntry, kind:String };

typedef TextureAtlasFormatEntry = { detect:((content:String) -> Bool), parse:((content:String, atlas:flight.esm.types.textureatlas_contract.Types.TextureAtlas, options:flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasParseOptions) -> Void) };

typedef TextureAtlasFormatKind = String;

typedef TextureAtlasImportOptions = { ?formats:Null<Array<flight.esm.types.textureatlas_formats.Types.TextureAtlasFormatDescriptor>> };

typedef TextureAtlasParseOptions = flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasParseOptions;

typedef TexturePackerAtlasArrayDocument = { frames:Array<flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasArrayFrame>, meta:flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasMeta };

typedef TexturePackerAtlasArrayFrame = { filename:String, frame:flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasRect, ?pivot:Null<flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasPivot>, rotated:Bool, sourceSize:flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasSize, spriteSourceSize:flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasRect, trimmed:Bool };

typedef TexturePackerAtlasDocument = Dynamic;

typedef TexturePackerAtlasFrameTag = { ?direction:Null<String>, from:Float, name:String, to:Float };

typedef TexturePackerAtlasHashDocument = { frames:Dynamic, meta:flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasMeta };

typedef TexturePackerAtlasHashFrame = { frame:flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasRect, ?pivot:Null<flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasPivot>, rotated:Bool, sourceSize:flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasSize, spriteSourceSize:flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasRect, trimmed:Bool };

typedef TexturePackerAtlasMeta = { app:String, format:String, ?frameTags:Null<Array<flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasFrameTag>>, image:String, scale:Dynamic, size:flight.esm.types.textureatlas_formats.Types.TexturePackerAtlasSize, version:String };

typedef TexturePackerAtlasParseOptions = { ?stripPathPrefix:Null<Bool> };

typedef TexturePackerAtlasPivot = { x:Float, y:Float };

typedef TexturePackerAtlasRect = { h:Float, w:Float, x:Float, y:Float };

typedef TexturePackerAtlasSize = { h:Float, w:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
