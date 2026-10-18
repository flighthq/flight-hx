// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_GamepadButtonKind extends AttemptConfig {
  @:native("flight::types::gamepad_button_kind")
  public static var GamepadButtonKind:{ BUTTON_EAST:String, BUTTON_NORTH:String, BUTTON_SOUTH:String, BUTTON_WEST:String, DPAD_DOWN:String, DPAD_LEFT:String, DPAD_RIGHT:String, DPAD_UP:String, HOME:String, SELECT:String, SHOULDER_LEFT:String, SHOULDER_RIGHT:String, START:String, STICK_LEFT:String, STICK_RIGHT:String, TOUCHPAD:String, TRIGGER_LEFT:String, TRIGGER_RIGHT:String };
}
#end
