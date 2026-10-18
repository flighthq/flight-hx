// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/entity/contract.hpp")
extern class Attempt_Entity_createGuardedEntity extends AttemptConfig {
  @:native("flight::entity::create_guarded_entity")
  public static function createGuardedEntity<Type:Dynamic>(entity:Dynamic):Dynamic;
}
#end
