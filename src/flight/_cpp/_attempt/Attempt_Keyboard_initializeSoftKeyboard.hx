// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/keyboard/contract.hpp")
extern class Attempt_Keyboard_initializeSoftKeyboard extends AttemptConfig {
  @:native("flight::keyboard::initialize_soft_keyboard")
  public static function initializeSoftKeyboard(out:flight.EntityConstruction<Dynamic>):Void;
}
#end
