package flight._cpp;

// C++ value type: a value handle to flight-cpp's struct. DRAFT (see Geom).
#if cpp
@:structAccess
@:include("flight/geom.h")
@:native("flight::Vector2")
extern class Vector2 {
  var x:Float;
  var y:Float;
}
#end
