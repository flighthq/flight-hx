// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::shell {

bool is_shell_url_allowed(::String url, flight::Ref<flight::types::ShellExternalUrlPolicy> policy);
void shell_beep(flight::Ref<flight::types::HostShellBeepCapability> hostShellBeep);

} // namespace flight_hx::shell
