package flight._hx;

// Transpiled-Haxe backend bodies. In the real repo these are generated from
// Flight's TypeScript by flight-compiler's Haxe (impl) backend; here they are a
// hand-written proof-of-shape for two functions.
#if flight_hx
class Geom {
  public static function addVector2(a:Vector2, b:Vector2):Vector2 {
    return {x: a.x + b.x, y: a.y + b.y};
  }

  public static function lengthVector2(a:Vector2):Float {
    return Math.sqrt(a.x * a.x + a.y * a.y);
  }
}
#end
