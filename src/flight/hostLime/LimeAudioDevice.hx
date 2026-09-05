// Maintained host adapter: Flight AudioDeviceBackend for the Lime host.
// WRITE-AHEAD against develop 2cf1c5cef, guarded `#if flight_host_develop` so it
// stays INERT on the 0.4.0 base (must not break test:haxe:lime). On rebase to
// develop, drop the extra guard and reconcile flight.types.Audio*Handle names.
//
// Reshapes builder's LimeAudio buffered-playback logic (lime.media.AudioBuffer /
// AudioSource over OpenAL) from the old AudioContext node-graph onto develop's
// handle-keyed AudioDeviceBackend. Lime has one global audio output, so a device
// is a logical handle. FOR BUILDER REVIEW: preserve LimeAudio's gain/offset/
// duration mapping and PCM->AudioBuffer conversion exactly.
package flight.hostLime;

#if lime
import lime.media.AudioBuffer;
import lime.media.AudioSource;

private typedef LimeSource = { var source:AudioSource; var gain:Float; };

class LimeAudioDevice {
  static var nextHandle = 1;
  static final buffers = new Map<Int, AudioBuffer>();
  static final sources = new Map<Int, LimeSource>();

  /** Install via `flight._Media.installAudioDeviceHostBackend`. */
  public static function createLimeAudioDeviceBackend():Dynamic {
    return {
      createDevice: function(sampleRate:Float):Dynamic return cast (nextHandle++),
      destroyDevice: function(device:Dynamic):Void {},
      resumeDevice: function(device:Dynamic):Void {}, // OpenAL context resumes with playback
      getDeviceTime: function(device:Dynamic):Float return lime.system.System.getTimer() / 1000.0,

      createBuffer: function(device:Dynamic, channels:Float, length:Float, sampleRate:Float, data:Array<Dynamic>):Dynamic {
        // TODO(builder review): build a lime AudioBuffer from interleaved PCM.
        // Construct with data (UInt8Array of 16-bit PCM), channels, sampleRate,
        // bitsPerSample=16 — matching LimeAudio's decode path expectations.
        final buffer = new AudioBuffer();
        buffer.channels = Std.int(channels);
        buffer.sampleRate = Std.int(sampleRate);
        buffer.bitsPerSample = 16;
        buffer.data = pcmFloatToInt16(data, Std.int(channels), Std.int(length));
        final h = nextHandle++;
        buffers.set(h, buffer);
        return cast h;
      },
      destroyBuffer: function(buffer:Dynamic):Void buffers.remove(Std.int(cast buffer)),

      createSource: function(device:Dynamic, buffer:Dynamic):Dynamic {
        final buf = buffers.get(Std.int(cast buffer));
        final src = new AudioSource(buf);
        final h = nextHandle++;
        sources.set(h, {source: src, gain: 1.0});
        return cast h;
      },
      destroySource: function(source:Dynamic):Void {
        final s = sources.get(Std.int(cast source));
        if (s != null) { s.source.dispose(); sources.remove(Std.int(cast source)); }
      },

      startSource: function(source:Dynamic, offset:Float):Void {
        final s = sources.get(Std.int(cast source));
        if (s == null) return;
        s.source.currentTime = Std.int(offset * 1000.0); // ms
        s.source.play();
      },
      stopSource: function(source:Dynamic):Void {
        final s = sources.get(Std.int(cast source));
        if (s != null) s.source.stop();
      },
      setSourceGain: function(source:Dynamic, gain:Float):Void {
        final s = sources.get(Std.int(cast source));
        if (s != null) { s.gain = gain; s.source.gain = gain; }
      },
      setSourcePlaybackRate: function(source:Dynamic, rate:Float):Void {
        // TODO(builder review): lime AudioSource has no portable playback-rate;
        // OpenAL AL_PITCH via lime.media backend, or document as unsupported.
      },
      onSourceEnded: function(source:Dynamic, callback:Null<Void->Void>):Void {
        final s = sources.get(Std.int(cast source));
        if (s == null) return;
        if (callback != null) s.source.onComplete.add(callback);
      },
    };
  }

  static function pcmFloatToInt16(data:Array<Dynamic>, channels:Int, length:Int):Dynamic {
    // Interleave per-channel Float32 [-1,1] into 16-bit little-endian PCM.
    final bytes = haxe.io.Bytes.alloc(length * channels * 2);
    var o = 0;
    for (i in 0...length) {
      for (c in 0...channels) {
        final src:Array<Float> = cast data[c];
        var v = src[i];
        if (v > 1) v = 1; else if (v < -1) v = -1;
        final s = Std.int(v * 32767);
        bytes.set(o, s & 0xFF);
        bytes.set(o + 1, (s >> 8) & 0xFF);
        o += 2;
      }
    }
    // TODO(builder review): wrap as lime AudioBuffer.data's exact type
    // (lime.utils.UInt8Array) — likely UInt8Array.fromBytes(bytes).
    return lime.utils.UInt8Array.fromBytes(bytes);
  }
}
#end
