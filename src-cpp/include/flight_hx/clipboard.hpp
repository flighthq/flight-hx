// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::clipboard {

flight::Ref<flight::types::ClipboardWatch> create_clipboard_watch();
void detach_clipboard_watch(flight::Ref<flight::types::ClipboardWatch> watch);
void dispose_clipboard_watch(flight::Ref<flight::types::ClipboardWatch> watch);

} // namespace flight_hx::clipboard
