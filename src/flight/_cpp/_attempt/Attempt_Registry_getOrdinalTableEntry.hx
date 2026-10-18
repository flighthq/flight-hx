// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/registry/contract.hpp")
extern class Attempt_Registry_getOrdinalTableEntry extends AttemptConfig {
  @:native("flight::registry::get_ordinal_table_entry")
  public static function getOrdinalTableEntry<T>(table:flight.OrdinalTable<T>, ordinal:Float):Null<T>;
}
#end
