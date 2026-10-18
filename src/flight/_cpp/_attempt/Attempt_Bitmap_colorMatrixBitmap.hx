// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_colorMatrixBitmap extends AttemptConfig {
  @:native("flight::bitmap::color_matrix_bitmap")
  public static function colorMatrixBitmap(out:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, matrix:Array<Float>):Void;
}
#end
