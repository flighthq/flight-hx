// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/geolocation/contract.hpp")
extern class Attempt_Geolocation_initializeGeolocationPosition extends AttemptConfig {
  @:native("flight::geolocation::initialize_geolocation_position")
  public static function initializeGeolocationPosition(out:flight.EntityConstruction<flight.GeolocationPosition>):Void;
}
#end
