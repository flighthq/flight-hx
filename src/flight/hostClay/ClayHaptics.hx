// Maintained host adapter: Flight HapticsBackend for Clay.
// Real gamepad rumble via Clay's SDL binding (SDL.rumbleGamepad) where a
// controller with rumble is connected; no arbitrary waveform/amplitude on
// desktop, mirroring hostLime's conservative subset. WRITE-AHEAD against develop
// seams. See host-develop-adaptation.md.
package flight.hostClay;

#if clay
class ClayHaptics {
  /** Install via `flight._Haptics.installHapticsHostBackend`. */
  public static function createClayHapticsBackend():Dynamic {
    final backend:Dynamic = Reflect.copy((flight._Haptics._sentinel__haptics : Dynamic));
    #if clay_sdl
    backend.vibrate = function(durationMs:Float):Bool return rumble(durationMs, 0.6, 0.6);
    backend.impact = function(style:Dynamic):Bool return rumble(40, 0.8, 0.4);
    backend.selection = function():Bool return rumble(15, 0.4, 0.2);
    backend.notification = function(kind:Dynamic):Bool return rumble(60, 0.7, 0.7);
    #end
    return cast backend;
  }

  #if clay_sdl
  static function rumble(durationMs:Float, low:Float, high:Float):Bool {
    // Rumble the first connected gamepad that supports it. TODO(develop): iterate
    // Clay's live gamepad list; here we target gamepad slot 0.
    final pad = clay.Clay.app.input.gamepad(0);
    if (pad == null || !clay.sdl.SDL.gamepadHasRumble(cast pad)) return false;
    final u16 = function(v:Float):Int return Std.int(Math.max(0, Math.min(1, v)) * 0xFFFF);
    return clay.sdl.SDL.rumbleGamepad(cast pad, u16(low), u16(high), Std.int(durationMs));
  }
  #end
}
#end
