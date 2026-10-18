// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clipboard/contract.hpp")
extern class Attempt_Clipboard_getClipboardFormats extends AttemptConfig {
  @:native("flight::clipboard::get_clipboard_formats")
  public static function getClipboardFormats(hostClipboardFormats:flight.HostClipboardFormatsCapability):flight._internal._Promise<Array<String>>;
}
#end
