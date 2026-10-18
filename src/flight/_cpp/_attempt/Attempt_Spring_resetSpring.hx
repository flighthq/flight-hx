// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/spring/contract.hpp")
extern class Attempt_Spring_resetSpring extends AttemptConfig {
  @:native("flight::spring::reset_spring")
  public static function resetSpring(spring:flight.Spring, value:Float, ?velocity:Float):Void;
}
#end
