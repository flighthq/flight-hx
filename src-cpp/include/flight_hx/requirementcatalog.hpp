// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::requirement_catalog {

flight::Ref<flight::types::RequirementCatalog> create_requirement_catalog(bool entriesPresent, ::Array<::Dynamic> entries, bool translationsPresent, ::Array<::Dynamic> translations, bool dispositionsPresent, ::Array<::Dynamic> dispositions);
::Array<::Dynamic> get_requirement_catalog_entries(flight::Ref<flight::types::RequirementCatalog> catalog);
void register_requirement_catalog_entry(flight::Ref<flight::types::RequirementCatalog> catalog, flight::Ref<flight::types::RequirementCatalogEntry> entry);
bool unregister_requirement_catalog_entry(flight::Ref<flight::types::RequirementCatalog> catalog, flight::Ref<flight::types::RequirementCatalogEntry> entry);

} // namespace flight_hx::requirement_catalog
