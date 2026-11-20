package flight.esm.types.glyphatlas_contract;

#if (js && flight_esm)
typedef GlyphAtlas = { runtime:flight.esm.types.glyphatlas_contract.Types.GlyphAtlasRuntime };

typedef GlyphAtlasEntryBlockReason = String;

typedef GlyphAtlasEntryExplanation = { renderable:Bool, reason:flight.esm.types.glyphatlas_contract.Types.GlyphAtlasEntryBlockReason, glyphWidth:Float, glyphHeight:Float, usableWidth:Float, usableHeight:Float };

typedef GlyphAtlasOptions = { fontFamily:String, fontSize:Float, ?fontStyle:Null<String>, ?fontWeight:Null<String>, height:Float, ?maxArea:Null<Float>, ?maxBytes:Null<Float>, ?maxGlyphs:Null<Float>, ?padding:Null<Float>, rasterizerBackend:flight.esm.types.font.Types.HostGlyphRasterizerCapability, width:Float };

typedef GlyphAtlasRuntime = { bitmaps:js.lib.Map<Float, flight.esm.types.font.Types.GlyphRasterizedBitmap>, dirty:Bool, dirtyMaxX:Float, dirtyMaxY:Float, dirtyMinX:Float, dirtyMinY:Float, entries:js.lib.Map<Float, flight.esm.types.glyphatlas_contract.Types.GlyphEntry>, lru:js.lib.Map<Float, Bool>, layoutVersion:Float, maxArea:Float, maxBytes:Float, maxGlyphs:Float, occupiedArea:Float, retainedBytes:Float, metrics:flight.esm.types.font.Types.GlyphMetrics, packBottom:Float, padding:Float, rasterizerBackend:flight.esm.types.font.Types.HostGlyphRasterizerCapability, rasterizeOptions:flight.esm.types.font.Types.GlyphRasterizeOptions, shelves:Array<flight.esm.types.glyphatlas_contract.Types.GlyphAtlasShelf>, bitmap:flight.esm.types.bitmap.Types.Bitmap };

typedef GlyphAtlasShelf = { cursorX:Float, height:Float, y:Float };

typedef GlyphEntry = { advance:Float, bearingX:Float, bearingY:Float, height:Float, page:Float, width:Float, x:Float, y:Float };

typedef GlyphSource = { getGlyphAtlasImage:((?page:Null<Float>) -> Null<flight.esm.types.texture_contract.Types.TextureSource>), getGlyphEntry:((codepoint:Float) -> Null<flight.esm.types.glyphatlas_contract.Types.GlyphEntry>), getGlyphKerning:((left:Float, right:Float) -> Float), getGlyphLayoutVersion:(() -> Float), getGlyphMetrics:(() -> flight.esm.types.font.Types.GlyphMetrics) };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
