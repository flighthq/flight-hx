// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clipboard/contract.hpp")
extern class Attempt_Clipboard_hasClipboardHtml extends AttemptConfig {
  @:native("flight::clipboard::has_clipboard_html")
  public static function hasClipboardHtml(hostClipboardFormats:flight.HostClipboardFormatsCapability):flight._internal._Promise<Bool>;
}
#end
