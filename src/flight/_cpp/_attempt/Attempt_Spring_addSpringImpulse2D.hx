// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_addSpringImpulse2D extends AttemptConfig {
  @:native("flight::spring::add_spring_impulse_2d")
  public static function addSpringImpulse2D(spring2D:flight.Spring2D, velocityX:Float, velocityY:Float):Void;
}
#end
