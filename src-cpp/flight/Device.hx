// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function createDeviceCapabilities():flight.DeviceCapabilities {
  return flight._cpp._fn.Device.createDeviceCapabilities();
}

extern inline function createDeviceDisplayMetrics():flight.DeviceDisplayMetrics {
  return flight._cpp._fn.Device.createDeviceDisplayMetrics();
}

extern inline function createDeviceInfo():flight.DeviceInfo {
  return flight._cpp._fn.Device.createDeviceInfo();
}

extern inline function createSafeAreaInsets():flight.SafeAreaInsets {
  return flight._cpp._fn.Device.createSafeAreaInsets();
}

extern inline function getDeviceCapabilities(hostDevice:flight.HostDeviceCapability, out:flight.DeviceCapabilities):flight.DeviceCapabilities {
  return flight._cpp._fn.Device.getDeviceCapabilities(hostDevice, out);
}

extern inline function getDeviceDisplayMetrics(hostDevice:flight.HostDeviceCapability, out:flight.DeviceDisplayMetrics):flight.DeviceDisplayMetrics {
  return flight._cpp._fn.Device.getDeviceDisplayMetrics(hostDevice, out);
}

extern inline function getDeviceId(hostDevice:flight.HostDeviceCapability):String {
  return flight._cpp._fn.Device.getDeviceId(hostDevice);
}

extern inline function getDeviceInfo(hostDevice:flight.HostDeviceCapability, out:flight.DeviceInfo):flight.DeviceInfo {
  return flight._cpp._fn.Device.getDeviceInfo(hostDevice, out);
}

extern inline function getSafeAreaInsets(hostDevice:flight.HostDeviceCapability, out:flight.SafeAreaInsets):flight.SafeAreaInsets {
  return flight._cpp._fn.Device.getSafeAreaInsets(hostDevice, out);
}

extern inline function refreshDeviceInfo(hostDevice:flight.HostDeviceCapability):Void {
  flight._cpp._fn.Device.refreshDeviceInfo(hostDevice);
}
