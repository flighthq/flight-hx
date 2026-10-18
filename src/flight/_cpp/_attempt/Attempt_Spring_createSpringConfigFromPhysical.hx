// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_createSpringConfigFromPhysical extends AttemptConfig {
  @:native("flight::spring::create_spring_config_from_physical")
  public static function createSpringConfigFromPhysical(stiffness:Float, damping:Float, mass:Float):flight.SpringConfig;
}
#end
