// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::timeline {

void clear_timeline_frame_scripts(flight::Ref<flight::types::Timeline> timeline);
void dispose_timeline_signals(flight::Ref<flight::types::Timeline> timeline);
flight::Ref<flight::types::TimelineSignals> enable_timeline_signals(flight::Ref<flight::types::Timeline> timeline);
flight_hx::Ref<flight::types::TimelineLabel> find_timeline_label(flight::Ref<flight::types::Timeline> timeline, ::String name);
flight_hx::Ref<flight::types::TimelineLabel> get_timeline_current_label(flight::Ref<flight::types::Timeline> timeline);
::Array<::Dynamic> get_timeline_labels(flight::Ref<flight::types::Timeline> timeline);
void next_frame_timeline(flight::Ref<flight::types::Timeline> timeline);
void play_timeline(flight::Ref<flight::types::Timeline> timeline);
void prev_frame_timeline(flight::Ref<flight::types::Timeline> timeline);
void stop_timeline(flight::Ref<flight::types::Timeline> timeline);
bool update_timeline(flight::Ref<flight::types::Timeline> timeline, double deltaTime);

} // namespace flight_hx::timeline
