// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/keyboard/contract.hpp")
extern class Attempt_Keyboard_attachSoftKeyboard extends AttemptConfig {
  @:native("flight::keyboard::attach_soft_keyboard")
  public static function attachSoftKeyboard(hostSoftKeyboardChange:flight.HostSoftKeyboardChangeCapability, hostSoftKeyboardInfo:flight.HostSoftKeyboardInfoCapability, keyboard:flight.SoftKeyboard):flight._internal._Promise<flight.SoftKeyboardAttachResult>;
}
#end
