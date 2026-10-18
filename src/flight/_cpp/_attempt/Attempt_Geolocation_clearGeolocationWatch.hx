// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/geolocation/contract.hpp")
extern class Attempt_Geolocation_clearGeolocationWatch extends AttemptConfig {
  @:native("flight::geolocation::clear_geolocation_watch")
  public static function clearGeolocationWatch(hostGeolocation:flight.HostGeolocationCapability, id:Float):Void;
}
#end
