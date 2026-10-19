// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <string>
#include <flight/xml/contract.hpp>
#include <flight_hx/xml.hpp>

namespace flight_hx::xml {

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

::hx::Null<double> get_xml_element_attribute_number(flight::Ref<flight::types::XmlElement> element, ::String name) {
  const auto result = flight::xml::get_xml_element_attribute_number(element, flight::String::from_utf8(name.utf8_str()));
  return result.has_value() ? ::hx::Null<double>{result.value()} : ::hx::Null<double>{};
}

::Array<::Dynamic> get_xml_element_children_by_name(flight::Ref<flight::types::XmlElement> element, ::String name) {
  const auto result = flight::xml::get_xml_element_children_by_name(element, flight::String::from_utf8(name.utf8_str()));
  return to_haxe_reference_array<flight::types::XmlElement>(result);
}

} // namespace flight_hx::xml
