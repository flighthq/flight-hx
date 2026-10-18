// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/keyboard/contract.hpp")
extern class Attempt_Keyboard_hideSoftKeyboard extends AttemptConfig {
  @:native("flight::keyboard::hide_soft_keyboard")
  public static function hideSoftKeyboard(hostSoftKeyboardVisibility:flight.HostSoftKeyboardVisibilityCapability):flight._internal._Promise<flight.SoftKeyboardVisibilityResult>;
}
#end
