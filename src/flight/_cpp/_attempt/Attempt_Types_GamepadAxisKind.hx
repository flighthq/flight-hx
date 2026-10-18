// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_GamepadAxisKind extends AttemptConfig {
  @:native("flight::types::gamepad_axis_kind")
  public static var GamepadAxisKind:{ STICK_LEFT_X:String, STICK_LEFT_Y:String, STICK_RIGHT_X:String, STICK_RIGHT_Y:String };
}
#end
