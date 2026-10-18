// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_isVelocityZero extends AttemptConfig {
  @:native("flight::velocity::is_velocity_zero")
  public static function isVelocityZero(velocity:flight.Velocity2D, ?epsilon:Float):Bool;
}
#end
