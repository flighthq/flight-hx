// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_updateSpring2D extends AttemptConfig {
  @:native("flight::spring::update_spring_2d")
  public static function updateSpring2D(spring2D:flight.Spring2D, targetX:Float, targetY:Float, config:flight.SpringConfig, deltaTime:Float):Void;
}
#end
