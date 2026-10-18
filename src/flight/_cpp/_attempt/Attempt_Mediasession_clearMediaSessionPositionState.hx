// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/mediasession/contract.hpp")
extern class Attempt_Mediasession_clearMediaSessionPositionState extends AttemptConfig {
  @:native("flight::mediasession::clear_media_session_position_state")
  public static function clearMediaSessionPositionState(hostMediaSession:flight.HostMediaSessionCapability):flight.MediaSessionClearPositionStateOutcome;
}
#end
