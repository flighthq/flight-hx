// Maintained host adapter: Flight AudioDeviceBackend over Clay's SoLoud engine.
// WRITE-AHEAD against upstream develop 2cf1c5cef — does not compile until the
// regenerated develop base lands (flight.types.AudioDeviceBackend / Audio*Handle
// and flight._Media.installAudioDeviceHostBackend do not exist on 0.4.0). SoLoud
// call signatures are from clay@8ae994a (clay.soloud.SoloudAudio). Reconcile the
// handle types and one or two SoLoud arg shapes on rebase. See
// agents/host-develop-adaptation.md.
//
// Model: Flight's AudioDeviceBackend is handle-keyed and caller-owned (per
// upstream/agents/backend-lifecycle-ownership.md). Clay exposes a single global
// SoLoud engine (Clay.app.audio), so a "device" is a logical handle onto it;
// buffers are SoLoud AudioData, sources are play instances (AudioHandle).
package flight.hostClay;

#if clay
import clay.Clay;

private typedef ClaySource = {
  var data:Dynamic;            // clay AudioData (from dataFromPCM)
  var playing:Null<Dynamic>;   // clay AudioHandle while started, else null
  var gain:Float;
  var rate:Float;
  var ended:Null<Void->Void>;
};

class ClayAudioDevice {
  static var nextHandle = 1;
  static final devices = new Map<Int, Bool>();          // handle -> alive (all map to Clay.app.audio)
  static final buffers = new Map<Int, Dynamic>();       // handle -> AudioData
  static final sources = new Map<Int, ClaySource>();    // handle -> source record

  /** Allocation entry point. Install via `flight._Media.installAudioDeviceHostBackend`. */
  public static function createClayAudioDeviceBackend():Dynamic {
    return {
      createDevice: function(sampleRate:Float):Dynamic {
        final h = nextHandle++;
        devices.set(h, true);
        return cast h;
      },
      destroyDevice: function(device:Dynamic):Void devices.remove(Std.int(cast device)),
      resumeDevice: function(device:Dynamic):Void Clay.app.audio.resume(),
      getDeviceTime: function(device:Dynamic):Float return Clay.app.timestamp,

      createBuffer: function(device:Dynamic, channels:Float, length:Float, sampleRate:Float, data:Array<Dynamic>):Dynamic {
        // SoLoud AudioData from interleaved PCM. TODO(develop): confirm
        // SoloudAudio.dataFromPCM arg order (channels/sampleRate/samples) and
        // channel interleaving of `data` (Float32Array per channel) on rebase.
        final audioData = Clay.app.audio.dataFromPCM(Clay.app, 'flight-buffer-' + nextHandle, interleave(data), Std.int(channels), Std.int(sampleRate));
        final h = nextHandle++;
        buffers.set(h, audioData);
        return cast h;
      },
      destroyBuffer: function(buffer:Dynamic):Void buffers.remove(Std.int(cast buffer)),

      createSource: function(device:Dynamic, buffer:Dynamic):Dynamic {
        final data = buffers.get(Std.int(cast buffer));
        final h = nextHandle++;
        sources.set(h, {data: data, playing: null, gain: 1.0, rate: 1.0, ended: null});
        return cast h;
      },
      destroySource: function(source:Dynamic):Void {
        final s = sources.get(Std.int(cast source));
        if (s != null && s.playing != null) Clay.app.audio.stop(s.playing);
        sources.remove(Std.int(cast source));
      },

      startSource: function(source:Dynamic, offset:Float):Void {
        final s = sources.get(Std.int(cast source));
        if (s == null) return;
        // Wrap the AudioData in a source and play at the source's current gain.
        final playing = Clay.app.audio.play(cast s.data, s.gain, false, 0);
        s.playing = playing;
        if (offset > 0) Clay.app.audio.position(playing, offset);
        if (s.rate != 1.0) Clay.app.audio.pitch(playing, s.rate);
      },
      stopSource: function(source:Dynamic):Void {
        final s = sources.get(Std.int(cast source));
        if (s != null && s.playing != null) { Clay.app.audio.stop(s.playing); s.playing = null; }
      },
      setSourceGain: function(source:Dynamic, gain:Float):Void {
        final s = sources.get(Std.int(cast source));
        if (s == null) return;
        s.gain = gain;
        if (s.playing != null) Clay.app.audio.volume(s.playing, gain);
      },
      setSourcePlaybackRate: function(source:Dynamic, rate:Float):Void {
        final s = sources.get(Std.int(cast source));
        if (s == null) return;
        s.rate = rate;
        if (s.playing != null) Clay.app.audio.pitch(s.playing, rate);
      },
      onSourceEnded: function(source:Dynamic, callback:Null<Void->Void>):Void {
        final s = sources.get(Std.int(cast source));
        if (s != null) s.ended = callback;
        // TODO(develop): SoLoud has no direct ended callback; drive from
        // HostClay's frame pump — poll stateOf(playing) and fire `ended` on stop.
      },
    };
  }

  /** Called by the host frame pump to fire ended callbacks (SoLoud has no event). */
  public static function pumpEnded():Void {
    for (s in sources) {
      if (s.playing != null && s.ended != null && !Clay.app.audio.stateOf(s.playing).match(cast 'playing')) {
        final cb = s.ended; s.playing = null; s.ended = null; cb();
      }
    }
  }

  static function interleave(data:Array<Dynamic>):Dynamic {
    // TODO(develop): interleave per-channel Float32Array data into SoLoud's
    // expected PCM layout once the AudioData PCM contract is confirmed.
    return data.length == 1 ? data[0] : data;
  }
}
#end
