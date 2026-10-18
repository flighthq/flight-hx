// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/geolocation/contract.hpp")
extern class Attempt_Geolocation_getCurrentGeolocationPosition extends AttemptConfig {
  @:native("flight::geolocation::get_current_geolocation_position")
  public static function getCurrentGeolocationPosition(hostGeolocation:flight.HostGeolocationCapability, ?options:flight.GeolocationRequestOptions):flight._internal._Promise<Null<flight.GeolocationPosition>>;
}
#end
