// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clipboard/contract.hpp")
extern class Attempt_Clipboard_hasClipboardText extends AttemptConfig {
  @:native("flight::clipboard::has_clipboard_text")
  public static function hasClipboardText(hostClipboardText:flight.HostClipboardTextCapability):flight._internal._Promise<Bool>;
}
#end
