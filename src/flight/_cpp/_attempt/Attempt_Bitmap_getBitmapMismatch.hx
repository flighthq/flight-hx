// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_getBitmapMismatch extends AttemptConfig {
  @:native("flight::bitmap::get_bitmap_mismatch")
  public static function getBitmapMismatch(source:{ width:Float, height:Float, data:Dynamic }, other:{ width:Float, height:Float, data:Dynamic }, ?channelTolerance:Float):flight.BitmapMismatch;
}
#end
