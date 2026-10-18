// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_KeyModifier extends AttemptConfig {
  @:native("flight::types::key_modifier")
  public static var KeyModifier:{ ALT:Float, CAPS_LOCK:Float, CTRL:Float, LEFT_ALT:Float, LEFT_CTRL:Float, LEFT_META:Float, LEFT_SHIFT:Float, META:Float, MODE:Float, NONE:Float, NUM_LOCK:Float, RIGHT_ALT:Float, RIGHT_CTRL:Float, RIGHT_META:Float, RIGHT_SHIFT:Float, SHIFT:Float };
}
#end
