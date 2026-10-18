// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_isSpring2DSettled extends AttemptConfig {
  @:native("flight::spring::is_spring_2d_settled")
  public static function isSpring2DSettled(spring2D:flight.Spring2D, targetX:Float, targetY:Float, ?positionEpsilon:Float, ?velocityEpsilon:Float):Bool;
}
#end
