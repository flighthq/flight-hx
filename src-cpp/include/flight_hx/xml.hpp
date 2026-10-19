// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::xml {

flight_hx::Ref<flight::types::XmlElement> parse_xml_document(::String xml);
flight_hx::Ref<flight::types::XmlElement> get_xml_element_child_by_name(flight::Ref<flight::types::XmlElement> element, ::String name);
::String get_xml_element_attribute(flight::Ref<flight::types::XmlElement> element, ::String name);
::hx::Null<double> get_xml_element_attribute_number(flight::Ref<flight::types::XmlElement> element, ::String name);

} // namespace flight_hx::xml
