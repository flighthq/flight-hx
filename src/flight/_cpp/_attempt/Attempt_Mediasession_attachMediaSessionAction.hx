// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/mediasession/contract.hpp")
extern class Attempt_Mediasession_attachMediaSessionAction extends AttemptConfig {
  @:native("flight::mediasession::attach_media_session_action")
  public static function attachMediaSessionAction(hostMediaSessionAction:flight.HostMediaSessionActionCapability, signal:flight.MediaSessionActionSignal):Bool;
}
#end
