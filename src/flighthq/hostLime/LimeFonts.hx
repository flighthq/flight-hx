// Maintained host adapter: public font registration for the Lime target.
// Registers a lime.text.Font under a CSS family name so the native canvas
// text stack — fillText, real measureText metrics, and every canvas-backed
// shaper/rasterizer path — resolves it when a Flight text format names the
// family. This is the supported entry point; consumers should not reach into
// flighthq._internal for it.
package flighthq.hostLime;

#if (lime && !js && lime_cairo)
class LimeFonts {
  /** Registration entry point, Flight-style: `registerLimeFont('Vera', font)`.
   * Register bold/italic faces separately with the matching flags. */
  public static function registerLimeFont(family:String, font:lime.text.Font, bold:Bool = false,
      italic:Bool = false):Void {
    flighthq._internal.backend.NativeCanvas2dContext.registerFont(family, font, bold, italic);
  }
}
#end
