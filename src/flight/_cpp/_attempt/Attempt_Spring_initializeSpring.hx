// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_initializeSpring extends AttemptConfig {
  @:native("flight::spring::initialize_spring")
  public static function initializeSpring(out:flight.EntityConstruction<flight.Spring>, ?value:Float, ?velocity:Float):Void;
}
#end
