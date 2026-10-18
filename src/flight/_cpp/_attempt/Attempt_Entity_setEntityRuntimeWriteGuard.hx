// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/entity/contract.hpp")
extern class Attempt_Entity_setEntityRuntimeWriteGuard extends AttemptConfig {
  @:native("flight::entity::set_entity_runtime_write_guard")
  public static function setEntityRuntimeWriteGuard(guard:Null<flight.EntityRuntimeWriteGuard>):Void;
}
#end
