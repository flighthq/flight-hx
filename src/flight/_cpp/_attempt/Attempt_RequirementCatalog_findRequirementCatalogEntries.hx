// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/requirement_catalog/contract.hpp")
extern class Attempt_RequirementCatalog_findRequirementCatalogEntries extends AttemptConfig {
  @:native("flight::requirement_catalog::find_requirement_catalog_entries")
  public static function findRequirementCatalogEntries(catalog:flight.RequirementCatalog, backend:String, facet:flight.RequirementFacet, kind:flight.Kind):Array<flight.RequirementCatalogEntry>;
}
#end
