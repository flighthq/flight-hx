// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/entity/contract.hpp")
extern class Attempt_Entity_finishEntity extends AttemptConfig {
  @:native("flight::entity::finish_entity")
  public static function finishEntity<Type>(out:flight.EntityConstruction<Type>):Type;
}
#end
