// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <string>
#include <flight/xml/contract.hpp>
#include <flight_hx/xml.hpp>

namespace flight_hx::xml {

flight_hx::Ref<flight::types::XmlElement> parse_xml_document(::String xml) {
  const auto result = flight::xml::parse_xml_document(flight::String::from_utf8(xml.utf8_str()));
  return result.has_value() ? flight_hx::Ref<flight::types::XmlElement>{result.value()} : flight_hx::Ref<flight::types::XmlElement>{};
}

flight_hx::Ref<flight::types::XmlElement> get_xml_element_child_by_name(flight::Ref<flight::types::XmlElement> element, ::String name) {
  const auto result = flight::xml::get_xml_element_child_by_name(element, flight::String::from_utf8(name.utf8_str()));
  return result.has_value() ? flight_hx::Ref<flight::types::XmlElement>{result.value()} : flight_hx::Ref<flight::types::XmlElement>{};
}

::String get_xml_element_attribute(flight::Ref<flight::types::XmlElement> element, ::String name) {
  const auto result = flight::xml::get_xml_element_attribute(element, flight::String::from_utf8(name.utf8_str()));
  if (!result.has_value()) return null();
  const std::string result_utf8 = result->to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

} // namespace flight_hx::xml
