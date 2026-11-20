package flight.esm.types.bitmapfont_formats;

#if (js && flight_esm)
typedef BitmapFontCharRecord = { height:Float, id:Float, page:Float, width:Float, x:Float, xadvance:Float, xoffset:Float, y:Float, yoffset:Float };

typedef BitmapFontFormatDescriptor = { entry:flight.esm.types.bitmapfont_formats.Types.BitmapFontFormatEntry, kind:String };

typedef BitmapFontFormatEntry = { detect:((bytes:js.lib.Uint8Array) -> Bool), parse:((bytes:js.lib.Uint8Array, ?options:Null<flight.esm.types.bitmapfont_contract.Types.BitmapFontParseOptions>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>) -> Null<flight.esm.types.bitmapfont_contract.Types.BitmapFont>) };

typedef BitmapFontFormatKind = String;

typedef BitmapFontImportOptions = { ?formats:Null<Array<flight.esm.types.bitmapfont_formats.Types.BitmapFontFormatDescriptor>> };

typedef BitmapFontKerningRecord = { amount:Float, first:Float, second:Float };

typedef BitmapFontPageRecord = { file:String, id:Float };

typedef BitmapFontParseExplanation = { charCount:Float, detectedFormat:flight.esm.types.bitmapfont_formats.Types.BitmapFontParseExplanationFormat, kerningCount:Float, pageCount:Float, reason:flight.esm.types.bitmapfont_formats.Types.BitmapFontParseExplanationReason, success:Bool, unresolvedPages:Array<Float> };

typedef BitmapFontParseExplanationFormat = String;

typedef BitmapFontParseExplanationReason = String;

typedef BitmapFontRecord = { base:Float, chars:Array<flight.esm.types.bitmapfont_formats.Types.BitmapFontCharRecord>, encoding:flight.esm.types.bitmapfont_contract.Types.BitmapFontEncoding, kernings:Array<flight.esm.types.bitmapfont_formats.Types.BitmapFontKerningRecord>, lineHeight:Float, pages:Array<flight.esm.types.bitmapfont_formats.Types.BitmapFontPageRecord> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
