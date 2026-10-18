// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/keyboard/contract.hpp")
extern class Attempt_Keyboard_setSoftKeyboardStyle extends AttemptConfig {
  @:native("flight::keyboard::set_soft_keyboard_style")
  public static function setSoftKeyboardStyle(hostSoftKeyboardStyle:flight.HostSoftKeyboardStyleCapability, style:flight.SoftKeyboardStyleKind):flight._internal._Promise<flight.SoftKeyboardSetterResult>;
}
#end
