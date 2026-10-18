// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/registry/contract.hpp")
extern class Attempt_Registry_withKindMapEntry extends AttemptConfig {
  @:native("flight::registry::with_kind_map_entry")
  public static function withKindMapEntry<T>(map:flight._internal._Map<flight.Kind, T>, key:flight.Kind, value:T):flight._internal._Map<flight.Kind, T>;
}
#end
