// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/entity/contract.hpp")
extern class Attempt_Entity_cloneEntity extends AttemptConfig {
  @:native("flight::entity::clone_entity")
  public static function cloneEntity<Type>(source:Type):Type;
}
#end
