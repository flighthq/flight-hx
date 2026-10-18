// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/mediasession/contract.hpp")
extern class Attempt_Mediasession_destroyMediaSession extends AttemptConfig {
  @:native("flight::mediasession::destroy_media_session")
  public static function destroyMediaSession(hostMediaSession:flight.HostMediaSessionCapability, hostMediaSessionAction:flight.HostMediaSessionActionCapability):Void;
}
#end
