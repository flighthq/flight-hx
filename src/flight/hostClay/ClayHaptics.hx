// Maintained host adapter: Flight HapticsBackend for the Clay host. SDL gamepad
// rumble needs a live gamepad handle, but Clay's Input exposes no handle accessor
// in the pinned revision (only emit* event helpers), so there is no controller to
// rumble. Every operation reports unsupported (false) rather than fabricating
// feedback — the honest posture, mirroring hostLime's conservative subset.
package flight.hostClay;

#if clay
class ClayHaptics {
  /** Builds the Clay-backed haptics backend (composed into input.haptics). */
  public static function createClayHapticsBackend():Dynamic {
    final backend:Dynamic = {};
    backend.vibrate = function(_durationMs:Float):Bool return false;
    backend.impact = function(_style:Dynamic):Bool return false;
    backend.selection = function():Bool return false;
    backend.notification = function(_kind:Dynamic):Bool return false;
    return cast backend;
  }
}
#end
