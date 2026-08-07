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
  function play():Dynamic;
  function pause():Void;
}
#else
typedef HTMLVideoElement = Dynamic;
#end
