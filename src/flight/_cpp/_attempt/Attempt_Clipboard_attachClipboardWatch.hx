// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/clipboard/contract.hpp")
extern class Attempt_Clipboard_attachClipboardWatch extends AttemptConfig {
  @:native("flight::clipboard::attach_clipboard_watch")
  public static function attachClipboardWatch(hostClipboardChange:{ ?subscribe:(()->Void)->(()->Void) }, watch:flight.ClipboardWatch):Void;
}
#end
