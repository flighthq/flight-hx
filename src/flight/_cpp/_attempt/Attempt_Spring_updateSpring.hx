// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_updateSpring extends AttemptConfig {
  @:native("flight::spring::update_spring")
  public static function updateSpring(spring:flight.Spring, target:Float, config:flight.SpringConfig, deltaTime:Float):Void;
}
#end
