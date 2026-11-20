package flight.esm.types.bitmapfont_contract;

#if (js && flight_esm)
typedef BitmapFont = { encoding:flight.esm.types.bitmapfont_contract.Types.BitmapFontEncoding, glyphs:js.lib.Map<Float, flight.esm.types.glyphatlas_contract.Types.GlyphEntry>, kerning:js.lib.Map<Float, Float>, metrics:flight.esm.types.font.Types.GlyphMetrics, pages:Array<Null<flight.esm.types.textureatlas_contract.Types.TextureAtlas>> };

typedef BitmapFontData = { ?encoding:Null<String>, glyphs:Array<flight.esm.types.bitmapfont_contract.Types.BitmapFontGlyphData>, ?kerning:Null<Array<flight.esm.types.bitmapfont_contract.Types.BitmapFontKerningData>>, metrics:flight.esm.types.font.Types.GlyphMetrics, pages:Array<Null<flight.esm.types.textureatlas_contract.Types.TextureAtlas>> };

typedef BitmapFontEncoding = String;

typedef BitmapFontGlyphData = { advance:Float, bearingX:Float, bearingY:Float, codepoint:Float, height:Float, ?page:Null<Float>, width:Float, x:Float, y:Float };

typedef BitmapFontGlyphExplanation = { renderable:Bool, reason:flight.esm.types.bitmapfont_contract.Types.BitmapFontGlyphExplanationReason, page:Float, pageCount:Float, glyphWidth:Float, glyphHeight:Float };

typedef BitmapFontGlyphExplanationReason = String;

typedef BitmapFontKerningData = { amount:Float, left:Float, right:Float };

typedef BitmapFontKerningPair = { left:Float, right:Float };

typedef BitmapFontParseOptions = { ?resolvePage:Null<((pageId:Float, file:String) -> Null<flight.esm.types.textureatlas_contract.Types.TextureAtlas>)> };

typedef BitmapFontSummary = { glyphCount:Float, kerningPairCount:Float, pageCount:Float, byteSize:Float, minCodepoint:Float, maxCodepoint:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
