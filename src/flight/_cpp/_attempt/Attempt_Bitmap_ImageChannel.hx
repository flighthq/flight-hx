// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_ImageChannel extends AttemptConfig {
  @:native("flight::bitmap::image_channel")
  public static var ImageChannel:{ Red:Float, Green:Float, Blue:Float, Alpha:Float };
}
#end
