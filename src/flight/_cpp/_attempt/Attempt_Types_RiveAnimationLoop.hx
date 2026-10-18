// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_RiveAnimationLoop extends AttemptConfig {
  @:native("flight::types::rive_animation_loop")
  public static var RiveAnimationLoop:{ OneShot:String, Loop:String, PingPong:String };
}
#end
