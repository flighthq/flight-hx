// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/protocol/contract.hpp")
extern class Attempt_Protocol_registerProtocolScheme extends AttemptConfig {
  @:native("flight::protocol::register_protocol_scheme")
  public static function registerProtocolScheme(hostProtocolRegistration:flight.HostProtocolRegistrationCapability, scheme:String):Bool;
}
#end
