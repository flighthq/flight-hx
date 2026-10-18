// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/protocol/contract.hpp")
extern class Attempt_Protocol_removeProtocolSchemeAsDefault extends AttemptConfig {
  @:native("flight::protocol::remove_protocol_scheme_as_default")
  public static function removeProtocolSchemeAsDefault(hostProtocolDefault:flight.HostProtocolDefaultCapability, scheme:String):Bool;
}
#end
