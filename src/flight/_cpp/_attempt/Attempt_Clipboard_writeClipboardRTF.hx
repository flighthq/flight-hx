// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clipboard/contract.hpp")
extern class Attempt_Clipboard_writeClipboardRTF extends AttemptConfig {
  @:native("flight::clipboard::write_clipboard_rtf")
  public static function writeClipboardRTF(hostClipboardFormats:flight.HostClipboardFormatsCapability, rtf:String):flight._internal._Promise<Bool>;
}
#end
