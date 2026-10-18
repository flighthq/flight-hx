// Generated from flight-compiler native-planning.json. Do not edit.
#include <hxcpp.h>
#include <optional>
#include <string>
#include <flight/protocol/contract.hpp>

namespace flight_hx::haxe::_cpp {
// String values are copied through UTF-8 in both directions; neither runtime borrows the other string storage.
bool isValidProtocolScheme_74b6ecee(::String argument_0) {
  const flight::String flight_argument_0 = flight::String::from_utf8(argument_0.utf8_str());
  return flight::protocol::is_valid_protocol_scheme(flight_argument_0);
}
} // namespace flight_hx::haxe::_cpp
