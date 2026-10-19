// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <flight/binpack/contract.hpp>
#include <flight_hx/binpack.hpp>

namespace flight_hx::binpack {

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

::Array<::Dynamic> explain_unpacked_rectangles(::Array<::Dynamic> rectangles, flight::Ref<flight::types::BinPackOptions> options) {
  auto flight_rectangles = to_flight_reference_array<flight::types::PackableRectangle>(rectangles);
  const auto result = flight::binpack::explain_unpacked_rectangles(flight_rectangles, (options ? std::optional<flight::Ref<flight::types::BinPackOptions>>{options} : std::nullopt));
  replace_haxe_reference_array<flight::types::PackableRectangle>(rectangles, flight_rectangles);
  return to_haxe_reference_array<flight::types::UnpackedRectangleExplanation>(result);
}

double get_pack_result_occupancy(flight::Ref<flight::types::PackResult> result) {
  return flight::binpack::get_pack_result_occupancy(result);
}

flight::Ref<flight::types::PackResult> pack_rectangles(::Array<::Dynamic> rects, flight::Ref<flight::types::BinPackOptions> options) {
  auto flight_rects = to_flight_reference_array<flight::types::PackableRectangle>(rects);
  const auto result = flight::binpack::pack_rectangles(flight_rects, (options ? std::optional<flight::Ref<flight::types::BinPackOptions>>{options} : std::nullopt));
  replace_haxe_reference_array<flight::types::PackableRectangle>(rects, flight_rects);
  return result;
}

double get_bin_pack_default_max_extent() {
  return flight::binpack::bin_pack_default_max_extent;
}

} // namespace flight_hx::binpack
