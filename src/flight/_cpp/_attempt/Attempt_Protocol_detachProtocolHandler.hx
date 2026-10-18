// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/protocol/contract.hpp")
extern class Attempt_Protocol_detachProtocolHandler extends AttemptConfig {
  @:native("flight::protocol::detach_protocol_handler")
  public static function detachProtocolHandler(handler:flight.ProtocolHandler):Void;
}
#end
