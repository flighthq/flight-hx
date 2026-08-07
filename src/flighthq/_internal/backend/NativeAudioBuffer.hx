// Maintained native standard-toolkit implementation of the Web Audio buffer
// surface used by Flight's portable sample constructor.
package flighthq._internal.backend;

import flighthq._internal._Float32Array;
import flighthq._internal._Runtime;
import flighthq._internal.dom.AudioBuffer;

class NativeAudioBuffer implements AudioBuffer {
  public final duration:Float;
  public final length:Int;
  public final numberOfChannels:Int;
  public final sampleRate:Float;

  final channels:Array<_Float32Array>;

  public function new(?options:Dynamic) {
    length = Std.int(_Runtime.field(options, 'length'));
    numberOfChannels = Std.int(_Runtime.field(options, 'numberOfChannels'));
    sampleRate = _Runtime.field(options, 'sampleRate');
    duration = sampleRate > 0 ? length / sampleRate : 0;
    channels = [for (_ in 0...numberOfChannels) new _Float32Array(length)];
  }

  public function getChannelData(channel:Float):_Float32Array {
    return channels[Std.int(channel)];
  }

  public function copyToChannel(source:_Float32Array, channelNumber:Float, ?startInChannel:Float):Void {
    channels[Std.int(channelNumber)].set(source, startInChannel == null ? 0 : startInChannel);
  }
}
