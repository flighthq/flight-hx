// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

inline function getCubicBezierCurvature(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float):Float {
  return flight._cpp._fn.Path.getCubicBezierCurvature(x0, y0, c1x, c1y, c2x, c2y, x1, y1, t);
}

inline function getQuadraticBezierCurvature(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float):Float {
  return flight._cpp._fn.Path.getQuadraticBezierCurvature(x0, y0, cx, cy, x1, y1, t);
}
