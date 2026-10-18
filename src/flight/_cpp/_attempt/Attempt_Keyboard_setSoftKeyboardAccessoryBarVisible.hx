// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/keyboard/contract.hpp")
extern class Attempt_Keyboard_setSoftKeyboardAccessoryBarVisible extends AttemptConfig {
  @:native("flight::keyboard::set_soft_keyboard_accessory_bar_visible")
  public static function setSoftKeyboardAccessoryBarVisible(hostSoftKeyboardAccessoryBar:flight.HostSoftKeyboardAccessoryBarCapability, visible:Bool):flight._internal._Promise<flight.SoftKeyboardSetterResult>;
}
#end
