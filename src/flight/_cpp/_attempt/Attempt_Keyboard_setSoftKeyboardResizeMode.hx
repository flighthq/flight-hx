// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/keyboard/contract.hpp")
extern class Attempt_Keyboard_setSoftKeyboardResizeMode extends AttemptConfig {
  @:native("flight::keyboard::set_soft_keyboard_resize_mode")
  public static function setSoftKeyboardResizeMode(hostSoftKeyboardResizeModeWrite:flight.HostSoftKeyboardResizeModeWriteCapability, mode:flight.SoftKeyboardResizeMode):flight._internal._Promise<flight.SoftKeyboardSetterResult>;
}
#end
