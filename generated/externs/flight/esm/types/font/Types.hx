package flight.esm.types.font;

#if (js && flight_esm)
typedef FontResource = { family:String, face:Dynamic };

typedef FontUrl = { ?format:Null<String>, url:String };

typedef FontVariationAxis = { defaultValue:Float, max:Float, min:Float, name:String, tag:String };

typedef GlyphMetrics = { ascent:Float, descent:Float, lineGap:Float };

typedef GlyphOutlineMetrics = { ascent:Float, descent:Float, lineGap:Float, unitsPerEm:Float };

typedef GlyphOutlineSource = { getGlyphOutline:((out:flight.esm.types.path_contract.Types.PathRaw, glyphIndex:Float) -> Bool), getGlyphOutlineAdvance:((glyphIndex:Float) -> Float), getGlyphOutlineIndexForCodePoint:((codePoint:Float) -> Float), getGlyphOutlineMetrics:(() -> flight.esm.types.font.Types.GlyphOutlineMetrics) };

typedef GlyphRasterizeOptions = { fontFamily:String, fontSize:Float, ?fontStyle:Null<String>, ?fontWeight:Dynamic };

typedef GlyphRasterizedBitmap = { advance:Float, bearingX:Float, bearingY:Float, height:Float, pixels:js.lib.Uint8Array, width:Float };

typedef GlyphRasterizerOperation = String;

typedef HostFontLoadingCapability = { addFontFace:((face:Dynamic) -> Void), checkFontFace:((shorthand:String) -> Bool), loadFontFaces:((shorthand:String) -> js.lib.Promise<Array<Dynamic>>), whenReady:(() -> js.lib.Promise<Void>) };

typedef HostGlyphRasterizerCapability = { rasterize:((codepoint:Float, options:flight.esm.types.font.Types.GlyphRasterizeOptions) -> Null<flight.esm.types.font.Types.GlyphRasterizedBitmap>), ?measureMetrics:Null<((options:flight.esm.types.font.Types.GlyphRasterizeOptions) -> Null<flight.esm.types.font.Types.GlyphMetrics>)> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
