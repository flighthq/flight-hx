// Maintained host adapter: Flight loop backend over the Clay frame tick.
// Clay counterpart of flight.hostLime.LimeLoop. Divergence: Lime exposes a
// signal (`application.onUpdate.add`); Clay is subclass-driven, so the frame
// source is `clay.Events.tick(delta)`. This backend queues Flight's frame
// callbacks and drains them from `pump()`, which the host's clay.Events wires
// into its `tick` (see this package's README, "Loop wiring").
package flight.hostClay;

#if clay
import clay.Clay;

class ClayLoop {
  /** Allocation entry point, Flight-style. Returns the LoopBackend plus a
   * `pump` the Clay app calls each frame from `clay.Events.tick`. */
  public static function createClayLoopBackend():ClayLoopBackend {
    return new ClayLoopBackend();
  }
}

@:keep
class ClayLoopBackend {
  var nextHandle = 1;
  final pending = new Map<Int, Float->Void>();

  public function new() {}

  /** Drives due frame callbacks. Call once per Clay frame from
   * `clay.Events.tick`. Uses Clay's own timestamp so Flight's timing matches
   * the host clock. */
  public function pump():Void {
    // Snapshot due handles first: a callback scheduled from inside a callback
    // (Flight's rAF re-arm pattern) gets a new handle outside this snapshot and
    // runs next frame; a cancel issued mid-drain still cancels a pending entry.
    final due = [for (handle in pending.keys()) handle];
    final time = Clay.app.timestamp * 1000.0; // Clay timestamp is seconds; Flight expects ms.
    for (handle in due) {
      final callback = pending.get(handle);
      if (callback == null) continue;
      pending.remove(handle);
      callback(time);
    }
  }

  /** The Flight LoopBackend seam. Typed structurally like the Lime adapter's
   * return so `setLoopBackend` accepts it. */
  public function backend():flight.types.LoopBackend {
    return cast {
      requestFrame: function(callback:Float->Void):flight._internal._Any {
        final handle = nextHandle++;
        pending.set(handle, callback);
        return handle;
      },
      cancelFrame: function(handle:flight._internal._Any):Void {
        pending.remove(Std.int(cast handle));
      },
      now: function():Float return Clay.app.timestamp * 1000.0,
    };
  }
}
#end
