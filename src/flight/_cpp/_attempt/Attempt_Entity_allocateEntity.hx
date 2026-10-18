// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/entity/contract.hpp")
extern class Attempt_Entity_allocateEntity extends AttemptConfig {
  @:native("flight::entity::allocate_entity")
  public static function allocateEntity<Type>():flight.EntityConstruction<Type>;
}
#end
