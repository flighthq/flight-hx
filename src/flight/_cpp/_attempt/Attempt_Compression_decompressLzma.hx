// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/compression/contract.hpp")
extern class Attempt_Compression_decompressLzma extends AttemptConfig {
  @:native("flight::compression::decompress_lzma")
  public static var decompressLzma:Decompressor;
}
#end
