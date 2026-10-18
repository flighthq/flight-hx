// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/entity/contract.hpp")
extern class Attempt_Entity_getEntityBinding extends AttemptConfig {
  @:native("flight::entity::get_entity_binding")
  public static function getEntityBinding(source:flight.Entity):Null<Dynamic>;
}
#end
