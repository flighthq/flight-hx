// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_EmissiveModifierFacing extends AttemptConfig {
  @:native("flight::types::emissive_modifier_facing")
  public static var EmissiveModifierFacing:{ AwayFromLight:String, Ignore:String, TowardLight:String };
}
#end
