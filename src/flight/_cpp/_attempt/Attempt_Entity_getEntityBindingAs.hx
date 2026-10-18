// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/entity/contract.hpp")
extern class Attempt_Entity_getEntityBindingAs extends AttemptConfig {
  @:native("flight::entity::get_entity_binding_as")
  public static function getEntityBindingAs<Type>(source:flight.Entity):Null<Type>;
}
#end
