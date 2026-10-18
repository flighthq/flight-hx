// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/input/contract.hpp")
extern class Attempt_Input_applyGamepadStickDeadZone extends AttemptConfig {
  @:native("flight::input::apply_gamepad_stick_dead_zone")
  public static function applyGamepadStickDeadZone(out:{ x:Float, y:Float }, x:Float, y:Float, deadZone:Float):Void;
}
#end
