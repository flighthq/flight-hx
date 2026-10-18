// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/geolocation/contract.hpp")
extern class Attempt_Geolocation_createGeolocationPosition extends AttemptConfig {
  @:native("flight::geolocation::create_geolocation_position")
  public static function createGeolocationPosition():flight.GeolocationPosition;
}
#end
