// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/entity/contract.hpp")
extern class Attempt_Entity_setEntityUid extends AttemptConfig {
  @:native("flight::entity::set_entity_uid")
  public static function setEntityUid(source:flight.Entity, uid:String):Void;
}
#end
