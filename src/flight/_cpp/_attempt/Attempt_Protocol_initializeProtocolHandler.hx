// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/protocol/contract.hpp")
extern class Attempt_Protocol_initializeProtocolHandler extends AttemptConfig {
  @:native("flight::protocol::initialize_protocol_handler")
  public static function initializeProtocolHandler(out:flight.EntityConstruction<flight.ProtocolHandler>):Void;
}
#end
