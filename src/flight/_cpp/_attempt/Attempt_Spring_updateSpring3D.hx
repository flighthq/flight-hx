// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_updateSpring3D extends AttemptConfig {
  @:native("flight::spring::update_spring_3d")
  public static function updateSpring3D(spring3D:flight.Spring3D, targetX:Float, targetY:Float, targetZ:Float, config:flight.SpringConfig, deltaTime:Float):Void;
}
#end
