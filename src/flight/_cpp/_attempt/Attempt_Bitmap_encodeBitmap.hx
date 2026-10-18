// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_encodeBitmap extends AttemptConfig {
  @:native("flight::bitmap::encode_bitmap")
  public static function encodeBitmap(hostBitmapEncode:flight.HostBitmapEncodeCapability, source:flight.Bitmap, ?format:flight.ImageFormat, ?quality:Float):Null<flight._internal._UInt8Array>;
}
#end
