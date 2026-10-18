// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_applyBitmapPaletteMap extends AttemptConfig {
  @:native("flight::bitmap::apply_bitmap_palette_map")
  public static function applyBitmapPaletteMap(dest:flight.BitmapRegion, source:flight.BitmapRegion, redMap:Null<Array<Float>>, greenMap:Null<Array<Float>>, blueMap:Null<Array<Float>>, alphaMap:Null<Array<Float>>):Void;
}
#end
