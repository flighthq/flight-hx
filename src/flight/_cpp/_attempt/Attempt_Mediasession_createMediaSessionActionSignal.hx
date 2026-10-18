// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/mediasession/contract.hpp")
extern class Attempt_Mediasession_createMediaSessionActionSignal extends AttemptConfig {
  @:native("flight::mediasession::create_media_session_action_signal")
  public static function createMediaSessionActionSignal(action:flight.MediaSessionAction):flight.MediaSessionActionSignal;
}
#end
