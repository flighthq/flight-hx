// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_resetSpring3D extends AttemptConfig {
  @:native("flight::spring::reset_spring_3d")
  public static function resetSpring3D(spring3D:flight.Spring3D, valueX:Float, valueY:Float, valueZ:Float, ?velocityX:Float, ?velocityY:Float, ?velocityZ:Float):Void;
}
#end
