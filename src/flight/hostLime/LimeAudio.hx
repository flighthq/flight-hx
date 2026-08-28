// Maintained host adapter: a Web Audio `AudioContext` for the Lime target.
// Upstream Flight's audio seam is parameter injection — `createAudioMixer`,
// `playAudioResource`, and the loaders all take `context: AudioContext` from
// the caller — so the host's job is to supply a context implementing the
// protocol subset those packages use (the census in reports/host-types.json).
// On js this is the genuine browser context; natively it is a minimal
// node-graph emulation realized through lime.media.AudioSource (OpenAL),
// where a source's audible gain is the product of gain nodes on its path to
// the destination and pan comes from the last stereo panner on that path.
//
// Deliberate simplifications, kept because the upstream corpus never relies on
// the difference: AudioParam ramps apply their target value immediately,
// `start(when)` with a future `when` starts now, and node fan-out is limited
// to a single output connection (upstream only builds linear chains with
// fan-in).
package flight.hostLime;

#if lime
import Math as HxMath;
import flight._internal._Float32Array;
#if !js
import flight._internal._LimeTypedArray;
#end
import flight._internal._Promise;
import flight._internal._Runtime;
import flight._internal.backend.NativeAudioBuffer;
import flight._internal.dom.AudioBuffer;
import flight._internal.dom.AudioBufferSourceNode;
import flight._internal.dom.AudioContext;
import flight._internal.dom.AudioDestinationNode;
import flight._internal.dom.AudioNode;
import flight._internal.dom.AudioParam;
import flight._internal.dom.GainNode;
import flight._internal.dom.StereoPannerNode;

class LimeAudio {
  /** Allocation entry point, Flight-style: `createLimeAudioContext()`. */
  public static function createLimeAudioContext():AudioContext {
    #if js
    return cast js.Syntax.code('new (window.AudioContext || window.webkitAudioContext)()');
    #else
    return new LimeAudioContext();
    #end
  }
}

#if !js
private class LimeAudioContext implements AudioContext {
  public final destination:AudioDestinationNode;
  public var currentTime(get, never):Float;
  public final sampleRate:Float = 44100;
  public var state(default, null):String = 'running';

  final startTimer:Int;
  final activeSources:Array<LimeAudioBufferSourceNode> = [];

  public function new() {
    destination = new LimeAudioDestinationNode(this);
    startTimer = lime.system.System.getTimer();
  }

  function get_currentTime():Float {
    return (lime.system.System.getTimer() - startTimer) / 1000.0;
  }

  public function createGain():GainNode {
    return new LimeGainNode(this);
  }

  public function createStereoPanner():StereoPannerNode {
    return new LimeStereoPannerNode(this);
  }

  public function createBufferSource():AudioBufferSourceNode {
    return new LimeAudioBufferSourceNode(this);
  }

  public function createBuffer(numberOfChannels:Float, length:Float, sampleRate:Float):AudioBuffer {
    return new NativeAudioBuffer({
      numberOfChannels: numberOfChannels,
      length: length,
      sampleRate: sampleRate,
    });
  }

  public function decodeAudioData(data:Dynamic):Dynamic {
    return new _Promise(function(resolve:AudioBuffer->Void, reject) {
      final bytes = toBytes(data);
      if (bytes == null) {
        reject('decodeAudioData: unsupported input');
        return;
      }
      final decoded = lime.media.AudioBuffer.fromBytes(bytes);
      if (decoded == null || decoded.data == null) {
        reject('decodeAudioData: unable to decode audio data');
        return;
      }
      resolve(pcmToAudioBuffer(decoded));
    });
  }

  public function resume():Dynamic {
    if (state == 'suspended') {
      state = 'running';
      for (source in activeSources) source.resumePlayback();
    }
    return _Promise.resolve(null);
  }

  public function suspend():Dynamic {
    if (state == 'running') {
      state = 'suspended';
      for (source in activeSources) source.pausePlayback();
    }
    return _Promise.resolve(null);
  }

  public function close():Dynamic {
    state = 'closed';
    for (source in activeSources.copy()) source.stop();
    return _Promise.resolve(null);
  }

  // Called by nodes whenever a gain/pan value or a connection changes so
  // already-playing sources track the live mixer state.
  public function refreshActiveSources():Void {
    for (source in activeSources) source.applyChain();
  }

  public function registerActive(source:LimeAudioBufferSourceNode):Void {
    if (activeSources.indexOf(source) == -1) activeSources.push(source);
  }

  public function unregisterActive(source:LimeAudioBufferSourceNode):Void {
    activeSources.remove(source);
  }

  // Lime typed-array views can start part-way through a shared byte buffer;
  // preserve the exact view rather than decoding unrelated prefix/suffix data.
  static function toBytes(data:Dynamic):Null<haxe.io.Bytes> {
    if (data == null) return null;
    if (Std.isOfType(data, haxe.io.Bytes)) return cast data;
    if (Std.isOfType(data, _LimeTypedArray)) return viewToBytes(cast _LimeTypedArray.unwrap(data));
    if (Std.isOfType(data, lime.utils.ArrayBufferView)) return viewToBytes(cast data);
    final inner:Dynamic = _Runtime.field(data, 'buffer');
    if (inner != null && Std.isOfType(inner, haxe.io.Bytes)) return cast inner;
    return null;
  }

  static function viewToBytes(view:lime.utils.ArrayBufferView):haxe.io.Bytes {
    final bytes:haxe.io.Bytes = cast view.buffer;
    final offset = view.byteOffset;
    final length = view.byteLength;
    return offset == 0 && length == bytes.length ? bytes : bytes.sub(offset, length);
  }

  // Decoded PCM (8/16/32-bit interleaved) to the portable Float32 channel form
  // every other consumer of dom.AudioBuffer expects.
  function pcmToAudioBuffer(decoded:lime.media.AudioBuffer):AudioBuffer {
    final channels = decoded.channels;
    final bytesPerSample = Std.int(decoded.bitsPerSample / 8);
    final frameCount = Std.int(decoded.data.length / (bytesPerSample * channels));
    final out = new NativeAudioBuffer({
      numberOfChannels: channels,
      length: frameCount,
      sampleRate: decoded.sampleRate,
    });
    final bytes = decoded.data.buffer;
    for (channel in 0...channels) {
      final samples = out.getChannelData(channel);
      for (frame in 0...frameCount) {
        final at = (frame * channels + channel) * bytesPerSample;
        samples[frame] = switch (decoded.bitsPerSample) {
          case 8: (bytes.get(at) - 128) / 128.0;
          case 32: bytes.getFloat(at);
          default:
            final raw = bytes.get(at) | (bytes.get(at + 1) << 8);
            (raw >= 0x8000 ? raw - 0x10000 : raw) / 32768.0;
        };
      }
    }
    return out;
  }
}

private class LimeAudioNode implements AudioNode {
  public final context:LimeAudioContext;
  public var output:Null<LimeAudioNode> = null;

  public function new(context:LimeAudioContext) {
    this.context = context;
  }

  public function connect(node:Dynamic):Dynamic {
    output = cast node;
    context.refreshActiveSources();
    return node;
  }

  public function disconnect(?node:Dynamic):Void {
    output = null;
    context.refreshActiveSources();
  }
}

private class LimeAudioDestinationNode extends LimeAudioNode implements AudioDestinationNode {}

private class LimeAudioParam implements AudioParam {
  public var value(default, set):Float;

  final owner:LimeAudioNode;

  public function new(owner:LimeAudioNode, initial:Float) {
    this.owner = owner;
    @:bypassAccessor value = initial;
  }

  function set_value(next:Float):Float {
    value = next;
    owner.context.refreshActiveSources();
    return next;
  }

  public function setValueAtTime(next:Float, startTime:Float):AudioParam {
    value = next;
    return this;
  }

  public function linearRampToValueAtTime(next:Float, endTime:Float):AudioParam {
    value = next;
    return this;
  }

  public function cancelScheduledValues(startTime:Float):AudioParam {
    return this;
  }
}

private class LimeGainNode extends LimeAudioNode implements GainNode {
  public final gain:AudioParam;

  public function new(context:LimeAudioContext) {
    super(context);
    gain = new LimeAudioParam(this, 1);
  }
}

private class LimeStereoPannerNode extends LimeAudioNode implements StereoPannerNode {
  public final pan:AudioParam;

  public function new(context:LimeAudioContext) {
    super(context);
    pan = new LimeAudioParam(this, 0);
  }
}

private class LimeAudioBufferSourceNode extends LimeAudioNode implements AudioBufferSourceNode {
  public var buffer:Null<AudioBuffer> = null;
  public final playbackRate:AudioParam;
  public var loop:Bool = false;
  public var onended:Null<Dynamic> = null;

  var source:Null<lime.media.AudioSource> = null;
  var started = false;

  public function new(context:LimeAudioContext) {
    super(context);
    playbackRate = new LimeAudioParam(this, 1);
  }

  public function start(?when:Float, ?offset:Float, ?duration:Float):Void {
    if (started || buffer == null) return;
    started = true;
    final limeBuffer = encodeBuffer(buffer);
    // Lime 8.3.2 documents offset as samples, but its native, HTML5, and Flash
    // backends all add it to millisecond positions. Match the pinned runtime.
    final offsetMs = offset == null ? 0 : Std.int(offset * 1000);
    final lengthMs:Null<Int> = duration == null ? null : Std.int(duration * 1000);
    // 0x3FFFFFFF loops stands in for Web Audio's unbounded `loop = true`.
    source = new lime.media.AudioSource(limeBuffer, offsetMs, lengthMs, loop ? 0x3FFFFFFF : 0);
    source.onComplete.add(handleComplete);
    applyChain();
    context.registerActive(this);
    if (context.state == 'running') source.play();
  }

  public function stop(?when:Float):Void {
    if (source == null) return;
    final active = source;
    source = null;
    context.unregisterActive(this);
    active.stop();
    active.dispose();
    fireEnded();
  }

  public function pausePlayback():Void {
    if (source != null) source.pause();
  }

  public function resumePlayback():Void {
    if (source != null) source.play();
  }

  // Recompute audible gain/pan from the node chain. A source not reaching the
  // destination is silent, matching Web Audio's disconnected behavior.
  public function applyChain():Void {
    if (source == null) return;
    var gainProduct = 1.0;
    var pan = 0.0;
    var reachedDestination = false;
    var node:Null<LimeAudioNode> = this.output;
    var hops = 0;
    while (node != null && hops < 64) {
      if (Std.isOfType(node, LimeGainNode)) gainProduct *= (cast node : LimeGainNode).gain.value;
      if (Std.isOfType(node, LimeStereoPannerNode)) pan = (cast node : LimeStereoPannerNode).pan.value;
      if (Std.isOfType(node, LimeAudioDestinationNode)) {
        reachedDestination = true;
        break;
      }
      node = node.output;
      hops++;
    }
    source.gain = reachedDestination ? gainProduct : 0;
    if (pan < -1) pan = -1;
    if (pan > 1) pan = 1;
    // Constant-power placement on the listener's XZ plane; OpenAL pans mono
    // buffers, and stereo buffers legitimately ignore this.
    source.position = new lime.math.Vector4(pan, 0, -HxMath.sqrt(HxMath.max(0, 1 - pan * pan)));
    if (playbackRate.value > 0 && playbackRate.value != 1) source.pitch = playbackRate.value;
  }

  function handleComplete():Void {
    if (source != null) {
      source.dispose();
      source = null;
    }
    context.unregisterActive(this);
    fireEnded();
  }

  function fireEnded():Void {
    final handler = onended;
    if (handler != null) _Runtime.callOptionalValue(handler, cast []);
  }

  // Float32 channels to interleaved 16-bit PCM, the one form every Lime audio
  // backend accepts.
  static function encodeBuffer(buffer:AudioBuffer):lime.media.AudioBuffer {
    final channels = buffer.numberOfChannels;
    final frameCount = buffer.length;
    final bytes = haxe.io.Bytes.alloc(frameCount * channels * 2);
    for (channel in 0...channels) {
      final samples:_Float32Array = buffer.getChannelData(channel);
      for (frame in 0...frameCount) {
        var sample = samples[frame];
        if (sample < -1) sample = -1;
        if (sample > 1) sample = 1;
        var scaled = Std.int(sample * 32767);
        if (scaled < 0) scaled += 0x10000;
        bytes.setUInt16((frame * channels + channel) * 2, scaled);
      }
    }
    final out = new lime.media.AudioBuffer();
    out.data = lime.utils.UInt8Array.fromBytes(bytes);
    out.bitsPerSample = 16;
    out.channels = channels;
    out.sampleRate = Std.int(buffer.sampleRate);
    return out;
  }
}
#end
#end
