// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._fn;

#if cpp
import flight.*;
@:buildXml('
<error value="flight_cpp_root must name the pinned or installed flight-cpp root" unless="flight_cpp_root" />
<error value="flight_hx_root must name the flight-hx package root" unless="flight_hx_root" />
<set name="NO_PRECOMPILED_HEADERS" value="1" />
<set name="HXCPP_NO_CPP11" value="1" />
<unset name="HXCPP_CPP11" />
<files id="haxe">
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/xml.cpp" />
  <compilerflag value="/std:c++20" if="windows" />
  <compilerflag value="-std=c++20" unless="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/overrides/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/generated/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_hx_root}/src-cpp/include" if="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/overrides/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/generated/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_hx_root}/src-cpp/include" unless="windows" />
</files>
')
@:include("flight_hx/xml.hpp")
extern class Xml {
  @:native("flight_hx::xml::parse_xml_document")
  static function parseXmlDocument(xml:String):Null<flight.XmlElement>;

  @:native("flight_hx::xml::get_xml_element_child_by_name")
  static function getXmlElementChildByName(element:flight.XmlElement, name:String):Null<flight.XmlElement>;

  @:native("flight_hx::xml::get_xml_element_attribute")
  static function getXmlElementAttribute(element:flight.XmlElement, name:String):Null<String>;

  @:native("flight_hx::xml::get_xml_element_attribute_number")
  static function getXmlElementAttributeNumber(element:flight.XmlElement, name:String):Null<Float>;

  @:native("flight_hx::xml::get_xml_element_children_by_name")
  static function getXmlElementChildrenByName(element:flight.XmlElement, name:String):Array<flight.XmlElement>;
}
#end
