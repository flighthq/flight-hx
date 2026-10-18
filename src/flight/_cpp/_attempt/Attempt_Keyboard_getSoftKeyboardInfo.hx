// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/keyboard/contract.hpp")
extern class Attempt_Keyboard_getSoftKeyboardInfo extends AttemptConfig {
  @:native("flight::keyboard::get_soft_keyboard_info")
  public static function getSoftKeyboardInfo(hostSoftKeyboardInfo:flight.HostSoftKeyboardInfoCapability, out:flight.SoftKeyboardInfo):flight.SoftKeyboardInfo;
}
#end
