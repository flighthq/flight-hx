// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clipboard/contract.hpp")
extern class Attempt_Clipboard_clearClipboard extends AttemptConfig {
  @:native("flight::clipboard::clear_clipboard")
  public static function clearClipboard(hostClipboardText:flight.HostClipboardTextCapability):flight._internal._Promise<Bool>;
}
#end
