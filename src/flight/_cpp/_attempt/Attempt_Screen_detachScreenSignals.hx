// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_detachScreenSignals extends AttemptConfig {
  @:native("flight::screen::detach_screen_signals")
  public static function detachScreenSignals(signals:flight.ScreenSignals):Void;
}
#end
