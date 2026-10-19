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
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/protocol.cpp" />
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/adapters/isValidProtocolScheme_74b6ecee.cpp" />
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
@:include("flight_hx/adapters/isValidProtocolScheme_74b6ecee.hpp")
@:include("flight_hx/protocol.hpp")
extern class Protocol {
  @:native("flight_hx::haxe::_cpp::isValidProtocolScheme_74b6ecee")
  static function isValidProtocolScheme(scheme:String):Bool;

  @:native("flight_hx::protocol::create_protocol_handler")
  static function createProtocolHandler():flight.ProtocolHandler;

  @:native("flight_hx::protocol::detach_protocol_handler")
  static function detachProtocolHandler(handler:flight.ProtocolHandler):Void;

  @:native("flight_hx::protocol::dispose_protocol_handler")
  static function disposeProtocolHandler(handler:flight.ProtocolHandler):Void;

  @:native("flight_hx::protocol::attach_protocol_handler")
  static function attachProtocolHandler(hostProtocolOpen:flight.HostProtocolOpenCapability, handler:flight.ProtocolHandler):Void;

  @:native("flight_hx::protocol::get_protocol_launch_url")
  static function getProtocolLaunchUrl(hostProtocolLaunch:flight.HostProtocolLaunchCapability):Null<String>;

  @:native("flight_hx::protocol::is_protocol_scheme_default")
  static function isProtocolSchemeDefault(hostProtocolDefault:flight.HostProtocolDefaultCapability, scheme:String):Bool;

  @:native("flight_hx::protocol::is_protocol_scheme_registered")
  static function isProtocolSchemeRegistered(hostProtocolRegistrationQuery:flight.HostProtocolRegistrationQueryCapability, scheme:String):Bool;

  @:native("flight_hx::protocol::parse_protocol_url")
  static function parseProtocolUrl(url:String):Null<flight.ParsedProtocolUrl>;

  @:native("flight_hx::protocol::register_protocol_scheme")
  static function registerProtocolScheme(hostProtocolRegistration:flight.HostProtocolRegistrationCapability, scheme:String):Bool;

  @:native("flight_hx::protocol::remove_protocol_scheme_as_default")
  static function removeProtocolSchemeAsDefault(hostProtocolDefault:flight.HostProtocolDefaultCapability, scheme:String):Bool;

  @:native("flight_hx::protocol::set_protocol_scheme_as_default")
  static function setProtocolSchemeAsDefault(hostProtocolDefault:flight.HostProtocolDefaultCapability, scheme:String):Bool;

  @:native("flight_hx::protocol::unregister_protocol_scheme")
  static function unregisterProtocolScheme(hostProtocolUnregistration:flight.HostProtocolUnregistrationCapability, scheme:String):Bool;
}
#end
