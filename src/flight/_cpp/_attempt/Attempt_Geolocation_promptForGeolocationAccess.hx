// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/geolocation/contract.hpp")
extern class Attempt_Geolocation_promptForGeolocationAccess extends AttemptConfig {
  @:native("flight::geolocation::prompt_for_geolocation_access")
  public static function promptForGeolocationAccess(hostGeolocation:Null<flight.HostGeolocationCapability>):flight._internal._Promise<flight.GeolocationAccessOutcome>;
}
#end
