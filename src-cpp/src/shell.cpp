// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <string>
#include <flight/shell/contract.hpp>
#include <flight_hx/shell.hpp>

namespace flight_hx::shell {

bool is_shell_url_allowed(::String url, flight::Ref<flight::types::ShellExternalUrlPolicy> policy) {
  return flight::shell::is_shell_url_allowed(flight::String::from_utf8(url.utf8_str()), policy);
}

void shell_beep(flight::Ref<flight::types::HostShellBeepCapability> hostShellBeep) {
  flight::shell::shell_beep(hostShellBeep);
}

} // namespace flight_hx::shell
