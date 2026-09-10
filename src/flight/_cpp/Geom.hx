package flight._cpp;

// C++ backend: direct C++ externs over flight-cpp symbols (not CFFI). DRAFT —
// the real `@:native` names/headers are generated from flight-compiler's C++
// naming (the same that produced flight-cpp), so these can't drift from the real
// symbols. Guarded `#if cpp`; inert until a native build with flight-cpp linked.
#if cpp
@:include("flight/geom.h")
extern class Geom {
  @:native("flight::addVector2")
  static function addVector2(a:flight._cpp.Vector2, b:flight._cpp.Vector2):flight._cpp.Vector2;

  @:native("flight::lengthVector2")
  static function lengthVector2(a:flight._cpp.Vector2):Float;
}
#end
