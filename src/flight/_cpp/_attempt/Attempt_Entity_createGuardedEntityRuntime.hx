// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/entity/contract.hpp")
extern class Attempt_Entity_createGuardedEntityRuntime extends AttemptConfig {
  @:native("flight::entity::create_guarded_entity_runtime")
  public static function createGuardedEntityRuntime(runtime:flight.EntityRuntime):flight.EntityRuntime;
}
#end
