package flight.esm.types.textshaper;

#if (js && flight_esm)
typedef CanvasTextShaperBackend = { clearCache:(() -> Void), ?getCodePointForGlyph:Null<((glyphId:Float) -> Float)>, ?getFontMetrics:Null<((format:flight.esm.types.textformat.Types.TextFormat) -> Null<flight.esm.types.textshaper.Types.FontMetrics>)>, ?getGlyphExtents:Null<((glyphId:Float) -> Null<flight.esm.types.textshaper.Types.GlyphExtents>)>, ?getGlyphIndexForCodePoint:Null<((codePoint:Float) -> Float)>, ?getGlyphName:Null<((glyphId:Float) -> String)>, measureText:flight.esm.types.textshaper.Types.TextMeasureFunction, ?shapeRun:Null<((text:String, format:flight.esm.types.textformat.Types.TextFormat, ?options:Dynamic) -> flight.esm.types.textshaper.Types.ShapedRun)> };

typedef FontMetrics = { ascent:Float, capHeight:Float, descent:Float, lineGap:Float, underlinePosition:Float, underlineThickness:Float, unitsPerEm:Float, xHeight:Float };

typedef GlyphExtents = { height:Float, width:Float, xBearing:Float, yBearing:Float };

typedef HostTextShaperCapabilities = { ?shaper:Null<flight.esm.types.textshaper.Types.HostTextShaperCapability> };

typedef HostTextShaperCapability = { ?getCodePointForGlyph:Null<((glyphId:Float) -> Float)>, ?getFontMetrics:Null<((format:flight.esm.types.textformat.Types.TextFormat) -> Null<flight.esm.types.textshaper.Types.FontMetrics>)>, ?getGlyphExtents:Null<((glyphId:Float) -> Null<flight.esm.types.textshaper.Types.GlyphExtents>)>, ?getGlyphIndexForCodePoint:Null<((codePoint:Float) -> Float)>, ?getGlyphName:Null<((glyphId:Float) -> String)>, measureText:flight.esm.types.textshaper.Types.TextMeasureFunction, ?shapeRun:Null<((text:String, format:flight.esm.types.textformat.Types.TextFormat, ?options:Dynamic) -> flight.esm.types.textshaper.Types.ShapedRun)> };

typedef ShapeRunOptions = { ?direction:Null<String>, ?script:Null<String> };

typedef ShapedGlyph = { cluster:Float, glyphId:Float, xAdvance:Float, xOffset:Float, yAdvance:Float, yOffset:Float };

typedef ShapedRun = { advanceWidth:Float, direction:flight.esm.types.textshaper.Types.TextDirection, font:Null<flight.esm.types.font.Types.FontResource>, glyphCount:Float, glyphs:Array<flight.esm.types.textshaper.Types.ShapedGlyph>, script:String };

typedef TextDirection = String;

typedef TextFeature = { ?end:Null<Float>, ?start:Null<Float>, tag:String, value:Float };

typedef TextItem = { direction:flight.esm.types.textshaper.Types.TextDirection, end:Float, script:String, start:Float };

typedef TextMeasureFunction = ((text:String, format:flight.esm.types.textformat.Types.TextFormat) -> Float);

typedef TextShaperCache = Dynamic;

typedef TextShaperOperation = String;

typedef TextShaperOptions = { ?direction:Null<String>, ?features:Null<Array<flight.esm.types.textshaper.Types.TextFeature>>, ?language:Null<String>, ?script:Null<String>, ?variations:Null<Array<flight.esm.types.textformat.Types.FontVariation>> };

typedef TextShaperSignals = { onBackendChanged:flight.esm.types.signals.Types.Signal<((backend:Null<flight.esm.types.textshaper.Types.HostTextShaperCapability>) -> Void)> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
