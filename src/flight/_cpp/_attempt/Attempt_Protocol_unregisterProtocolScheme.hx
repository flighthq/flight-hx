// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/protocol/contract.hpp")
extern class Attempt_Protocol_unregisterProtocolScheme extends AttemptConfig {
  @:native("flight::protocol::unregister_protocol_scheme")
  public static function unregisterProtocolScheme(hostProtocolUnregistration:flight.HostProtocolUnregistrationCapability, scheme:String):Bool;
}
#end
