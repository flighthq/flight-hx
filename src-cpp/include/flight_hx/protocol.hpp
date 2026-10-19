// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::protocol {

flight::Ref<flight::types::ProtocolHandler> create_protocol_handler();
void detach_protocol_handler(flight::Ref<flight::types::ProtocolHandler> handler);
void dispose_protocol_handler(flight::Ref<flight::types::ProtocolHandler> handler);
void attach_protocol_handler(flight::Ref<flight::types::HostProtocolOpenCapability> hostProtocolOpen, flight::Ref<flight::types::ProtocolHandler> handler);
::String get_protocol_launch_url(flight::Ref<flight::types::HostProtocolLaunchCapability> hostProtocolLaunch);
bool is_protocol_scheme_default(flight::Ref<flight::types::HostProtocolDefaultCapability> hostProtocolDefault, ::String scheme);
bool is_protocol_scheme_registered(flight::Ref<flight::types::HostProtocolRegistrationQueryCapability> hostProtocolRegistrationQuery, ::String scheme);
flight_hx::Ref<flight::types::ParsedProtocolUrl> parse_protocol_url(::String url);
bool register_protocol_scheme(flight::Ref<flight::types::HostProtocolRegistrationCapability> hostProtocolRegistration, ::String scheme);
bool remove_protocol_scheme_as_default(flight::Ref<flight::types::HostProtocolDefaultCapability> hostProtocolDefault, ::String scheme);
bool set_protocol_scheme_as_default(flight::Ref<flight::types::HostProtocolDefaultCapability> hostProtocolDefault, ::String scheme);
bool unregister_protocol_scheme(flight::Ref<flight::types::HostProtocolUnregistrationCapability> hostProtocolUnregistration, ::String scheme);

} // namespace flight_hx::protocol
