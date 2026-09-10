import flight.Vector2;
import flight.Geom.addVector2; // a module-level free function, imported unqualified

// Proof that the flight.* surface unifies over the active backend. Compiled with
// `-D flight_hx`, it exercises: the conditional typedef (flight.Vector2), the
// module-level free-function facade (both unqualified and qualified), and the
// #if-dispatching forwarder into the hidden backend. On cpp/js it would resolve
// to _cpp/_js instead; with no backend define it fails loud at compile time.
class ProofOfShape {
  static function main():Void {
    final a:Vector2 = {x: 1.0, y: 2.0};
    final b:Vector2 = {x: 3.0, y: 4.0};

    final sum = addVector2(a, b); // unqualified, via `import flight.Geom.addVector2`
    if (sum.x != 4.0 || sum.y != 6.0) throw 'addVector2 wrong: ${sum.x},${sum.y}';

    final len = flight.Geom.lengthVector2({x: 3.0, y: 4.0}); // qualified free function
    if (Math.abs(len - 5.0) > 1e-9) throw 'lengthVector2 wrong: $len';

    report('PROOF_OF_SHAPE_OK: flight.* unified over the active backend, structural type + free-function facade');
  }

  // Portable output: `Sys` is absent on the js target, which the Lime/Clay-web
  // fallback (js + flight_hx) exercises. `trace` maps to console.log there.
  static inline function report(msg:String):Void {
    #if sys
    Sys.println(msg);
    #else
    trace(msg);
    #end
  }
}
