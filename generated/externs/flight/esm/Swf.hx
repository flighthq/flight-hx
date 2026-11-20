package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/swf")
extern class Swf {
  public static final SWF_LOSSLESS_ALPHA_MIME_TYPE:String;
  public static final SWF_LOSSLESS_MIME_TYPE:String;
  public static final SWF_NON_CONTENT_TAGS:js.lib.Set<Float>;
  public static final SWF_TAG_NAMES:js.lib.Map<Float, String>;
  public static function areSwfGuardsEnabled():Bool;
  public static function collectSwfContentCapabilities(source:js.lib.Uint8Array, deflate:Null<flight.esm.types.compression.Types.HostDecompressDeflateCapability>, lzma:Null<flight.esm.types.compression.Types.HostDecompressLzmaCapability>):Null<flight.esm.types.swf.Types.SwfContentCapabilities>;
  public static function createGlyphOutlineSourcesFromSwf(source:js.lib.Uint8Array, options:flight.esm.types.swf.Types.SwfParseOptions, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<js.lib.Map<Float, flight.esm.types.font.Types.GlyphOutlineSource>>;
  public static function createScene2DFromSwf(source:js.lib.Uint8Array, options:flight.esm.types.swf.Types.SwfParseOptions, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<flight.esm.types.scene2d_resources_contract.Types.Scene2DDocument>;
  public static function createScene2DImportFromSwf(source:js.lib.Uint8Array, options:flight.esm.types.swf.Types.SwfParseOptions, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<flight.esm.types.swf.Types.SwfDocumentImport>;
  public static function createScene2DSymbolFromSwf(source:js.lib.Uint8Array, linkageName:String, options:flight.esm.types.swf.Types.SwfParseOptions, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<flight.esm.types.scene2d_resources_contract.Types.Scene2DDocument>;
  public static function createSwfGlyphShape(reader:flight.esm.types.swf_contract.Types.SwfReader):Null<flight.esm.types.shape.Types.Shape>;
  public static function createSwfJpegAlphaBitmap(decoded:flight.esm.types.image_codec_contract.Types.DecodedImage, payload:flight.esm.types.swf.Types.SwfJpegAlphaPayload, deflate:flight.esm.types.compression.Types.HostDecompressDeflateCapability):Null<flight.esm.types.bitmap.Types.Bitmap>;
  public static function createSwfLosslessBitmap(payload:js.lib.Uint8Array, hasAlpha:Bool, deflate:flight.esm.types.compression.Types.HostDecompressDeflateCapability):Null<flight.esm.types.bitmap.Types.Bitmap>;
  public static function createSwfMorphShape(reader:flight.esm.types.swf_contract.Types.SwfReader, version:Float, ?resolveBitmapFill:Null<((characterId:Float, repeat:Bool, smoothed:Bool) -> Null<flight.esm.types.texture_contract.Types.Texture2D>)>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<flight.esm.types.shape.Types.MorphShape>;
  public static function createSwfShape(reader:flight.esm.types.swf_contract.Types.SwfReader, version:Float, ?resolveBitmapFill:Null<((characterId:Float, repeat:Bool, smoothed:Bool) -> Null<flight.esm.types.texture_contract.Types.Texture2D>)>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<flight.esm.types.shape.Types.Shape>;
  public static function createSwfTextShape(reader:flight.esm.types.swf_contract.Types.SwfReader, version:Float, fonts:js.lib.Map<Float, flight.esm.types.font.Types.GlyphOutlineSource>):Null<flight.esm.types.shape.Types.Shape>;
  public static function decodeSwfImage(bytes:js.lib.Uint8Array, mimeType:String, deflate:flight.esm.types.compression.Types.HostDecompressDeflateCapability, ?options:Null<flight.esm.types.image_codec_contract.Types.ImageDecodeOptions>):js.lib.Promise<Null<flight.esm.types.image_codec_contract.Types.DecodedImage>>;
  public static function disableSwfGuards():Void;
  public static function enableSwfGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function isKnownSwfTag(code:Float):Bool;
  public static function mergeSwfParseOptions(...options:Dynamic):flight.esm.types.swf.Types.SwfParseOptions;
  public static function parseSwfHeader(source:js.lib.Uint8Array, deflate:Null<flight.esm.types.compression.Types.HostDecompressDeflateCapability>, lzma:Null<flight.esm.types.compression.Types.HostDecompressLzmaCapability>):Null<flight.esm.types.swf.Types.SwfHeader>;
  public static function readSwfAbcFrameScripts(source:js.lib.Uint8Array, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<js.lib.Map<String, js.lib.Map<Float, flight.esm.types.timeline.Types.FrameScript>>>;
  public static function readSwfEditTextFactory(reader:flight.esm.types.swf_contract.Types.SwfReader, width:Float, height:Float):Null<((resolveFontName:Dynamic) -> flight.esm.types.text.Types.RichText)>;
  public static function readSwfExportedSymbolNames(source:js.lib.Uint8Array, options:flight.esm.types.swf.Types.SwfParseOptions):Array<String>;
  public static function readSwfFilterList(reader:flight.esm.types.swf_contract.Types.SwfReader, outEffects:Array<flight.esm.types.effects.Types.Effect>, outAdjustments:Array<flight.esm.types.adjustments_contract.Types.Adjustment>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Bool;
  public static function readSwfFontGlyphOutlineSource(reader:flight.esm.types.swf_contract.Types.SwfReader, version:Float, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>, ?characterId:Float):Null<flight.esm.types.font.Types.GlyphOutlineSource>;
  public static function readSwfFontGlyphs(reader:flight.esm.types.swf_contract.Types.SwfReader, version:Float):Null<Array<Null<flight.esm.types.shape.Types.Shape>>>;
  public static function readSwfFrameActions(reader:flight.esm.types.swf_contract.Types.SwfReader):Null<flight.esm.types.timeline.Types.FrameScript>;
  public static function readSwfMorphShapePaths(startReader:flight.esm.types.swf_contract.Types.SwfReader, endReader:flight.esm.types.swf_contract.Types.SwfReader):Null<flight.esm.types.swf.Types.SwfMorphShapePaths>;
  public static function registerSwfScene2DDocumentImporter(importers:flight.esm.types.scene2d_resources_contract.Types.Scene2DDocumentImporterRegistry, options:flight.esm.types.swf.Types.SwfParseOptions):Void;
  public static function resolveSwfFontUnitsPerEm(version:Float):Float;
  public static final swfAllTagHandlers:Array<flight.esm.types.swf.Types.SwfTagHandler>;
  public static final swfBitmapTagFamily:Array<flight.esm.types.swf.Types.SwfTagHandler>;
  public static final swfControlHandler:flight.esm.types.swf.Types.SwfTagHandler;
  public static final swfControlTagFamily:Array<flight.esm.types.swf.Types.SwfTagHandler>;
  public static final swfDefineMorphShapeHandler:flight.esm.types.swf.Types.SwfTagHandler;
  public static final swfDefineShapeHandler:flight.esm.types.swf.Types.SwfTagHandler;
  public static final swfEditTextHandler:flight.esm.types.swf.Types.SwfTagHandler;
  public static final swfFontHandler:flight.esm.types.swf.Types.SwfTagHandler;
  public static final swfFontTagFamily:Array<flight.esm.types.swf.Types.SwfTagHandler>;
  public static final swfJpegBitmapHandler:flight.esm.types.swf.Types.SwfTagHandler;
  public static final swfLosslessBitmapHandler:flight.esm.types.swf.Types.SwfTagHandler;
  public static final swfPlaceObject3Handler:flight.esm.types.swf.Types.SwfTagHandler;
  public static final swfPlaceObjectHandler:flight.esm.types.swf.Types.SwfTagHandler;
  public static final swfPlacementTagFamily:Array<flight.esm.types.swf.Types.SwfTagHandler>;
  public static final swfScriptHandler:flight.esm.types.swf.Types.SwfTagHandler;
  public static final swfScriptTagFamily:Array<flight.esm.types.swf.Types.SwfTagHandler>;
  public static final swfShapeTagFamily:Array<flight.esm.types.swf.Types.SwfTagHandler>;
  public static final swfSoundHandler:flight.esm.types.swf.Types.SwfTagHandler;
  public static final swfSoundTagFamily:Array<flight.esm.types.swf.Types.SwfTagHandler>;
  public static final swfSpriteHandler:flight.esm.types.swf.Types.SwfTagHandler;
  public static final swfSpriteTagFamily:Array<flight.esm.types.swf.Types.SwfTagHandler>;
  public static final swfStaticTextHandler:flight.esm.types.swf.Types.SwfTagHandler;
  public static final swfTextTagFamily:Array<flight.esm.types.swf.Types.SwfTagHandler>;
  public static final swfVideoHandler:flight.esm.types.swf.Types.SwfTagHandler;
  public static final swfVideoTagFamily:Array<flight.esm.types.swf.Types.SwfTagHandler>;
  public static function uncompressSwfSource(source:js.lib.Uint8Array, deflate:Null<flight.esm.types.compression.Types.HostDecompressDeflateCapability>, lzma:Null<flight.esm.types.compression.Types.HostDecompressLzmaCapability>, ?diagnostics:Null<Array<flight.esm.types.importdiagnostics_contract.Types.ImportDiagnostic>>):Null<js.lib.Uint8Array>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
