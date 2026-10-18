// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/encoding/contract.hpp")
extern class Attempt_Encoding_decodeUTF8 extends AttemptConfig {
  @:native("flight::encoding::decode_utf8")
  public static function decodeUTF8(bytes:flight._internal._UInt8Array, ?offset:Float, ?length:Float):String;
}
#end
