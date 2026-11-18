package flight;

#if (js && flight_esm)
import flight.HostApp.AppNameCapability;
#end

class HostCapacitor {
  #if (js && flight_esm)
  public static inline function appName(api:Dynamic):AppNameCapability
    return CapacitorExports.capacitorHostAppName(api);
  #end
}

#if (js && flight_esm)
@:jsRequire("@flighthq/host-capacitor")
private extern class CapacitorExports {
  static function capacitorHostAppName(api:Dynamic):AppNameCapability;
}
#end
