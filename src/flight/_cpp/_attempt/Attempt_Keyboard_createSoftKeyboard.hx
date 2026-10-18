// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/keyboard/contract.hpp")
extern class Attempt_Keyboard_createSoftKeyboard extends AttemptConfig {
  @:native("flight::keyboard::create_soft_keyboard")
  public static function createSoftKeyboard():Dynamic;
}
#end
