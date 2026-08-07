// Maintained host-type declaration. Native targets use the structural contract
// implemented by the standard toolkit's in-memory audio buffer; keeping this
// nominal prevents a Dynamic member call from losing its receiver on Neko.
package flighthq._internal.dom;

interface AudioBuffer {
  var duration(default, never):Float;
  var length(default, never):Int;
  var numberOfChannels(default, never):Int;
  var sampleRate(default, never):Float;
  function getChannelData(channel:Float):flighthq._internal._Float32Array;
  function copyToChannel(source:flighthq._internal._Float32Array, channelNumber:Float, ?startInChannel:Float):Void;
}
