// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_createSpring extends AttemptConfig {
  @:native("flight::spring::create_spring")
  public static function createSpring(?value:Float, ?velocity:Float):flight.Spring;
}
#end
