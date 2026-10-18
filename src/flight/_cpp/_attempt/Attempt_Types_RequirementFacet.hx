// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_RequirementFacet extends AttemptConfig {
  @:native("flight::types::requirement_facet")
  public static var RequirementFacet:{ CompressionKind:String, DocumentFormat:String, Physics2DJointKind:String, SceneBlendMode:String, SceneMaterialKind:String, SceneModifierKind:String, SceneNodeKind:String, SceneResourceMimeType:String, SceneShapeCommand:String, SceneTextureSourceKind:String };
}
#end
