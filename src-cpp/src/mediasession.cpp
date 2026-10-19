// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/mediasession/contract.hpp>
#include <flight_hx/mediasession.hpp>

namespace flight_hx::mediasession {

bool attach_media_session_action(flight::Ref<flight::types::HostMediaSessionActionCapability> hostMediaSessionAction, flight::Ref<flight::types::MediaSessionActionSignal> signal) {
  return flight::mediasession::attach_media_session_action(hostMediaSessionAction, signal);
}

void destroy_media_session(flight::Ref<flight::types::HostMediaSessionCapability> hostMediaSession, flight::Ref<flight::types::HostMediaSessionActionCapability> hostMediaSessionAction) {
  flight::mediasession::destroy_media_session(hostMediaSession, hostMediaSessionAction);
}

void detach_media_session_action(flight::Ref<flight::types::MediaSessionActionSignal> signal) {
  flight::mediasession::detach_media_session_action(signal);
}

void dispose_media_session_action_signal(flight::Ref<flight::types::MediaSessionActionSignal> signal) {
  flight::mediasession::dispose_media_session_action_signal(signal);
}

} // namespace flight_hx::mediasession
