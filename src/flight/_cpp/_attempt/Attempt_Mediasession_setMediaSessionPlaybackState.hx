// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/mediasession/contract.hpp")
extern class Attempt_Mediasession_setMediaSessionPlaybackState extends AttemptConfig {
  @:native("flight::mediasession::set_media_session_playback_state")
  public static function setMediaSessionPlaybackState(hostMediaSession:flight.HostMediaSessionCapability, state:flight.MediaSessionPlaybackState):flight.MediaSessionSetPlaybackStateOutcome;
}
#end
