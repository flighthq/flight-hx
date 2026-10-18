// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clipboard/contract.hpp")
extern class Attempt_Clipboard_disposeClipboardWatch extends AttemptConfig {
  @:native("flight::clipboard::dispose_clipboard_watch")
  public static function disposeClipboardWatch(watch:flight.ClipboardWatch):Void;
}
#end
