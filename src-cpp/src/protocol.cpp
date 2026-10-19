// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
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

} // namespace flight_hx::protocol
