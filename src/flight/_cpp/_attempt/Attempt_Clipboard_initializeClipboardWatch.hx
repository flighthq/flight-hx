// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clipboard/contract.hpp")
extern class Attempt_Clipboard_initializeClipboardWatch extends AttemptConfig {
  @:native("flight::clipboard::initialize_clipboard_watch")
  public static function initializeClipboardWatch(out:flight.EntityConstruction<flight.ClipboardWatch>):Void;
}
#end
