// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/requirement_catalog/contract.hpp")
extern class Attempt_RequirementCatalog_unregisterRequirementCatalogEntry extends AttemptConfig {
  @:native("flight::requirement_catalog::unregister_requirement_catalog_entry")
  public static function unregisterRequirementCatalogEntry(catalog:flight.RequirementCatalog, entry:flight.RequirementCatalogEntry):Bool;
}
#end
