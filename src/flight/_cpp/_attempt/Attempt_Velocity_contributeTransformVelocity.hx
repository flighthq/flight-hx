// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_contributeTransformVelocity extends AttemptConfig {
  @:native("flight::velocity::contribute_transform_velocity")
  public static function contributeTransformVelocity<Traits:Dynamic>(field:flight.VelocityField, root:flight.Transform2DNode<Traits>):Void;
}
#end
