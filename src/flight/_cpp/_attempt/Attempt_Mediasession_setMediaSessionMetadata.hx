// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/mediasession/contract.hpp")
extern class Attempt_Mediasession_setMediaSessionMetadata extends AttemptConfig {
  @:native("flight::mediasession::set_media_session_metadata")
  public static function setMediaSessionMetadata(hostMediaSession:flight.HostMediaSessionCapability, metadata:flight.MediaSessionMetadata):flight.MediaSessionSetMetadataOutcome;
}
#end
