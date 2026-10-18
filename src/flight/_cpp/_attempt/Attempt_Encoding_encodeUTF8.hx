// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/encoding/contract.hpp")
extern class Attempt_Encoding_encodeUTF8 extends AttemptConfig {
  @:native("flight::encoding::encode_utf8")
  public static function encodeUTF8(text:String):flight._internal._UInt8Array;
}
#end
