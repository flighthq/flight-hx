package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/compression")
extern class Compression {
  public static final Compression:Dynamic;
  public static final CompressionFraming:Dynamic;
  public static function compressDeflate(bytes:js.lib.Uint8Array):js.lib.Uint8Array;
  public static function compressDeflateZlib(bytes:js.lib.Uint8Array):js.lib.Uint8Array;
  public static function compressLzma(bytes:js.lib.Uint8Array):js.lib.Uint8Array;
  public static function decompressDeflate(compressed:js.lib.Uint8Array, uncompressedLength:Float, framing:flight.esm.types.compression.Types.CompressionFraming):Null<js.lib.Uint8Array>;
  public static function decompressLzma(compressed:js.lib.Uint8Array, uncompressedLength:Float, framing:flight.esm.types.compression.Types.CompressionFraming):Null<js.lib.Uint8Array>;
  public static final sdkHostCompressDeflate:flight.esm.types.compression.Types.HostCompressDeflateCapability;
  public static final sdkHostCompressLzma:flight.esm.types.compression.Types.HostCompressLzmaCapability;
  public static final sdkHostDecompressDeflate:flight.esm.types.compression.Types.HostDecompressDeflateCapability;
  public static final sdkHostDecompressLzma:flight.esm.types.compression.Types.HostDecompressLzmaCapability;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
