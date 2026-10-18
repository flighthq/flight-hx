// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/compression/contract.hpp")
extern class Attempt_Compression_computeAdler32 extends AttemptConfig {
  @:native("flight::compression::compute_adler32")
  public static function computeAdler32(input:flight._internal._UInt8Array):Float;
}
#end
