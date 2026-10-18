// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

inline function areEntityRuntimeGuardsEnabled():Bool {
  return flight._cpp._fn.Entity.areEntityRuntimeGuardsEnabled();
}

inline function disableEntityRuntimeGuards():Void {
  flight._cpp._fn.Entity.disableEntityRuntimeGuards();
}

inline function setEntityRuntimeGuardMode(enabled:Bool):Void {
  flight._cpp._fn.Entity.setEntityRuntimeGuardMode(enabled);
}
