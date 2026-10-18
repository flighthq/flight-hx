// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/requirement_catalog/contract.hpp")
extern class Attempt_RequirementCatalog_BUILT_IN_REQUIREMENT_CATALOG_ENTRIES extends AttemptConfig {
  @:native("flight::requirement_catalog::built_in_requirement_catalog_entries")
  public static var BUILT_IN_REQUIREMENT_CATALOG_ENTRIES:Array<RequirementCatalogEntry>;
}
#end
