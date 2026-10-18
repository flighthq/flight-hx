// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clipboard/contract.hpp")
extern class Attempt_Clipboard_hasClipboardBookmark extends AttemptConfig {
  @:native("flight::clipboard::has_clipboard_bookmark")
  public static function hasClipboardBookmark(hostClipboardBookmark:flight.HostClipboardBookmarkCapability):flight._internal._Promise<Bool>;
}
#end
