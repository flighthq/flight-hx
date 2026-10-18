// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/entity/contract.hpp")
extern class Attempt_Entity_stripEntityRuntime extends AttemptConfig {
  @:native("flight::entity::strip_entity_runtime")
  public static function stripEntityRuntime<Type>(source:Type):flight.EntityWithoutRuntime<Type>;
}
#end
