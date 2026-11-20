package flight;

#if (js && flight_esm)
import flight.AppWindow;
import flight.HostApp.WindowCapabilities;
#end

class HostElectron {
  #if (js && flight_esm)
  public static inline function window(api:Dynamic):WindowCapabilities
    return ElectronExports.electronHostWindow(api);

  public static inline function getWindowId(window:AppWindow):Int
    return ElectronExports.getElectronWindowId(window);
  #end
}

#if (js && flight_esm)
@:jsRequire("@flighthq/host-electron")
private extern class ElectronExports {
  static function electronHostWindow(api:Dynamic):WindowCapabilities;
  static function getElectronWindowId(window:AppWindow):Int;
}
#end
