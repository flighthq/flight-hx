// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clipboard/contract.hpp")
extern class Attempt_Clipboard_writeClipboardBookmark extends AttemptConfig {
  @:native("flight::clipboard::write_clipboard_bookmark")
  public static function writeClipboardBookmark(hostClipboardBookmark:flight.HostClipboardBookmarkCapability, title:String, url:String):flight._internal._Promise<Bool>;
}
#end
