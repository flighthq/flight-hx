package flight.esm.types.spritesheet_formats;

#if (js && flight_esm)
typedef AsepriteArrayDocument = { frames:Array<flight.esm.types.spritesheet_formats.Types.AsepriteArrayFrame>, meta:flight.esm.types.spritesheet_formats.Types.AsepriteMeta };

typedef AsepriteArrayFrame = { filename:String, duration:Float, frame:flight.esm.types.spritesheet_formats.Types.AsepriteRect, rotated:Bool, sourceSize:flight.esm.types.spritesheet_formats.Types.AsepriteSize, spriteSourceSize:flight.esm.types.spritesheet_formats.Types.AsepriteRect, trimmed:Bool };

typedef AsepriteBaseFrame = { duration:Float, frame:flight.esm.types.spritesheet_formats.Types.AsepriteRect, rotated:Bool, sourceSize:flight.esm.types.spritesheet_formats.Types.AsepriteSize, spriteSourceSize:flight.esm.types.spritesheet_formats.Types.AsepriteRect, trimmed:Bool };

typedef AsepriteDocument = Dynamic;

typedef AsepriteFrameTag = { direction:String, from:Float, name:String, to:Float, ?color:Null<String> };

typedef AsepriteHashDocument = { frames:Dynamic, meta:flight.esm.types.spritesheet_formats.Types.AsepriteMeta };

typedef AsepriteHashFrame = flight.esm.types.spritesheet_formats.Types.AsepriteBaseFrame;

typedef AsepriteLayer = { blendMode:String, name:String, opacity:Float };

typedef AsepriteMeta = { app:String, format:String, frameTags:Array<flight.esm.types.spritesheet_formats.Types.AsepriteFrameTag>, image:String, ?layers:Null<Array<flight.esm.types.spritesheet_formats.Types.AsepriteLayer>>, scale:Dynamic, size:flight.esm.types.spritesheet_formats.Types.AsepriteSize, ?slices:Null<Array<Dynamic>>, version:String };

typedef AsepriteParsed = { data:flight.esm.types.spritesheet.Types.SpritesheetData, document:flight.esm.types.spritesheet_formats.Types.AsepriteDocument };

typedef AsepriteRect = { h:Float, w:Float, x:Float, y:Float };

typedef AsepriteSerializeOptions = { ?variant:Null<String> };

typedef AsepriteSize = { h:Float, w:Float };

typedef CocosPlistDocument = { frames:Dynamic, metadata:flight.esm.types.spritesheet_formats.Types.CocosPlistMetadata };

typedef CocosPlistFrame = { frame:String, spriteOffset:String, spriteSize:String, spriteSourceSize:String, spriteTrimmed:Bool, textureRotated:Bool, ?aliases:Null<Array<String>> };

typedef CocosPlistMetadata = { format:Float, size:String, textureFileName:String };

typedef CocosPlistParsed = { data:flight.esm.types.spritesheet.Types.SpritesheetData, document:flight.esm.types.spritesheet_formats.Types.CocosPlistDocument };

typedef LibgdxAtlasDocument = { pages:Array<flight.esm.types.spritesheet_formats.Types.LibgdxAtlasPage> };

typedef LibgdxAtlasPage = { filterMag:String, filterMin:String, format:String, imageFile:String, regions:Array<flight.esm.types.spritesheet_formats.Types.LibgdxAtlasRegion>, repeat:String, size:Array<Float> };

typedef LibgdxAtlasParseOptions = { ?frameDuration:Null<Float> };

typedef LibgdxAtlasRegion = { index:Float, name:String, offset:Array<Float>, orig:Array<Float>, origSize:Array<Float>, rotate:Bool, size:Array<Float>, xy:Array<Float> };

typedef SpritesheetFormatDescriptor = { entry:flight.esm.types.spritesheet_formats.Types.SpritesheetFormatEntry, kind:String };

typedef SpritesheetFormatEntry = { detect:((text:String) -> Bool), parse:((text:String, options:flight.esm.types.spritesheet_formats.Types.SpritesheetParseOptions) -> flight.esm.types.spritesheet.Types.SpritesheetData) };

typedef SpritesheetFormatKind = String;

typedef SpritesheetImportOptions = { ?formats:Null<Array<flight.esm.types.spritesheet_formats.Types.SpritesheetFormatDescriptor>> };

typedef SpritesheetParseOptions = { ?frameDuration:Null<Float>, ?imageHeight:Null<Float>, ?imageWidth:Null<Float> };

typedef StarlingDocument = { imagePath:String, subTextures:Array<flight.esm.types.spritesheet_formats.Types.StarlingSubTexture> };

typedef StarlingParseOptions = { ?frameDuration:Null<Float>, ?imageHeight:Null<Float>, ?imageWidth:Null<Float> };

typedef StarlingParsed = { data:flight.esm.types.spritesheet.Types.SpritesheetData, document:flight.esm.types.spritesheet_formats.Types.StarlingDocument };

typedef StarlingSubTexture = { ?frameHeight:Null<Float>, ?frameWidth:Null<Float>, ?frameX:Null<Float>, ?frameY:Null<Float>, height:Float, name:String, ?pivotX:Null<Float>, ?pivotY:Null<Float>, ?rotated:Null<Bool>, width:Float, x:Float, y:Float };

typedef TexturePackerArrayDocument = { frames:Array<flight.esm.types.spritesheet_formats.Types.TexturePackerArrayFrame>, meta:flight.esm.types.spritesheet_formats.Types.TexturePackerMeta };

typedef TexturePackerArrayFrame = { filename:String, frame:flight.esm.types.spritesheet_formats.Types.TexturePackerRect, ?pivot:Null<flight.esm.types.spritesheet_formats.Types.TexturePackerPivot>, rotated:Bool, sourceSize:flight.esm.types.spritesheet_formats.Types.TexturePackerSize, spriteSourceSize:flight.esm.types.spritesheet_formats.Types.TexturePackerRect, trimmed:Bool };

typedef TexturePackerDocument = Dynamic;

typedef TexturePackerFrameTag = { direction:String, from:Float, name:String, to:Float };

typedef TexturePackerHashDocument = { frames:Dynamic, meta:flight.esm.types.spritesheet_formats.Types.TexturePackerMeta };

typedef TexturePackerHashFrame = { frame:flight.esm.types.spritesheet_formats.Types.TexturePackerRect, ?pivot:Null<flight.esm.types.spritesheet_formats.Types.TexturePackerPivot>, rotated:Bool, sourceSize:flight.esm.types.spritesheet_formats.Types.TexturePackerSize, spriteSourceSize:flight.esm.types.spritesheet_formats.Types.TexturePackerRect, trimmed:Bool };

typedef TexturePackerMeta = { app:String, format:String, ?frameTags:Null<Array<flight.esm.types.spritesheet_formats.Types.TexturePackerFrameTag>>, image:String, scale:Dynamic, size:flight.esm.types.spritesheet_formats.Types.TexturePackerSize, version:String };

typedef TexturePackerParsed = { data:flight.esm.types.spritesheet.Types.SpritesheetData, document:flight.esm.types.spritesheet_formats.Types.TexturePackerDocument };

typedef TexturePackerPivot = { x:Float, y:Float };

typedef TexturePackerRect = { h:Float, w:Float, x:Float, y:Float };

typedef TexturePackerSerializeOptions = { ?variant:Null<String> };

typedef TexturePackerSize = { h:Float, w:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
