// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/protocol/contract.hpp")
extern class Attempt_Protocol_isProtocolSchemeRegistered extends AttemptConfig {
  @:native("flight::protocol::is_protocol_scheme_registered")
  public static function isProtocolSchemeRegistered(hostProtocolRegistrationQuery:flight.HostProtocolRegistrationQueryCapability, scheme:String):Bool;
}
#end
