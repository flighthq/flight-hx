// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/requirement_catalog/contract.hpp")
extern class Attempt_RequirementCatalog_createRequirementCatalog extends AttemptConfig {
  @:native("flight::requirement_catalog::create_requirement_catalog")
  public static function createRequirementCatalog(?entries:Array<flight.RequirementCatalogEntry>, ?translations:Array<flight.RequirementTranslation>, ?dispositions:Array<flight.RequirementDisposition>):flight.RequirementCatalog;
}
#end
