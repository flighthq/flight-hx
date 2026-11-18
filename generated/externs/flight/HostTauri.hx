package flight;

#if (js && flight_esm)
import flight.HostApp.WindowCapabilities;
#end

class HostTauri {
  #if (js && flight_esm)
  public static inline function window(api:Dynamic):WindowCapabilities
    return TauriExports.tauriHostWindow(api);
  #end
}

#if (js && flight_esm)
@:jsRequire("@flighthq/host-tauri")
private extern class TauriExports {
  static function tauriHostWindow(api:Dynamic):WindowCapabilities;
}
#end
