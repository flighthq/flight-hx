// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <string>
#include <flight/timeline/contract.hpp>
#include <flight_hx/timeline.hpp>

namespace flight_hx::timeline {

namespace {

template <typename T>
flight::Array<flight::Ref<T>> to_flight_reference_array(const ::Array<::Dynamic>& source) {
  flight::Array<flight::Ref<T>> result;
  for (int index = 0; index < source->length; ++index) {
    const ::Dynamic value = source[index];
    result.push(value.GetPtr() ? static_cast<flight::Ref<T>>(value.StaticCast<flight_hx::Ref<T>>()) : flight::Ref<T>{});
  }
  return result;
}

template <typename T>
::Array<::Dynamic> to_haxe_reference_array(const flight::Array<flight::Ref<T>>& source) {
  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight reference Array exceeds the hxcpp Array length limit");
  }
  ::Array<::Dynamic> result = ::Array_obj<::Dynamic>::__new(static_cast<int>(source.size()));
  int index = 0;
  for (const flight::Ref<T>& value : source) result[index++] = flight_hx::Ref<T>(value);
  return result;
}

template <typename T>
void replace_haxe_reference_array(::Array<::Dynamic> destination, const flight::Array<flight::Ref<T>>& source) {
  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight reference Array exceeds the hxcpp Array length limit");
  }
  destination->resize(static_cast<int>(source.size()));
  int index = 0;
  for (const flight::Ref<T>& value : source) destination[index++] = flight_hx::Ref<T>(value);
}

} // namespace

void clear_timeline_frame_scripts(flight::Ref<flight::types::Timeline> timeline) {
  flight::timeline::clear_timeline_frame_scripts(timeline);
}

void dispose_timeline_signals(flight::Ref<flight::types::Timeline> timeline) {
  flight::timeline::dispose_timeline_signals(timeline);
}

flight::Ref<flight::types::TimelineSignals> enable_timeline_signals(flight::Ref<flight::types::Timeline> timeline) {
  return flight::timeline::enable_timeline_signals(timeline);
}

flight_hx::Ref<flight::types::TimelineLabel> find_timeline_label(flight::Ref<flight::types::Timeline> timeline, ::String name) {
  const auto result = flight::timeline::find_timeline_label(timeline, flight::String::from_utf8(name.utf8_str()));
  return result.has_value() ? flight_hx::Ref<flight::types::TimelineLabel>{result.value()} : flight_hx::Ref<flight::types::TimelineLabel>{};
}

flight_hx::Ref<flight::types::TimelineLabel> get_timeline_current_label(flight::Ref<flight::types::Timeline> timeline) {
  const auto result = flight::timeline::get_timeline_current_label(timeline);
  return result.has_value() ? flight_hx::Ref<flight::types::TimelineLabel>{result.value()} : flight_hx::Ref<flight::types::TimelineLabel>{};
}

::Array<::Dynamic> get_timeline_labels(flight::Ref<flight::types::Timeline> timeline) {
  const auto result = flight::timeline::get_timeline_labels(timeline);
  return to_haxe_reference_array<flight::types::TimelineLabel>(result);
}

void next_frame_timeline(flight::Ref<flight::types::Timeline> timeline) {
  flight::timeline::next_frame_timeline(timeline);
}

void play_timeline(flight::Ref<flight::types::Timeline> timeline) {
  flight::timeline::play_timeline(timeline);
}

void prev_frame_timeline(flight::Ref<flight::types::Timeline> timeline) {
  flight::timeline::prev_frame_timeline(timeline);
}

void stop_timeline(flight::Ref<flight::types::Timeline> timeline) {
  flight::timeline::stop_timeline(timeline);
}

bool update_timeline(flight::Ref<flight::types::Timeline> timeline, double deltaTime) {
  return flight::timeline::update_timeline(timeline, deltaTime);
}

} // namespace flight_hx::timeline
