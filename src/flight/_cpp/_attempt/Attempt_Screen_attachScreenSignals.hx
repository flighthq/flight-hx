// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_attachScreenSignals extends AttemptConfig {
  @:native("flight::screen::attach_screen_signals")
  public static function attachScreenSignals(hostScreenChange:flight.HostScreenChangeCapability, signals:flight.ScreenSignals):Void;
}
#end
