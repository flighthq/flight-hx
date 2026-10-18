// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_SpineBinarySectionKind extends AttemptConfig {
  @:native("flight::types::spine_binary_section_kind")
  public static var SpineBinarySectionKind:{ Animations:String, Bones:String, Events:String, IkConstraints:String, PathConstraints:String, Skins:String, Slots:String, TransformConstraints:String };
}
#end
