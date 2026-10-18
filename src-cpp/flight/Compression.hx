// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

typedef Compression = flight._cpp.Compression;

var DISTANCE_BASE(get, set):Array<Float>;

private extern inline function get_DISTANCE_BASE():Array<Float> return flight._cpp._attempt.Attempt_Compression_DISTANCE_BASE.DISTANCE_BASE;

private extern inline function set_DISTANCE_BASE(value:Array<Float>):Array<Float> return flight._cpp._attempt.Attempt_Compression_DISTANCE_BASE.DISTANCE_BASE = value;

var DISTANCE_EXTRA(get, set):Array<Float>;

private extern inline function get_DISTANCE_EXTRA():Array<Float> return flight._cpp._attempt.Attempt_Compression_DISTANCE_EXTRA.DISTANCE_EXTRA;

private extern inline function set_DISTANCE_EXTRA(value:Array<Float>):Array<Float> return flight._cpp._attempt.Attempt_Compression_DISTANCE_EXTRA.DISTANCE_EXTRA = value;

var LENGTH_BASE(get, set):Array<Float>;

private extern inline function get_LENGTH_BASE():Array<Float> return flight._cpp._attempt.Attempt_Compression_LENGTH_BASE.LENGTH_BASE;

private extern inline function set_LENGTH_BASE(value:Array<Float>):Array<Float> return flight._cpp._attempt.Attempt_Compression_LENGTH_BASE.LENGTH_BASE = value;

var LENGTH_EXTRA(get, set):Array<Float>;

private extern inline function get_LENGTH_EXTRA():Array<Float> return flight._cpp._attempt.Attempt_Compression_LENGTH_EXTRA.LENGTH_EXTRA;

private extern inline function set_LENGTH_EXTRA(value:Array<Float>):Array<Float> return flight._cpp._attempt.Attempt_Compression_LENGTH_EXTRA.LENGTH_EXTRA = value;

extern inline function compressDeflate(bytes:flight._internal._UInt8Array):flight._internal._UInt8Array {
  return flight._cpp._attempt.Attempt_Compression_compressDeflate.compressDeflate(bytes);
}

extern inline function compressDeflateZlib(bytes:flight._internal._UInt8Array):flight._internal._UInt8Array {
  return flight._cpp._attempt.Attempt_Compression_compressDeflateZlib.compressDeflateZlib(bytes);
}

extern inline function compressLzma(bytes:flight._internal._UInt8Array):flight._internal._UInt8Array {
  return flight._cpp._attempt.Attempt_Compression_compressLzma.compressLzma(bytes);
}

extern inline function computeAdler32(input:flight._internal._UInt8Array):Float {
  return flight._cpp._attempt.Attempt_Compression_computeAdler32.computeAdler32(input);
}

var decompressDeflate(get, set):Decompressor;

private extern inline function get_decompressDeflate():Decompressor return flight._cpp._attempt.Attempt_Compression_decompressDeflate.decompressDeflate;

private extern inline function set_decompressDeflate(value:Decompressor):Decompressor return flight._cpp._attempt.Attempt_Compression_decompressDeflate.decompressDeflate = value;

var decompressLzma(get, set):Decompressor;

private extern inline function get_decompressLzma():Decompressor return flight._cpp._attempt.Attempt_Compression_decompressLzma.decompressLzma;

private extern inline function set_decompressLzma(value:Decompressor):Decompressor return flight._cpp._attempt.Attempt_Compression_decompressLzma.decompressLzma = value;

var sdkHostCompressDeflate(get, set):HostCompressDeflateCapability;

private extern inline function get_sdkHostCompressDeflate():HostCompressDeflateCapability return flight._cpp._attempt.Attempt_Compression_sdkHostCompressDeflate.sdkHostCompressDeflate;

private extern inline function set_sdkHostCompressDeflate(value:HostCompressDeflateCapability):HostCompressDeflateCapability return flight._cpp._attempt.Attempt_Compression_sdkHostCompressDeflate.sdkHostCompressDeflate = value;

var sdkHostCompressLzma(get, set):HostCompressLzmaCapability;

private extern inline function get_sdkHostCompressLzma():HostCompressLzmaCapability return flight._cpp._attempt.Attempt_Compression_sdkHostCompressLzma.sdkHostCompressLzma;

private extern inline function set_sdkHostCompressLzma(value:HostCompressLzmaCapability):HostCompressLzmaCapability return flight._cpp._attempt.Attempt_Compression_sdkHostCompressLzma.sdkHostCompressLzma = value;

var sdkHostDecompressDeflate(get, set):HostDecompressDeflateCapability;

private extern inline function get_sdkHostDecompressDeflate():HostDecompressDeflateCapability return flight._cpp._attempt.Attempt_Compression_sdkHostDecompressDeflate.sdkHostDecompressDeflate;

private extern inline function set_sdkHostDecompressDeflate(value:HostDecompressDeflateCapability):HostDecompressDeflateCapability return flight._cpp._attempt.Attempt_Compression_sdkHostDecompressDeflate.sdkHostDecompressDeflate = value;

var sdkHostDecompressLzma(get, set):HostDecompressLzmaCapability;

private extern inline function get_sdkHostDecompressLzma():HostDecompressLzmaCapability return flight._cpp._attempt.Attempt_Compression_sdkHostDecompressLzma.sdkHostDecompressLzma;

private extern inline function set_sdkHostDecompressLzma(value:HostDecompressLzmaCapability):HostDecompressLzmaCapability return flight._cpp._attempt.Attempt_Compression_sdkHostDecompressLzma.sdkHostDecompressLzma = value;
