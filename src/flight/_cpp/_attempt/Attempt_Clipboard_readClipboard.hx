// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clipboard/contract.hpp")
extern class Attempt_Clipboard_readClipboard extends AttemptConfig {
  @:native("flight::clipboard::read_clipboard")
  public static function readClipboard(hostClipboardFormats:flight.HostClipboardFormatsCapability, formats:Array<String>):flight._internal._Promise<haxe.DynamicAccess<String>>;
}
#end
