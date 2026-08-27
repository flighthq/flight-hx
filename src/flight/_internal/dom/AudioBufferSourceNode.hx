// Maintained host-type declaration. js stays Dynamic (browser
// AudioBufferSourceNode); native is a nominal interface implemented by the
// host audio backend. `start(0, offset)` is emitted with two of three
// arguments — the typed interface pads the omitted one at compile time, which
// a Dynamic call on Neko cannot.
package flight._internal.dom;

#if js
typedef AudioBufferSourceNode = Dynamic;
#else
interface AudioBufferSourceNode extends AudioNode {
  var buffer:Null<AudioBuffer>;
  var loop:Bool;
  var onended:Null<Dynamic>;
  var playbackRate(default, never):AudioParam;
  function start(?when:Float, ?offset:Float, ?duration:Float):Void;
  function stop(?when:Float):Void;
}
#end
