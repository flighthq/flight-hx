// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_FogModifierMode extends AttemptConfig {
  @:native("flight::types::fog_modifier_mode")
  public static var FogModifierMode:{ Exponential:String, Exponential2:String, Linear:String };
}
#end
