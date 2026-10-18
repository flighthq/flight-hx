// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_BlendMode extends AttemptConfig {
  @:native("flight::types::blend_mode")
  public static var BlendMode:{ Add:String, Darken:String, Lighten:String, Multiply:String, Normal:String, Screen:String };
}
#end
