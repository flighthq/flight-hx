// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

/** Numeric requestAnimationFrame handles over the portable Haxe timer loop. */
class _HostScheduler {
  static final timers:Map<Int, haxe.Timer> = [];
  static var nextHandle = 1;

  public static function cancelAnimationFrame(handle:Dynamic):Void {
    final id = Std.int(handle);
    final timer = timers.get(id);
    if (timer == null) return;
    timers.remove(id);
    timer.stop();
  }

  public static function requestAnimationFrame(callback:Dynamic):Float {
    final id = nextHandle++;
    final timer = haxe.Timer.delay(function():Void {
      timers.remove(id);
      _Runtime.callValue(callback, [haxe.Timer.stamp() * 1000.0]);
    }, 16);
    timers.set(id, timer);
    return id;
  }
}
