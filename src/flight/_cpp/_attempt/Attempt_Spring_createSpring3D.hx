// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_createSpring3D extends AttemptConfig {
  @:native("flight::spring::create_spring_3d")
  public static function createSpring3D(?valueX:Float, ?valueY:Float, ?valueZ:Float, ?velocityX:Float, ?velocityY:Float, ?velocityZ:Float):flight.Spring3D;
}
#end
