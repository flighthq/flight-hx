// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::mediasession {

bool attach_media_session_action(flight::Ref<flight::types::HostMediaSessionActionCapability> hostMediaSessionAction, flight::Ref<flight::types::MediaSessionActionSignal> signal);
void destroy_media_session(flight::Ref<flight::types::HostMediaSessionCapability> hostMediaSession, flight::Ref<flight::types::HostMediaSessionActionCapability> hostMediaSessionAction);
void detach_media_session_action(flight::Ref<flight::types::MediaSessionActionSignal> signal);
void dispose_media_session_action_signal(flight::Ref<flight::types::MediaSessionActionSignal> signal);

} // namespace flight_hx::mediasession
