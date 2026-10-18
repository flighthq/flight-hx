// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/registry/contract.hpp")
extern class Attempt_Registry_concatKindMap extends AttemptConfig {
  @:native("flight::registry::concat_kind_map")
  public static function concatKindMap<T>(base:flight._internal._Map<flight.Kind, T>, overlay:flight._internal._Map<flight.Kind, T>):flight._internal._Map<flight.Kind, T>;
}
#end
