// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/protocol/contract.hpp")
extern class Attempt_Protocol_isProtocolSchemeDefault extends AttemptConfig {
  @:native("flight::protocol::is_protocol_scheme_default")
  public static function isProtocolSchemeDefault(hostProtocolDefault:flight.HostProtocolDefaultCapability, scheme:String):Bool;
}
#end
