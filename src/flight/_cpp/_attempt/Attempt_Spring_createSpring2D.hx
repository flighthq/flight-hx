// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_createSpring2D extends AttemptConfig {
  @:native("flight::spring::create_spring_2d")
  public static function createSpring2D(?valueX:Float, ?valueY:Float, ?velocityX:Float, ?velocityY:Float):flight.Spring2D;
}
#end
