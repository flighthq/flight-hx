// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/input/contract.hpp")
extern class Attempt_Input_getGamepadButtonName extends AttemptConfig {
  @:native("flight::input::get_gamepad_button_name")
  public static function getGamepadButtonName(mapping:flight.GamepadMappingKind, index:Float):Null<flight.GamepadButtonKind>;
}
#end
