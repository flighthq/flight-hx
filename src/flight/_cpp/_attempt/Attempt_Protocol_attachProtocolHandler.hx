// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/protocol/contract.hpp")
extern class Attempt_Protocol_attachProtocolHandler extends AttemptConfig {
  @:native("flight::protocol::attach_protocol_handler")
  public static function attachProtocolHandler(hostProtocolOpen:flight.HostProtocolOpenCapability, handler:flight.ProtocolHandler):Void;
}
#end
