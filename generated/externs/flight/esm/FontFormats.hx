package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/font-formats")
extern class FontFormats {
  public static final CFF_OPERATOR_CHARSTRINGS:Float;
  public static final CFF_OPERATOR_FD_ARRAY:Float;
  public static final CFF_OPERATOR_FD_SELECT:Float;
  public static final CFF_OPERATOR_PRIVATE:Float;
  public static final CFF_OPERATOR_ROS:Float;
  public static final CFF_OPERATOR_SUBRS:Float;
  public static final WOFF2_COMPRESSION:flight.esm.types.compression.Types.Compression;
  public static final WOFF_COMPRESSION:flight.esm.types.compression.Types.Compression;
  public static function assembleSfntFont(flavor:Float, tables:Array<Dynamic>):js.lib.Uint8Array;
  public static function cffOperand(value:Float):Float;
  public static function cffSubroutineBias(count:Float):Float;
  public static function computeSfntTableChecksum(data:js.lib.Uint8Array, ?isHeadTable:Bool):Float;
  public static function createGlyphOutlineSourceFromOpenTypeFont(source:js.lib.Uint8Array, deflate:flight.esm.types.compression.Types.HostDecompressDeflateCapability, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Dynamic;
  public static function createSyntheticFont(?options:flight.esm.types.font_formats.Types.SyntheticFontOptions):js.lib.Uint8Array;
  public static function createWoff2TransformReverser():((tag:String, transformed:js.lib.Uint8Array, tables:js.lib.Map<String, js.lib.Uint8Array>) -> Null<js.lib.Uint8Array>);
  public static function decodeWoff2Triplet(code:Float, glyphStream:js.lib.Uint8Array, at:Float):Dynamic;
  public static function emptySyntheticGlyph():flight.esm.types.font_formats.Types.SyntheticGlyph;
  public static function encodeSfntCompositeGlyph(components:js.lib.Uint8Array, instructions:js.lib.Uint8Array, bounds:Dynamic, hasInstructions:Bool):js.lib.Uint8Array;
  public static function encodeSfntLoca(glyphLengths:Array<Float>, indexFormat:Float):Null<js.lib.Uint8Array>;
  public static function encodeSfntSimpleGlyph(endPtsOfContours:Array<Float>, xs:Array<Float>, ys:Array<Float>, onCurve:Array<Bool>, instructions:js.lib.Uint8Array, bounds:Dynamic):js.lib.Uint8Array;
  public static function encodeSyntheticCff(charstrings:Array<js.lib.Uint8Array>, ?cid:Null<flight.esm.types.font_formats.Types.SyntheticCidOptions>):js.lib.Uint8Array;
  public static function encodeSyntheticWoff(sfnt:js.lib.Uint8Array, ?reverseTableOrder:Bool):js.lib.Uint8Array;
  public static function encodeSyntheticWoff2(sfnt:js.lib.Uint8Array, ?transformTags:Array<String>):js.lib.Uint8Array;
  public static function explainOpenTypeFont(bytes:js.lib.Uint8Array, deflate:flight.esm.types.compression.Types.HostDecompressDeflateCapability):flight.esm.types.font_formats.Types.OpenTypeFontExplanation;
  public static function findOpenTypeUnicodeSubtable(view:js.lib.DataView, cmapOffset:Float, cmapLength:Float, byteLength:Float):Float;
  public static function getWoff2BboxBitmapByteLength(glyphCount:Float):Float;
  public static function hasWoff2GlyphBbox(bboxStream:js.lib.Uint8Array, glyphIndex:Float):Bool;
  public static function isWoff2PointOnCurve(flag:Float):Bool;
  public static function measureWoff2CompositeGlyph(compositeStream:js.lib.Uint8Array, at:Float):Dynamic;
  public static function packSfntTag(tag:String):Float;
  public static function rankOpenTypeUnicodeEncoding(platform:Float, encoding:Float):Float;
  public static function readCffDict(bytes:js.lib.Uint8Array, start:Float, end:Float):Null<js.lib.Map<Float, Array<Float>>>;
  public static function readCffFdSelect(bytes:js.lib.Uint8Array, offset:Float, glyphCount:Float):Null<js.lib.Uint8Array>;
  public static function readCffIndex(bytes:js.lib.Uint8Array, offset:Float):Null<flight.esm.types.font_formats.Types.CffIndex>;
  public static function readCffTable(bytes:js.lib.Uint8Array, directory:flight.esm.types.font_formats.Types.SfntTableDirectory):Null<flight.esm.types.font_formats.Types.CffTable>;
  public static function readOpenTypeAdvances(bytes:js.lib.Uint8Array, directory:flight.esm.types.font_formats.Types.SfntTableDirectory, glyphCount:Float):Null<js.lib.Int32Array>;
  public static function readOpenTypeCodepointMap(bytes:js.lib.Uint8Array, directory:flight.esm.types.font_formats.Types.SfntTableDirectory):Null<js.lib.Map<Float, Float>>;
  public static function readOpenTypeGlyphCount(bytes:js.lib.Uint8Array, directory:flight.esm.types.font_formats.Types.SfntTableDirectory):Float;
  public static function readOpenTypeGlyphOutline(out:flight.esm.types.path_contract.Types.PathRaw, bytes:js.lib.Uint8Array, directory:flight.esm.types.font_formats.Types.SfntTableDirectory, ranges:js.lib.Uint32Array, glyphIndex:Float):Bool;
  public static function readOpenTypeGlyphRanges(bytes:js.lib.Uint8Array, directory:flight.esm.types.font_formats.Types.SfntTableDirectory, glyphCount:Float, locaFormat:Float):Null<js.lib.Uint32Array>;
  public static function readOpenTypeLocaFormat(bytes:js.lib.Uint8Array, directory:flight.esm.types.font_formats.Types.SfntTableDirectory):Float;
  public static function readOpenTypeMetrics(bytes:js.lib.Uint8Array, directory:flight.esm.types.font_formats.Types.SfntTableDirectory):Null<flight.esm.types.font.Types.GlyphOutlineMetrics>;
  public static function readSfntTableDirectory(bytes:js.lib.Uint8Array):Null<flight.esm.types.font_formats.Types.SfntTableDirectory>;
  public static function readSfntTag(bytes:js.lib.Uint8Array, offset:Float):String;
  public static function readWoff2Font(bytes:js.lib.Uint8Array, decompress:Null<flight.esm.types.compression.Types.Decompressor>, reverseTransform:Null<((tag:String, transformed:js.lib.Uint8Array, tables:js.lib.Map<String, js.lib.Uint8Array>) -> Null<js.lib.Uint8Array>)>):Null<js.lib.Uint8Array>;
  public static function readWoff2GlyfStreams(transformed:js.lib.Uint8Array):Null<flight.esm.types.font_formats.Types.Woff2GlyfStreams>;
  public static function readWoff2Short(bytes:js.lib.Uint8Array, cursor:Dynamic, end:Float):Float;
  public static function readWoff2TableDirectory(bytes:js.lib.Uint8Array):Null<flight.esm.types.font_formats.Types.Woff2TableDirectory>;
  public static function readWoffChecksumMismatches(bytes:js.lib.Uint8Array, decompress:flight.esm.types.compression.Types.Decompressor):Array<flight.esm.types.font_formats.Types.WoffChecksumMismatch>;
  public static function readWoffFont(bytes:js.lib.Uint8Array, decompress:flight.esm.types.compression.Types.Decompressor, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<js.lib.Uint8Array>;
  public static function reverseWoff2GlyfTransform(streams:flight.esm.types.font_formats.Types.Woff2GlyfStreams):Dynamic;
  public static function ringSyntheticGlyph(?reverseCounter:Bool, ?flipBoth:Bool):flight.esm.types.font_formats.Types.SyntheticGlyph;
  public static function runCffCharstring(out:flight.esm.types.path_contract.Types.PathRaw, bytes:js.lib.Uint8Array, charstring:Dynamic, localSubrs:Array<Dynamic>, globalSubrs:Array<Dynamic>):Bool;
  public static function squareSyntheticGlyph(size:Float):flight.esm.types.font_formats.Types.SyntheticGlyph;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
