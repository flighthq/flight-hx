package flight.esm.types.sdk_font;

#if (js && flight_esm)
typedef FontResource = flight.esm.types.font.Types.FontResource;

typedef FontUrl = flight.esm.types.font.Types.FontUrl;

typedef FontVariationAxis = flight.esm.types.font.Types.FontVariationAxis;

typedef GlyphMetrics = flight.esm.types.font.Types.GlyphMetrics;

typedef GlyphOutlineMetrics = flight.esm.types.font.Types.GlyphOutlineMetrics;

typedef GlyphOutlineSource = flight.esm.types.font.Types.GlyphOutlineSource;

typedef GlyphRasterizeOptions = flight.esm.types.font.Types.GlyphRasterizeOptions;

typedef GlyphRasterizedBitmap = flight.esm.types.font.Types.GlyphRasterizedBitmap;

typedef GlyphRasterizerOperation = flight.esm.types.font.Types.GlyphRasterizerOperation;

typedef HostFontLoadingCapability = flight.esm.types.font.Types.HostFontLoadingCapability;

typedef HostGlyphRasterizerCapability = flight.esm.types.font.Types.HostGlyphRasterizerCapability;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
