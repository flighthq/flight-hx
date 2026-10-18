// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/protocol/contract.hpp")
extern class Attempt_Protocol_getProtocolLaunchUrl extends AttemptConfig {
  @:native("flight::protocol::get_protocol_launch_url")
  public static function getProtocolLaunchUrl(hostProtocolLaunch:flight.HostProtocolLaunchCapability):Null<String>;
}
#end
