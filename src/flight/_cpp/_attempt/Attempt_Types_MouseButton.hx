// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_MouseButton extends AttemptConfig {
  @:native("flight::types::mouse_button")
  public static var MouseButton:{ LEFT:Float, MIDDLE:Float, RIGHT:Float };
}
#end
