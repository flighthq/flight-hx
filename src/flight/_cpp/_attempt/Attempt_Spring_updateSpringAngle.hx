// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_updateSpringAngle extends AttemptConfig {
  @:native("flight::spring::update_spring_angle")
  public static function updateSpringAngle(spring:flight.Spring, target:Float, fullTurn:Float, config:flight.SpringConfig, deltaTime:Float):Void;
}
#end
