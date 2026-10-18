// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_createBitmapFromImageSource extends AttemptConfig {
  @:native("flight::bitmap::create_bitmap_from_image_source")
  public static function createBitmapFromImageSource(hostBitmapReadback:flight.HostBitmapReadbackCapability, source:flight.HostImageSource, width:Float, height:Float):Null<flight.Bitmap>;
}
#end
