// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <flight/compression/contract.hpp>
#include <flight_hx/compression.hpp>

namespace flight_hx::compression {

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

::Array<double> compress_deflate(::Array<double> bytes) {
  auto flight_bytes = to_flight_typed_array<flight::Uint8Array>(bytes);
  const auto result = flight::compression::compress_deflate(flight_bytes);
  replace_haxe_typed_array(bytes, flight_bytes);
  if (result.identity() == flight_bytes.identity()) return bytes;
  return to_haxe_typed_array(result);
}

::Array<double> compress_deflate_zlib(::Array<double> bytes) {
  auto flight_bytes = to_flight_typed_array<flight::Uint8Array>(bytes);
  const auto result = flight::compression::compress_deflate_zlib(flight_bytes);
  replace_haxe_typed_array(bytes, flight_bytes);
  if (result.identity() == flight_bytes.identity()) return bytes;
  return to_haxe_typed_array(result);
}

::Array<double> compress_lzma(::Array<double> bytes) {
  auto flight_bytes = to_flight_typed_array<flight::Uint8Array>(bytes);
  const auto result = flight::compression::compress_lzma(flight_bytes);
  replace_haxe_typed_array(bytes, flight_bytes);
  if (result.identity() == flight_bytes.identity()) return bytes;
  return to_haxe_typed_array(result);
}

double compute_adler32(::Array<double> input) {
  auto flight_input = to_flight_typed_array<flight::Uint8Array>(input);
  const auto result = flight::compression::compute_adler32(flight_input);
  replace_haxe_typed_array(input, flight_input);
  return result;
}

} // namespace flight_hx::compression
