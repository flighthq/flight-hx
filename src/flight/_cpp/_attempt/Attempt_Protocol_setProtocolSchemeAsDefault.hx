// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/protocol/contract.hpp")
extern class Attempt_Protocol_setProtocolSchemeAsDefault extends AttemptConfig {
  @:native("flight::protocol::set_protocol_scheme_as_default")
  public static function setProtocolSchemeAsDefault(hostProtocolDefault:flight.HostProtocolDefaultCapability, scheme:String):Bool;
}
#end
