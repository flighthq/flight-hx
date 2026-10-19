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
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/timeline.cpp" />
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
@:include("flight_hx/timeline.hpp")
extern class Timeline {
  @:native("flight_hx::timeline::clear_timeline_frame_scripts")
  static function clearTimelineFrameScripts(timeline:flight.Timeline):Void;

  @:native("flight_hx::timeline::dispose_timeline_signals")
  static function disposeTimelineSignals(timeline:flight.Timeline):Void;

  @:native("flight_hx::timeline::enable_timeline_signals")
  static function enableTimelineSignals(timeline:flight.Timeline):flight.TimelineSignals;

  @:native("flight_hx::timeline::find_timeline_label")
  static function findTimelineLabel(timeline:flight.Timeline, name:String):Null<flight.TimelineLabel>;

  @:native("flight_hx::timeline::get_timeline_current_label")
  static function getTimelineCurrentLabel(timeline:flight.Timeline):Null<flight.TimelineLabel>;

  @:native("flight_hx::timeline::get_timeline_labels")
  static function getTimelineLabels(timeline:flight.Timeline):Array<flight.TimelineLabel>;

  @:native("flight_hx::timeline::next_frame_timeline")
  static function nextFrameTimeline(timeline:flight.Timeline):Void;

  @:native("flight_hx::timeline::play_timeline")
  static function playTimeline(timeline:flight.Timeline):Void;

  @:native("flight_hx::timeline::prev_frame_timeline")
  static function prevFrameTimeline(timeline:flight.Timeline):Void;

  @:native("flight_hx::timeline::stop_timeline")
  static function stopTimeline(timeline:flight.Timeline):Void;

  @:native("flight_hx::timeline::update_timeline")
  static function updateTimeline(timeline:flight.Timeline, deltaTime:Float):Bool;
}
#end
