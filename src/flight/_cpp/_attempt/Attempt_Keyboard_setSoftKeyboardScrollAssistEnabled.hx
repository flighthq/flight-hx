// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/keyboard/contract.hpp")
extern class Attempt_Keyboard_setSoftKeyboardScrollAssistEnabled extends AttemptConfig {
  @:native("flight::keyboard::set_soft_keyboard_scroll_assist_enabled")
  public static function setSoftKeyboardScrollAssistEnabled(hostSoftKeyboardScrollAssist:flight.HostSoftKeyboardScrollAssistCapability, enabled:Bool):flight._internal._Promise<flight.SoftKeyboardSetterResult>;
}
#end
