// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_AdvancedBlendMode extends AttemptConfig {
  @:native("flight::types::advanced_blend_mode")
  public static var AdvancedBlendMode:{ Color:String, ColorBurn:String, ColorDodge:String, Darken:String, Difference:String, Exclusion:String, HardLight:String, Hue:String, Lighten:String, Luminosity:String, Overlay:String, Saturation:String, SoftLight:String };
}
#end
