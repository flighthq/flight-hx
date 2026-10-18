// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clipboard/contract.hpp")
extern class Attempt_Clipboard_writeClipboardHtml extends AttemptConfig {
  @:native("flight::clipboard::write_clipboard_html")
  public static function writeClipboardHtml(hostClipboardFormats:flight.HostClipboardFormatsCapability, html:String):flight._internal._Promise<Bool>;
}
#end
