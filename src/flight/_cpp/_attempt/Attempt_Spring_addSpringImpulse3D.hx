// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_addSpringImpulse3D extends AttemptConfig {
  @:native("flight::spring::add_spring_impulse_3d")
  public static function addSpringImpulse3D(spring3D:flight.Spring3D, velocityX:Float, velocityY:Float, velocityZ:Float):Void;
}
#end
