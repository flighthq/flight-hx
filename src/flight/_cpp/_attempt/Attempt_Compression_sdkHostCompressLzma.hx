// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/compression/contract.hpp")
extern class Attempt_Compression_sdkHostCompressLzma extends AttemptConfig {
  @:native("flight::compression::sdk_host_compress_lzma")
  public static var sdkHostCompressLzma:HostCompressLzmaCapability;
}
#end
