// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_ModifierSlot extends AttemptConfig {
  @:native("flight::types::modifier_slot")
  public static var ModifierSlot:{ Diffuse:String, Effect:String, Emissive:String, Normal:String, Specular:String, Vertex:String };
}
#end
