// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clipboard/contract.hpp")
extern class Attempt_Clipboard_readClipboardImage extends AttemptConfig {
  @:native("flight::clipboard::read_clipboard_image")
  public static function readClipboardImage(hostClipboardImage:flight.HostClipboardImageCapability):flight._internal._Promise<String>;
}
#end
