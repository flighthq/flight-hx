// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <flight/requirement/contract.hpp>
#include <flight_hx/requirement.hpp>

namespace flight_hx::requirement {

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

flight::Ref<flight::types::RequirementSet> diff_requirement_sets(flight::Ref<flight::types::RequirementSet> requirements, flight::Ref<flight::types::RequirementSet> baseline) {
  return flight::requirement::diff_requirement_sets(requirements, baseline);
}

flight::Ref<flight::types::RequirementSet> merge_requirement_sets(::Array<::Dynamic> requirementSets) {
  auto flight_requirementSets = to_flight_reference_array<flight::types::RequirementSet>(requirementSets);
  const auto result = flight::requirement::merge_requirement_sets(flight_requirementSets);
  replace_haxe_reference_array<flight::types::RequirementSet>(requirementSets, flight_requirementSets);
  return result;
}

} // namespace flight_hx::requirement
