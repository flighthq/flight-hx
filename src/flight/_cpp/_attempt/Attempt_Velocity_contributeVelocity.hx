// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_contributeVelocity extends AttemptConfig {
  @:native("flight::velocity::contribute_velocity")
  public static function contributeVelocity(field:flight.VelocityField, source:Dynamic, x:Float, y:Float):Void;
}
#end
