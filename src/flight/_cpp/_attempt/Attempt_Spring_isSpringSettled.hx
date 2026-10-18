// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_isSpringSettled extends AttemptConfig {
  @:native("flight::spring::is_spring_settled")
  public static function isSpringSettled(spring:flight.Spring, target:Float, ?positionEpsilon:Float, ?velocityEpsilon:Float):Bool;
}
#end
