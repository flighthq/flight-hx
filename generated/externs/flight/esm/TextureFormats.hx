package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/texture-formats")
extern class TextureFormats {
  public static function computeTextureContainerLevels(format:flight.esm.types.texture_formats.Types.TextureContainerFormat, baseWidth:Float, baseHeight:Float, mipLevels:Float, layers:Float, faces:Float, startOffset:Float):Dynamic;
  public static function detectTextureContainer(bytes:js.lib.Uint8Array):Null<String>;
  public static function explainTextureContainerParse(bytes:js.lib.Uint8Array):Null<flight.esm.types.texture_formats.Types.TextureContainerParseExplanation>;
  public static function getAtfParseFailureReason(bytes:js.lib.Uint8Array):Null<String>;
  public static function getBasisParseFailureReason(bytes:js.lib.Uint8Array):Null<String>;
  public static function getDdsParseFailureReason(bytes:js.lib.Uint8Array):Null<String>;
  public static function getKtx2ParseFailureReason(bytes:js.lib.Uint8Array):Null<String>;
  public static function getTextureContainerLevelByteLength(format:flight.esm.types.texture_formats.Types.TextureContainerFormat, width:Float, height:Float):Float;
  public static function parseAtf(bytes:js.lib.Uint8Array):Null<Array<flight.esm.types.texture_formats.Types.TextureContainer>>;
  public static function parseBasis(bytes:js.lib.Uint8Array):Null<flight.esm.types.texture_formats.Types.TextureContainer>;
  public static function parseDds(bytes:js.lib.Uint8Array):Null<flight.esm.types.texture_formats.Types.TextureContainer>;
  public static function parseKtx2(bytes:js.lib.Uint8Array):Null<flight.esm.types.texture_formats.Types.TextureContainer>;
  public static function selectTextureContainer(containers:Array<flight.esm.types.texture_formats.Types.TextureContainer>, supportedFormats:Array<flight.esm.types.texture_formats.Types.TextureContainerFormat>):Null<flight.esm.types.texture_formats.Types.TextureContainer>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
