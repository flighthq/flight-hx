// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_isSpring3DSettled extends AttemptConfig {
  @:native("flight::spring::is_spring_3d_settled")
  public static function isSpring3DSettled(spring3D:flight.Spring3D, targetX:Float, targetY:Float, targetZ:Float, ?positionEpsilon:Float, ?velocityEpsilon:Float):Bool;
}
#end
