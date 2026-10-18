// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/compression/contract.hpp")
extern class Attempt_Compression_compressLzma extends AttemptConfig {
  @:native("flight::compression::compress_lzma")
  public static function compressLzma(bytes:flight._internal._UInt8Array):flight._internal._UInt8Array;
}
#end
