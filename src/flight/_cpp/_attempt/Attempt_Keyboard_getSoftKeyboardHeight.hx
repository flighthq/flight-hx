// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/keyboard/contract.hpp")
extern class Attempt_Keyboard_getSoftKeyboardHeight extends AttemptConfig {
  @:native("flight::keyboard::get_soft_keyboard_height")
  public static function getSoftKeyboardHeight(hostSoftKeyboardInfo:flight.HostSoftKeyboardInfoCapability):Float;
}
#end
