// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/geolocation/contract.hpp")
extern class Attempt_Geolocation_isGeolocationAvailable extends AttemptConfig {
  @:native("flight::geolocation::is_geolocation_available")
  public static function isGeolocationAvailable(hostGeolocation:flight.HostGeolocationCapability):Bool;
}
#end
