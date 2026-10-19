// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <string>
#include <flight/importdiagnostics/contract.hpp>
#include <flight_hx/importdiagnostics.hpp>

namespace flight_hx::importdiagnostics {

::String format_import_diagnostic(flight::Ref<flight::types::ImportDiagnostic> diagnostic) {
  const auto result = flight::importdiagnostics::format_import_diagnostic(diagnostic);
  const std::string result_utf8 = result.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

} // namespace flight_hx::importdiagnostics
