// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <string>
#include <flight/encoding/contract.hpp>
#include <flight_hx/encoding.hpp>

namespace flight_hx::encoding {

namespace {

template <typename NativeArray>
NativeArray to_flight_typed_array(const ::Array<double>& source) {
  NativeArray result(static_cast<std::size_t>(source->length));
  for (int index = 0; index < source->length; ++index) result.set_index(static_cast<double>(index), source[index]);
  return result;
}

template <typename NativeArray>
::Array<double> to_haxe_typed_array(const NativeArray& source) {
  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight TypedArray exceeds the hxcpp Array length limit");
  }
  ::Array<double> result = ::Array_obj<double>::__new(static_cast<int>(source.size()));
  int index = 0;
  for (const auto value : source) result[index++] = static_cast<double>(value);
  return result;
}

template <typename NativeArray>
void replace_haxe_typed_array(::Array<double> destination, const NativeArray& source) {
  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight TypedArray exceeds the hxcpp Array length limit");
  }
  destination->resize(static_cast<int>(source.size()));
  int index = 0;
  for (const auto value : source) destination[index++] = static_cast<double>(value);
}

} // namespace

::String decode_utf8(::Array<double> bytes, bool offsetPresent, double offset, bool lengthPresent, double length) {
  auto flight_bytes = to_flight_typed_array<flight::Uint8Array>(bytes);
  const auto result = flight::encoding::decode_utf8(flight_bytes, (offsetPresent ? std::optional<double>{offset} : std::nullopt), (lengthPresent ? std::optional<double>{length} : std::nullopt));
  replace_haxe_typed_array(bytes, flight_bytes);
  const std::string result_utf8 = result.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

::Array<double> encode_utf8(::String text) {
  const auto result = flight::encoding::encode_utf8(flight::String::from_utf8(text.utf8_str()));
  return to_haxe_typed_array(result);
}

} // namespace flight_hx::encoding
