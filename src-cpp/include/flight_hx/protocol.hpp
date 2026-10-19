// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::protocol {

flight::Ref<flight::types::ProtocolHandler> create_protocol_handler();
void detach_protocol_handler(flight::Ref<flight::types::ProtocolHandler> handler);
void dispose_protocol_handler(flight::Ref<flight::types::ProtocolHandler> handler);

} // namespace flight_hx::protocol
