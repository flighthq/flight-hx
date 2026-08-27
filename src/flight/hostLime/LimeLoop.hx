// Maintained host adapter: Flight loop backend over the Lime frame loop.
// Upstream's `createWebLoopBackend` wraps requestAnimationFrame; this backend
// drives the same callbacks from `lime.app.Application.onUpdate` so
// `startApplicationLoop`/`stopApplicationLoop` work natively. Install with
// `setLoopBackend(LimeLoop.createLimeLoopBackend(this))`.
package flight.hostLime;

#if lime
import lime.app.Application;

class LimeLoop {
  /** Allocation entry point, Flight-style: `createLimeLoopBackend(application)`. */
  public static function createLimeLoopBackend(application:Application):flight.types.LoopBackend {
    var nextHandle = 1;
    final pending = new Map<Int, Float->Void>();
    final now = function():Float return lime.system.System.getTimer();
    application.onUpdate.add(function(_deltaTime:Int):Void {
      // Snapshot the due handles first: a callback scheduled from inside a
      // callback (the rAF re-arm pattern in startApplicationLoop) gets a new
      // handle outside this snapshot and runs on the NEXT frame, and a
      // cancelFrame issued mid-drain still cancels a not-yet-invoked entry.
      final due = [for (handle in pending.keys()) handle];
      final time = now();
      for (handle in due) {
        final callback = pending.get(handle);
        if (callback == null) continue;
        pending.remove(handle);
        callback(time);
      }
    });
    return cast {
      requestFrame: function(callback:Float->Void):flight._internal._Any {
        final handle = nextHandle++;
        pending.set(handle, callback);
        return handle;
      },
      cancelFrame: function(handle:flight._internal._Any):Void {
        pending.remove(Std.int(cast handle));
      },
      now: now,
    };
  }
}
#end
