// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_initializeSpring2D extends AttemptConfig {
  @:native("flight::spring::initialize_spring_2d")
  public static function initializeSpring2D(out:flight.EntityConstruction<flight.Spring2D>, ?valueX:Float, ?valueY:Float, ?velocityX:Float, ?velocityY:Float):Void;
}
#end
