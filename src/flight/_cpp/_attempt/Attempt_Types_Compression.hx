// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_Compression extends AttemptConfig {
  @:native("flight::types::compression")
  public static var Compression:{ Brotli:String, Deflate:String, Lzma:String };
}
#end
