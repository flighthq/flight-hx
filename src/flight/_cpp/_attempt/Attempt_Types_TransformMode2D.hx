// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_TransformMode2D extends AttemptConfig {
  @:native("flight::types::transform_mode_2d")
  public static var TransformMode2D:{ Normal:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, OnlyTranslation:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, NoRotationOrReflection:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, NoScale:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool }, NoScaleOrReflection:{ reflection:Bool, rotation:Bool, scale:Bool, translation:Bool } };
}
#end
