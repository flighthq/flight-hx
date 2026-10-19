// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/clipboard/contract.hpp>
#include <flight_hx/clipboard.hpp>

namespace flight_hx::clipboard {

flight::Ref<flight::types::ClipboardWatch> create_clipboard_watch() {
  return flight::clipboard::create_clipboard_watch();
}

void detach_clipboard_watch(flight::Ref<flight::types::ClipboardWatch> watch) {
  flight::clipboard::detach_clipboard_watch(watch);
}

void dispose_clipboard_watch(flight::Ref<flight::types::ClipboardWatch> watch) {
  flight::clipboard::dispose_clipboard_watch(watch);
}

} // namespace flight_hx::clipboard
