// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/device/contract.hpp")
extern class Attempt_Device_getSafeAreaInsets extends AttemptConfig {
  @:native("flight::device::get_safe_area_insets")
  public static function getSafeAreaInsets(hostDevice:flight.HostDeviceCapability, out:flight.SafeAreaInsets):flight.SafeAreaInsets;
}
#end
