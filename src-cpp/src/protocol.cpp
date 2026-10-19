// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <string>
#include <flight/protocol/contract.hpp>
#include <flight_hx/protocol.hpp>

namespace flight_hx::protocol {

flight::Ref<flight::types::ProtocolHandler> create_protocol_handler() {
  return flight::protocol::create_protocol_handler();
}

void detach_protocol_handler(flight::Ref<flight::types::ProtocolHandler> handler) {
  flight::protocol::detach_protocol_handler(handler);
}

void dispose_protocol_handler(flight::Ref<flight::types::ProtocolHandler> handler) {
  flight::protocol::dispose_protocol_handler(handler);
}

void attach_protocol_handler(flight::Ref<flight::types::HostProtocolOpenCapability> hostProtocolOpen, flight::Ref<flight::types::ProtocolHandler> handler) {
  flight::protocol::attach_protocol_handler(hostProtocolOpen, handler);
}

::String get_protocol_launch_url(flight::Ref<flight::types::HostProtocolLaunchCapability> hostProtocolLaunch) {
  const auto result = flight::protocol::get_protocol_launch_url(hostProtocolLaunch);
  if (!result.has_value()) return null();
  const std::string result_utf8 = result->to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

bool is_protocol_scheme_default(flight::Ref<flight::types::HostProtocolDefaultCapability> hostProtocolDefault, ::String scheme) {
  return flight::protocol::is_protocol_scheme_default(hostProtocolDefault, flight::String::from_utf8(scheme.utf8_str()));
}

bool is_protocol_scheme_registered(flight::Ref<flight::types::HostProtocolRegistrationQueryCapability> hostProtocolRegistrationQuery, ::String scheme) {
  return flight::protocol::is_protocol_scheme_registered(hostProtocolRegistrationQuery, flight::String::from_utf8(scheme.utf8_str()));
}

flight_hx::Ref<flight::types::ParsedProtocolUrl> parse_protocol_url(::String url) {
  const auto result = flight::protocol::parse_protocol_url(flight::String::from_utf8(url.utf8_str()));
  return result.has_value() ? flight_hx::Ref<flight::types::ParsedProtocolUrl>{result.value()} : flight_hx::Ref<flight::types::ParsedProtocolUrl>{};
}

bool register_protocol_scheme(flight::Ref<flight::types::HostProtocolRegistrationCapability> hostProtocolRegistration, ::String scheme) {
  return flight::protocol::register_protocol_scheme(hostProtocolRegistration, flight::String::from_utf8(scheme.utf8_str()));
}

bool remove_protocol_scheme_as_default(flight::Ref<flight::types::HostProtocolDefaultCapability> hostProtocolDefault, ::String scheme) {
  return flight::protocol::remove_protocol_scheme_as_default(hostProtocolDefault, flight::String::from_utf8(scheme.utf8_str()));
}

bool set_protocol_scheme_as_default(flight::Ref<flight::types::HostProtocolDefaultCapability> hostProtocolDefault, ::String scheme) {
  return flight::protocol::set_protocol_scheme_as_default(hostProtocolDefault, flight::String::from_utf8(scheme.utf8_str()));
}

bool unregister_protocol_scheme(flight::Ref<flight::types::HostProtocolUnregistrationCapability> hostProtocolUnregistration, ::String scheme) {
  return flight::protocol::unregister_protocol_scheme(hostProtocolUnregistration, flight::String::from_utf8(scheme.utf8_str()));
}

} // namespace flight_hx::protocol
