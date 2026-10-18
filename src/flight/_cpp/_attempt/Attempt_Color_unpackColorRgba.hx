// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/color/contract.hpp")
extern class Attempt_Color_unpackColorRgba extends AttemptConfig {
  @:native("flight::color::unpack_color_rgba")
  public static function unpackColorRgba(out:Array<Float>, color:Float):Void;
}
#end
