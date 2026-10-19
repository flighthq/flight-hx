// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::requirement {

flight::Ref<flight::types::RequirementSet> diff_requirement_sets(flight::Ref<flight::types::RequirementSet> requirements, flight::Ref<flight::types::RequirementSet> baseline);
flight::Ref<flight::types::RequirementSet> merge_requirement_sets(::Array<::Dynamic> requirementSets);

} // namespace flight_hx::requirement
