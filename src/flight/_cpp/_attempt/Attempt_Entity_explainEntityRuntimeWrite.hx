// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/entity/contract.hpp")
extern class Attempt_Entity_explainEntityRuntimeWrite extends AttemptConfig {
  @:native("flight::entity::explain_entity_runtime_write")
  public static function explainEntityRuntimeWrite(slot:flight.EntityRuntimeWriteSlot):flight.EntityRuntimeWriteExplanation;
}
#end
