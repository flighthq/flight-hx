// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_createSpringConfig extends AttemptConfig {
  @:native("flight::spring::create_spring_config")
  public static function createSpringConfig(frequency:Float, dampingRatio:Float):flight.SpringConfig;
}
#end
