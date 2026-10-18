// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/entity/contract.hpp")
extern class Attempt_Entity_enableEntityRuntimeGuards extends AttemptConfig {
  @:native("flight::entity::enable_entity_runtime_guards")
  public static function enableEntityRuntimeGuards(report:flight.EntityRuntimeWriteGuard):Void;
}
#end
