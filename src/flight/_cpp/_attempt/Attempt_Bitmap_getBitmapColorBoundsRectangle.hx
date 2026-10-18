// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_getBitmapColorBoundsRectangle extends AttemptConfig {
  @:native("flight::bitmap::get_bitmap_color_bounds_rectangle")
  public static function getBitmapColorBoundsRectangle(source:flight.BitmapRegion, mask:Float, color:Float, ?findColor:Bool):Null<flight.RectangleLike>;
}
#end
