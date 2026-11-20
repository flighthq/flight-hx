package flight.esm.types.font_formats;

#if (js && flight_esm)
typedef CffIndex = { endOffset:Float, entries:Array<flight.esm.types.font_formats.Types.CffIndexEntry> };

typedef CffIndexEntry = { end:Float, start:Float };

typedef CffTable = { charstrings:Array<flight.esm.types.font_formats.Types.CffIndexEntry>, globalSubrs:Array<flight.esm.types.font_formats.Types.CffIndexEntry>, localSubrs:Array<flight.esm.types.font_formats.Types.CffIndexEntry>, localSubrsByGlyph:Null<Array<Array<flight.esm.types.font_formats.Types.CffIndexEntry>>> };

typedef OpenTypeFontExplanation = { accepted:Bool, reason:flight.esm.types.font_formats.Types.OpenTypeFontExplanationReason, format:String, table:String, tableCount:Float, readableTableCount:Float };

typedef OpenTypeFontExplanationReason = String;

typedef SfntTableDirectory = { declaredTableCount:Float, sfntVersion:Float, tables:js.lib.Map<String, flight.esm.types.font_formats.Types.SfntTableRange> };

typedef SfntTableRange = { length:Float, offset:Float };

typedef SyntheticCidOptions = { fdSelect:Array<Float>, pools:Array<Array<js.lib.Uint8Array>> };

typedef SyntheticFontOptions = { ?advances:Null<Array<Float>>, ?codepoints:Null<js.lib.Map<Float, Float>>, ?charstrings:Null<Array<js.lib.Uint8Array>>, ?cid:Null<flight.esm.types.font_formats.Types.SyntheticCidOptions>, ?glyphs:Null<Array<flight.esm.types.font_formats.Types.SyntheticGlyph>>, ?flavor:Null<String>, ?omitTable:Null<String>, ?unitsPerEm:Null<Float> };

typedef SyntheticGlyph = { endPoints:Array<Float>, points:Array<Array<Dynamic>> };

typedef Woff2GlyfStreams = { bboxStream:js.lib.Uint8Array, compositeStream:js.lib.Uint8Array, flagStream:js.lib.Uint8Array, glyphCount:Float, glyphStream:js.lib.Uint8Array, indexFormat:Float, instructionStream:js.lib.Uint8Array, nContourStream:js.lib.Uint8Array, nPointsStream:js.lib.Uint8Array };

typedef Woff2TableDirectory = { entries:Array<flight.esm.types.font_formats.Types.Woff2TableEntry>, streamStart:Float, totalUncompressedLength:Float };

typedef Woff2TableEntry = { originalLength:Float, tag:String, transformLength:Float, transformVersion:Float, transformed:Bool };

typedef WoffChecksumMismatch = { stored:Float, computed:Float, tag:String };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
