// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_addSpringImpulse extends AttemptConfig {
  @:native("flight::spring::add_spring_impulse")
  public static function addSpringImpulse(spring:flight.Spring, velocity:Float):Void;
}
#end
