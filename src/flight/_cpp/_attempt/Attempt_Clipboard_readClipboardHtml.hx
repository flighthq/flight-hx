// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clipboard/contract.hpp")
extern class Attempt_Clipboard_readClipboardHtml extends AttemptConfig {
  @:native("flight::clipboard::read_clipboard_html")
  public static function readClipboardHtml(hostClipboardFormats:flight.HostClipboardFormatsCapability):flight._internal._Promise<String>;
}
#end
