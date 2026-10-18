// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/protocol/contract.hpp")
extern class Attempt_Protocol_parseProtocolUrl extends AttemptConfig {
  @:native("flight::protocol::parse_protocol_url")
  public static function parseProtocolUrl(url:String):Null<flight.ParsedProtocolUrl>;
}
#end
