// Maintained host-type declaration; see HTMLCanvasElement.hx for the model.
package flighthq._internal.dom;

#if js
@:native('HTMLVideoElement')
extern class HTMLVideoElement {
  var videoWidth(default, never):Int;
  var videoHeight(default, never):Int;
  var readyState(default, never):Int;
  var currentTime:Float;
  var duration(default, never):Float;
  var paused(default, never):Bool;
  var muted:Bool;
  var loop:Bool;
  var playbackRate:Float;
  var src:String;
  var srcObject:Dynamic;
  var volume:Float;
  var preload:String;
  var crossOrigin:String;
  var playsInline:Bool;
  function play():Dynamic;
  function pause():Void;
  function load():Void;
  function canPlayType(type:String):String;
  function removeAttribute(name:String):Void;
  function addEventListener(type:String, listener:Dynamic, ?options:Dynamic):Void;
  function removeEventListener(type:String, listener:Dynamic, ?options:Dynamic):Void;
}
#else
typedef HTMLVideoElement = Dynamic;
#end
