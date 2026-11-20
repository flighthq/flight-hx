package flight.esm.types.tilemap_formats;

#if (js && flight_esm)
typedef TiledCompression = String;

typedef TiledGid = { tileId:Float, flipHorizontal:Bool, flipVertical:Bool, flipDiagonal:Bool };

typedef TiledGroupLayer = { type:String, layers:Array<flight.esm.types.tilemap_formats.Types.TiledLayer>, id:Float, name:String, opacity:Float, visible:Bool, offsetX:Float, offsetY:Float, tintColor:Null<Float>, parallaxX:Float, parallaxY:Float, properties:Array<flight.esm.types.tilemap_formats.Types.TiledProperty> };

typedef TiledImageLayer = { type:String, image:String, repeatX:Bool, repeatY:Bool, id:Float, name:String, opacity:Float, visible:Bool, offsetX:Float, offsetY:Float, tintColor:Null<Float>, parallaxX:Float, parallaxY:Float, properties:Array<flight.esm.types.tilemap_formats.Types.TiledProperty> };

typedef TiledInflate = ((bytes:js.lib.Uint8Array, compression:flight.esm.types.tilemap_formats.Types.TiledCompression) -> Null<js.lib.Uint8Array>);

typedef TiledLayer = Dynamic;

typedef TiledLayerBase = { id:Float, name:String, opacity:Float, visible:Bool, offsetX:Float, offsetY:Float, tintColor:Null<Float>, parallaxX:Float, parallaxY:Float, properties:Array<flight.esm.types.tilemap_formats.Types.TiledProperty> };

typedef TiledLayerDataExplanation = { preservedAsZeroGrid:Bool, reason:String };

typedef TiledLayerDataFailure = String;

typedef TiledMap = { version:String, tiledVersion:Null<String>, orientation:flight.esm.types.tilemap_formats.Types.TiledOrientation, renderOrder:flight.esm.types.tilemap_formats.Types.TiledRenderOrder, width:Float, height:Float, tileWidth:Float, tileHeight:Float, infinite:Bool, backgroundColor:Null<Float>, staggerAxis:Null<String>, staggerIndex:Null<String>, hexSideLength:Null<Float>, layers:Array<flight.esm.types.tilemap_formats.Types.TiledLayer>, tilesets:Array<flight.esm.types.tilemap_formats.Types.TiledTilesetRef>, properties:Array<flight.esm.types.tilemap_formats.Types.TiledProperty> };

typedef TiledObject = { id:Float, name:String, type:String, x:Float, y:Float, width:Float, height:Float, gid:Null<Float>, point:Bool, ellipse:Bool, polygon:Null<Array<flight.esm.types.geometry.Types.Vector2Like>>, polyline:Null<Array<flight.esm.types.geometry.Types.Vector2Like>>, rotation:Float, visible:Bool, properties:Array<flight.esm.types.tilemap_formats.Types.TiledProperty> };

typedef TiledObjectAlignment = String;

typedef TiledObjectGroup = { type:String, objects:Array<flight.esm.types.tilemap_formats.Types.TiledObject>, id:Float, name:String, opacity:Float, visible:Bool, offsetX:Float, offsetY:Float, tintColor:Null<Float>, parallaxX:Float, parallaxY:Float, properties:Array<flight.esm.types.tilemap_formats.Types.TiledProperty> };

typedef TiledOrientation = String;

typedef TiledParseOptions = { ?inflate:Null<flight.esm.types.tilemap_formats.Types.TiledInflate> };

typedef TiledProperty = { name:String, type:flight.esm.types.tilemap_formats.Types.TiledPropertyType, value:Dynamic };

typedef TiledPropertyType = String;

typedef TiledRenderOrder = String;

typedef TiledStaggerAxis = String;

typedef TiledStaggerIndex = String;

typedef TiledTileLayer = { type:String, width:Float, height:Float, data:js.lib.Uint32Array, id:Float, name:String, opacity:Float, visible:Bool, offsetX:Float, offsetY:Float, tintColor:Null<Float>, parallaxX:Float, parallaxY:Float, properties:Array<flight.esm.types.tilemap_formats.Types.TiledProperty> };

typedef TiledTileset = { name:String, tileWidth:Float, tileHeight:Float, tileCount:Float, columns:Float, image:Null<String>, imageWidth:Float, imageHeight:Float, margin:Float, spacing:Float, tileOffsetX:Float, tileOffsetY:Float, objectAlignment:flight.esm.types.tilemap_formats.Types.TiledObjectAlignment, tiles:Array<flight.esm.types.tilemap_formats.Types.TiledTilesetTile>, properties:Array<flight.esm.types.tilemap_formats.Types.TiledProperty> };

typedef TiledTilesetRef = { firstGid:Float, source:Null<String>, tileset:Null<flight.esm.types.tilemap_formats.Types.TiledTileset> };

typedef TiledTilesetResolver = ((ref:flight.esm.types.tilemap_formats.Types.TiledTilesetRef) -> Dynamic);

typedef TiledTilesetTile = { id:Float, type:String, properties:Array<flight.esm.types.tilemap_formats.Types.TiledProperty>, animation:Null<Array<flight.esm.types.tilemap_formats.Types.TiledTilesetTileFrame>>, objects:Null<Array<flight.esm.types.tilemap_formats.Types.TiledObject>>, image:Null<String> };

typedef TiledTilesetTileFrame = { tileId:Float, duration:Float };

typedef TilemapFormatDescriptor = { entry:flight.esm.types.tilemap_formats.Types.TilemapFormatEntry, kind:String };

typedef TilemapFormatEntry = { detect:((text:String) -> Bool), parse:((text:String, ?options:Null<flight.esm.types.tilemap_formats.Types.TiledParseOptions>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>) -> Null<flight.esm.types.tilemap_formats.Types.TiledMap>) };

typedef TilemapFormatKind = String;

typedef TilemapImportOptions = { ?mapFormats:Null<Array<flight.esm.types.tilemap_formats.Types.TilemapFormatDescriptor>>, ?tilesetFormats:Null<Array<flight.esm.types.tilemap_formats.Types.TilesetFormatDescriptor>> };

typedef TilesetFormatDescriptor = { entry:flight.esm.types.tilemap_formats.Types.TilesetFormatEntry, kind:String };

typedef TilesetFormatEntry = { detect:((text:String) -> Bool), parse:((text:String, ?options:Null<flight.esm.types.tilemap_formats.Types.TiledParseOptions>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>) -> Null<flight.esm.types.tilemap_formats.Types.TiledTileset>) };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
