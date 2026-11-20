package flight.esm.types.sdk_textshaper;

#if (js && flight_esm)
typedef CanvasTextShaperBackend = flight.esm.types.textshaper.Types.CanvasTextShaperBackend;

typedef FontMetrics = flight.esm.types.textshaper.Types.FontMetrics;

typedef GlyphExtents = flight.esm.types.textshaper.Types.GlyphExtents;

typedef HostTextShaperCapabilities = flight.esm.types.textshaper.Types.HostTextShaperCapabilities;

typedef HostTextShaperCapability = flight.esm.types.textshaper.Types.HostTextShaperCapability;

typedef ShapeRunOptions = flight.esm.types.textshaper.Types.ShapeRunOptions;

typedef ShapedGlyph = flight.esm.types.textshaper.Types.ShapedGlyph;

typedef ShapedRun = flight.esm.types.textshaper.Types.ShapedRun;

typedef TextDirection = flight.esm.types.textshaper.Types.TextDirection;

typedef TextFeature = flight.esm.types.textshaper.Types.TextFeature;

typedef TextItem = flight.esm.types.textshaper.Types.TextItem;

typedef TextMeasureFunction = flight.esm.types.textshaper.Types.TextMeasureFunction;

typedef TextShaperCache = flight.esm.types.textshaper.Types.TextShaperCache;

typedef TextShaperOperation = flight.esm.types.textshaper.Types.TextShaperOperation;

typedef TextShaperOptions = flight.esm.types.textshaper.Types.TextShaperOptions;

typedef TextShaperSignals = flight.esm.types.textshaper.Types.TextShaperSignals;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
