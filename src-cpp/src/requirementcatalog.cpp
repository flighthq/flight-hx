// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <flight/requirement_catalog/contract.hpp>
#include <flight_hx/requirementcatalog.hpp>

namespace flight_hx::requirement_catalog {

namespace {

template <typename T>
flight::Array<flight::Ref<T>> to_flight_reference_array(const ::Array<::Dynamic>& source) {
  flight::Array<flight::Ref<T>> result;
  for (int index = 0; index < source->length; ++index) {
    const ::Dynamic value = source[index];
    result.push(value.GetPtr() ? static_cast<flight::Ref<T>>(value.StaticCast<flight_hx::Ref<T>>()) : flight::Ref<T>{});
  }
  return result;
}

template <typename T>
::Array<::Dynamic> to_haxe_reference_array(const flight::Array<flight::Ref<T>>& source) {
  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight reference Array exceeds the hxcpp Array length limit");
  }
  ::Array<::Dynamic> result = ::Array_obj<::Dynamic>::__new(static_cast<int>(source.size()));
  int index = 0;
  for (const flight::Ref<T>& value : source) result[index++] = flight_hx::Ref<T>(value);
  return result;
}

template <typename T>
void replace_haxe_reference_array(::Array<::Dynamic> destination, const flight::Array<flight::Ref<T>>& source) {
  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight reference Array exceeds the hxcpp Array length limit");
  }
  destination->resize(static_cast<int>(source.size()));
  int index = 0;
  for (const flight::Ref<T>& value : source) destination[index++] = flight_hx::Ref<T>(value);
}

} // namespace

flight::Ref<flight::types::RequirementCatalog> create_requirement_catalog(bool entriesPresent, ::Array<::Dynamic> entries, bool translationsPresent, ::Array<::Dynamic> translations, bool dispositionsPresent, ::Array<::Dynamic> dispositions) {
  auto flight_entries = to_flight_reference_array<flight::types::RequirementCatalogEntry>(entries);
  auto flight_translations = to_flight_reference_array<flight::types::RequirementTranslation>(translations);
  auto flight_dispositions = to_flight_reference_array<flight::types::RequirementDisposition>(dispositions);
  const auto result = flight::requirement_catalog::create_requirement_catalog((entriesPresent ? std::optional<flight::Array<flight::Ref<flight::types::RequirementCatalogEntry>>>{flight_entries} : std::nullopt), (translationsPresent ? std::optional<flight::Array<flight::Ref<flight::types::RequirementTranslation>>>{flight_translations} : std::nullopt), (dispositionsPresent ? std::optional<flight::Array<flight::Ref<flight::types::RequirementDisposition>>>{flight_dispositions} : std::nullopt));
  if (entriesPresent) replace_haxe_reference_array<flight::types::RequirementCatalogEntry>(entries, flight_entries);
  if (translationsPresent) replace_haxe_reference_array<flight::types::RequirementTranslation>(translations, flight_translations);
  if (dispositionsPresent) replace_haxe_reference_array<flight::types::RequirementDisposition>(dispositions, flight_dispositions);
  return result;
}

::Array<::Dynamic> get_requirement_catalog_entries(flight::Ref<flight::types::RequirementCatalog> catalog) {
  const auto result = flight::requirement_catalog::get_requirement_catalog_entries(catalog);
  return to_haxe_reference_array<flight::types::RequirementCatalogEntry>(result);
}

void register_requirement_catalog_entry(flight::Ref<flight::types::RequirementCatalog> catalog, flight::Ref<flight::types::RequirementCatalogEntry> entry) {
  flight::requirement_catalog::register_requirement_catalog_entry(catalog, entry);
}

bool unregister_requirement_catalog_entry(flight::Ref<flight::types::RequirementCatalog> catalog, flight::Ref<flight::types::RequirementCatalogEntry> entry) {
  return flight::requirement_catalog::unregister_requirement_catalog_entry(catalog, entry);
}

} // namespace flight_hx::requirement_catalog
