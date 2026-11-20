package flight.esm.font;

#if (js && flight_esm)
@:jsRequire("@flighthq/font/contract")
extern class Contract {
  public static function _loadFontFaceFromBytes(backend:flight.esm.types.font.Types.HostFontLoadingCapability, family:String, bytes:js.lib.Uint8Array):js.lib.Promise<Dynamic>;
  public static function _loadFontFaceFromUrl(backend:flight.esm.types.font.Types.HostFontLoadingCapability, family:String, url:String):js.lib.Promise<Dynamic>;
  public static function _loadFontFaceFromUrls(backend:flight.esm.types.font.Types.HostFontLoadingCapability, family:String, sources:Array<flight.esm.types.font.Types.FontUrl>):js.lib.Promise<Dynamic>;
  public static function _loadFontFacesFromName(backend:flight.esm.types.font.Types.HostFontLoadingCapability, family:String):js.lib.Promise<Array<Dynamic>>;
  public static function allocateGlyphRasterizerBackendFromGlyphOutlineSource(source:flight.esm.types.font.Types.GlyphOutlineSource):flight.esm.types.font.Types.HostGlyphRasterizerCapability;
  public static function createFontResource(family:String):flight.esm.types.font.Types.FontResource;
  public static function detectFontFormat(bytes:Dynamic):Null<String>;
  public static function getFontShorthand(family:String, ?style:Null<String>):String;
  public static function inferFontFormatFromUrl(url:String):Null<String>;
  public static function initializeFontResource(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.font.Types.FontResource>, family:String):Void;
  public static function initializeGlyphRasterizerBackendFromGlyphOutlineSource(out:flight.esm.types.font.Types.HostGlyphRasterizerCapability, source:flight.esm.types.font.Types.GlyphOutlineSource):Void;
  public static function isFontLoaded(backend:flight.esm.types.font.Types.HostFontLoadingCapability, family:String, ?style:Null<String>):Bool;
  public static function loadFontResourceFromBytes(hostFontLoading:flight.esm.types.font.Types.HostFontLoadingCapability, out:flight.esm.types.font.Types.FontResource, bytes:js.lib.Uint8Array):js.lib.Promise<flight.esm.types.font.Types.FontResource>;
  public static function loadFontResourceFromName(hostFontLoading:flight.esm.types.font.Types.HostFontLoadingCapability, out:flight.esm.types.font.Types.FontResource):js.lib.Promise<flight.esm.types.font.Types.FontResource>;
  public static function loadFontResourceFromUrl(hostFontLoading:flight.esm.types.font.Types.HostFontLoadingCapability, out:flight.esm.types.font.Types.FontResource, url:String):js.lib.Promise<flight.esm.types.font.Types.FontResource>;
  public static function loadFontResourceFromUrls(hostFontLoading:flight.esm.types.font.Types.HostFontLoadingCapability, out:flight.esm.types.font.Types.FontResource, sources:Array<flight.esm.types.font.Types.FontUrl>):js.lib.Promise<flight.esm.types.font.Types.FontResource>;
  public static function whenFontsReady(backend:flight.esm.types.font.Types.HostFontLoadingCapability):js.lib.Promise<Void>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
