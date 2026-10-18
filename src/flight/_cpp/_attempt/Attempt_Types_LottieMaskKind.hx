// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_LottieMaskKind extends AttemptConfig {
  @:native("flight::types::lottie_mask_kind")
  public static var LottieMaskKind:{ Additive:String, Darken:String, Difference:String, Intersect:String, Lighten:String, None:String, Subtract:String };
}
#end
