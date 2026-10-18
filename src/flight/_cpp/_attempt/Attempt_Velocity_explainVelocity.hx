// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_explainVelocity extends AttemptConfig {
  @:native("flight::velocity::explain_velocity")
  public static function explainVelocity(field:flight.VelocityField, source:Dynamic):flight.VelocityExplanation;
}
#end
