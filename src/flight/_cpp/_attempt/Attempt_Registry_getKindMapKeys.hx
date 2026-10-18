// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/registry/contract.hpp")
extern class Attempt_Registry_getKindMapKeys extends AttemptConfig {
  @:native("flight::registry::get_kind_map_keys")
  public static function getKindMapKeys(out:Array<flight.Kind>, map:flight._internal._Map<flight.Kind, Dynamic>):Void;
}
#end
