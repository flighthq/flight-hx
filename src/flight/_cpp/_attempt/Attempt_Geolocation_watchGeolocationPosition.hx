// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/geolocation/contract.hpp")
extern class Attempt_Geolocation_watchGeolocationPosition extends AttemptConfig {
  @:native("flight::geolocation::watch_geolocation_position")
  public static function watchGeolocationPosition(hostGeolocation:flight.HostGeolocationCapability, handler:(flight.GeolocationPosition)->Void, ?options:flight.GeolocationRequestOptions, ?onError:(flight.GeolocationErrorReason)->Void):Float;
}
#end
