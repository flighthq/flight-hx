// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/requirement_catalog/contract.hpp")
extern class Attempt_RequirementCatalog_getRequirementCatalogEntries extends AttemptConfig {
  @:native("flight::requirement_catalog::get_requirement_catalog_entries")
  public static function getRequirementCatalogEntries(catalog:flight.RequirementCatalog):Array<flight.RequirementCatalogEntry>;
}
#end
