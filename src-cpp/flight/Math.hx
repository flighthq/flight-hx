// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

inline function ceilPowerOfTwo(n:Float):Float {
  return flight._cpp._fn.Math.ceilPowerOfTwo(n);
}

inline function ceilTo(value:Float, step:Float):Float {
  return flight._cpp._fn.Math.ceilTo(value, step);
}

inline function clamp(value:Float, min:Float, max:Float):Float {
  return flight._cpp._fn.Math.clamp(value, min, max);
}

inline function damp(current:Float, target:Float, lambda:Float, deltaTime:Float):Float {
  return flight._cpp._fn.Math.damp(current, target, lambda, deltaTime);
}

inline function degToRad(degrees:Float):Float {
  return flight._cpp._fn.Math.degToRad(degrees);
}

inline function deltaAngle(from:Float, to:Float):Float {
  return flight._cpp._fn.Math.deltaAngle(from, to);
}

inline function euclideanMod(value:Float, divisor:Float):Float {
  return flight._cpp._fn.Math.euclideanMod(value, divisor);
}

inline function factorial(n:Float):Float {
  return flight._cpp._fn.Math.factorial(n);
}

inline function floorPowerOfTwo(n:Float):Float {
  return flight._cpp._fn.Math.floorPowerOfTwo(n);
}

inline function floorTo(value:Float, step:Float):Float {
  return flight._cpp._fn.Math.floorTo(value, step);
}

inline function fract(value:Float):Float {
  return flight._cpp._fn.Math.fract(value);
}

inline function gcd(a:Float, b:Float):Float {
  return flight._cpp._fn.Math.gcd(a, b);
}

inline function hash2D(x:Float, y:Float):Float {
  return flight._cpp._fn.Math.hash2D(x, y);
}

inline function hash3D(x:Float, y:Float, z:Float):Float {
  return flight._cpp._fn.Math.hash3D(x, y, z);
}

inline function hashCombine(seed:Float, value:Float):Float {
  return flight._cpp._fn.Math.hashCombine(seed, value);
}

inline function hashUint32(value:Float):Float {
  return flight._cpp._fn.Math.hashUint32(value);
}

inline function hypot2(x:Float, y:Float):Float {
  return flight._cpp._fn.Math.hypot2(x, y);
}

inline function inRange(value:Float, min:Float, max:Float):Bool {
  return flight._cpp._fn.Math.inRange(value, min, max);
}

inline function inverseLerp(a:Float, b:Float, value:Float):Float {
  return flight._cpp._fn.Math.inverseLerp(a, b, value);
}

inline function isEven(n:Float):Bool {
  return flight._cpp._fn.Math.isEven(n);
}

inline function isOdd(n:Float):Bool {
  return flight._cpp._fn.Math.isOdd(n);
}

inline function isPowerOfTwo(n:Float):Bool {
  return flight._cpp._fn.Math.isPowerOfTwo(n);
}

inline function lcm(a:Float, b:Float):Float {
  return flight._cpp._fn.Math.lcm(a, b);
}

inline function lerp(a:Float, b:Float, t:Float):Float {
  return flight._cpp._fn.Math.lerp(a, b, t);
}

inline function lerpAngle(a:Float, b:Float, t:Float):Float {
  return flight._cpp._fn.Math.lerpAngle(a, b, t);
}

inline function moveTowards(current:Float, target:Float, maxDelta:Float):Float {
  return flight._cpp._fn.Math.moveTowards(current, target, maxDelta);
}

inline function nextMultipleOf(value:Float, multiple:Float):Float {
  return flight._cpp._fn.Math.nextMultipleOf(value, multiple);
}

inline function nextPowerOfTwo(n:Float):Float {
  return flight._cpp._fn.Math.nextPowerOfTwo(n);
}

inline function normalizeAngle(radians:Float):Float {
  return flight._cpp._fn.Math.normalizeAngle(radians);
}

inline function pingPong(t:Float, length:Float):Float {
  return flight._cpp._fn.Math.pingPong(t, length);
}

inline function previousPowerOfTwo(n:Float):Float {
  return flight._cpp._fn.Math.previousPowerOfTwo(n);
}

inline function quantize(value:Float, steps:Float, min:Float, max:Float):Float {
  return flight._cpp._fn.Math.quantize(value, steps, min, max);
}

inline function radToDeg(radians:Float):Float {
  return flight._cpp._fn.Math.radToDeg(radians);
}

inline function remap(value:Float, inMin:Float, inMax:Float, outMin:Float, outMax:Float):Float {
  return flight._cpp._fn.Math.remap(value, inMin, inMax, outMin, outMax);
}

inline function repeat(t:Float, length:Float):Float {
  return flight._cpp._fn.Math.repeat(t, length);
}

inline function roundTo(value:Float, step:Float):Float {
  return flight._cpp._fn.Math.roundTo(value, step);
}

inline function saturate(value:Float):Float {
  return flight._cpp._fn.Math.saturate(value);
}

inline function sign(value:Float):Float {
  return flight._cpp._fn.Math.sign(value);
}

inline function smootherStep(edge0:Float, edge1:Float, x:Float):Float {
  return flight._cpp._fn.Math.smootherStep(edge0, edge1, x);
}

inline function smoothStep(edge0:Float, edge1:Float, x:Float):Float {
  return flight._cpp._fn.Math.smoothStep(edge0, edge1, x);
}

inline function step(edge:Float, x:Float):Float {
  return flight._cpp._fn.Math.step(edge, x);
}
