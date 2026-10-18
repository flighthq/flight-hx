// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clipboard/contract.hpp")
extern class Attempt_Clipboard_writeClipboard extends AttemptConfig {
  @:native("flight::clipboard::write_clipboard")
  public static function writeClipboard(hostClipboardFormats:flight.HostClipboardFormatsCapability, items:Array<flight.ClipboardWriteItem>):flight._internal._Promise<Bool>;
}
#end
