// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/keyboard/contract.hpp")
extern class Attempt_Keyboard_isSoftKeyboardVisible extends AttemptConfig {
  @:native("flight::keyboard::is_soft_keyboard_visible")
  public static function isSoftKeyboardVisible(hostSoftKeyboardInfo:flight.HostSoftKeyboardInfoCapability):Bool;
}
#end
