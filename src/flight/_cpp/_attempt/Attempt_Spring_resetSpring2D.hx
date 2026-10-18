// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_resetSpring2D extends AttemptConfig {
  @:native("flight::spring::reset_spring_2d")
  public static function resetSpring2D(spring2D:flight.Spring2D, valueX:Float, valueY:Float, ?velocityX:Float, ?velocityY:Float):Void;
}
#end
