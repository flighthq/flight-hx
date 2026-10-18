// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_ImageChannel extends AttemptConfig {
  @:native("flight::types::image_channel")
  public static var ImageChannel:{ Red:Float, Green:Float, Blue:Float, Alpha:Float };
}
#end
