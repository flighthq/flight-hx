// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

inline function applyGamepadAxisDeadZone(value:Float, deadZone:Float):Float {
  return flight._cpp._fn.Input.applyGamepadAxisDeadZone(value, deadZone);
}
