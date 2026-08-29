// Maintained host-type declaration. js stays Dynamic (the genuine browser
// AudioContext); native is a nominal interface implemented by the host audio
// backend (hostLime LimeAudio). Members mirror the upstream corpus census in
// reports/host-types.json: createBufferSource, createGain, createStereoPanner,
// close, currentTime, decodeAudioData, destination, resume, state.
package flight._internal.dom;

#if js
typedef AudioContext = Dynamic;
#else
interface AudioContext {
  var currentTime(get, never):Float;
  var destination(default, never):AudioDestinationNode;
  var sampleRate(default, never):Float;
  var state(default, null):String;
  function createBufferSource():AudioBufferSourceNode;
  function createGain():GainNode;
  function createStereoPanner():StereoPannerNode;
  function close():Dynamic;
  function decodeAudioData(data:Dynamic):Dynamic;
  function resume():Dynamic;
}
#end
