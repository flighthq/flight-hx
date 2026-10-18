// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function comparePlatformVersions(a:String, b:String):Dynamic {
  return flight._cpp._attempt.Attempt_Platform_comparePlatformVersions.comparePlatformVersions(a, b);
}

extern inline function createPlatformInfo():flight.PlatformInfo {
  return flight._cpp._attempt.Attempt_Platform_createPlatformInfo.createPlatformInfo();
}

extern inline function getPlatformEngine(hostPlatform:flight.HostPlatformCapability):flight.PlatformEngine {
  return flight._cpp._attempt.Attempt_Platform_getPlatformEngine.getPlatformEngine(hostPlatform);
}

extern inline function getPlatformInfo(hostPlatform:flight.HostPlatformCapability, out:flight.PlatformInfo):flight.PlatformInfo {
  return flight._cpp._attempt.Attempt_Platform_getPlatformInfo.getPlatformInfo(hostPlatform, out);
}

extern inline function getPlatformKind(hostPlatform:flight.HostPlatformCapability):flight.PlatformKind {
  return flight._cpp._attempt.Attempt_Platform_getPlatformKind.getPlatformKind(hostPlatform);
}

extern inline function getPlatformName(hostPlatform:flight.HostPlatformCapability):flight.PlatformName {
  return flight._cpp._attempt.Attempt_Platform_getPlatformName.getPlatformName(hostPlatform);
}

extern inline function getPlatformRuntime(hostPlatform:flight.HostPlatformCapability):flight.PlatformRuntime {
  return flight._cpp._attempt.Attempt_Platform_getPlatformRuntime.getPlatformRuntime(hostPlatform);
}

extern inline function initializePlatformInfo(out:flight.EntityConstruction<flight.PlatformInfo>):Void {
  flight._cpp._attempt.Attempt_Platform_initializePlatformInfo.initializePlatformInfo(out);
}

extern inline function isPlatformDesktop(hostPlatform:flight.HostPlatformCapability):Bool {
  return flight._cpp._attempt.Attempt_Platform_isPlatformDesktop.isPlatformDesktop(hostPlatform);
}

extern inline function isPlatformMobile(hostPlatform:flight.HostPlatformCapability):Bool {
  return flight._cpp._attempt.Attempt_Platform_isPlatformMobile.isPlatformMobile(hostPlatform);
}

extern inline function isPlatformNative(hostPlatform:flight.HostPlatformCapability):Bool {
  return flight._cpp._attempt.Attempt_Platform_isPlatformNative.isPlatformNative(hostPlatform);
}

extern inline function isPlatformTouch(hostPlatform:flight.HostPlatformCapability):Bool {
  return flight._cpp._attempt.Attempt_Platform_isPlatformTouch.isPlatformTouch(hostPlatform);
}

extern inline function isPlatformVersionAtLeast(hostPlatform:flight.HostPlatformCapability, minimum:String):Bool {
  return flight._cpp._attempt.Attempt_Platform_isPlatformVersionAtLeast.isPlatformVersionAtLeast(hostPlatform, minimum);
}

extern inline function isPlatformWeb(hostPlatform:flight.HostPlatformCapability):Bool {
  return flight._cpp._attempt.Attempt_Platform_isPlatformWeb.isPlatformWeb(hostPlatform);
}
