// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/protocol/contract.hpp")
extern class Attempt_Protocol_getRegisteredProtocolSchemes extends AttemptConfig {
  @:native("flight::protocol::get_registered_protocol_schemes")
  public static function getRegisteredProtocolSchemes(hostProtocolRegistration:flight.HostProtocolRegistrationCapability):Array<String>;
}
#end
