// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clipboard/contract.hpp")
extern class Attempt_Clipboard_detachClipboardWatch extends AttemptConfig {
  @:native("flight::clipboard::detach_clipboard_watch")
  public static function detachClipboardWatch(watch:flight.ClipboardWatch):Void;
}
#end
