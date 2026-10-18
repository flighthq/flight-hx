// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/registry/contract.hpp")
extern class Attempt_Registry_createOrdinalTable extends AttemptConfig {
  @:native("flight::registry::create_ordinal_table")
  public static function createOrdinalTable<T>(vocabulary:Array<flight.Kind>):flight.NonEntityCreateResult<flight.OrdinalTable<T>, String>;
}
#end
