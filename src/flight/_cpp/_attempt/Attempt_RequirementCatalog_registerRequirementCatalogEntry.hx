// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/requirement_catalog/contract.hpp")
extern class Attempt_RequirementCatalog_registerRequirementCatalogEntry extends AttemptConfig {
  @:native("flight::requirement_catalog::register_requirement_catalog_entry")
  public static function registerRequirementCatalogEntry(catalog:flight.RequirementCatalog, entry:flight.RequirementCatalogEntry):Void;
}
#end
