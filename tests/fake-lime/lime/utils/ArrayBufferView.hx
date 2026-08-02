package lime.utils;

// Minimal stand-in for Lime's ArrayBufferView: a class value with the typed
// discriminator, so runtime raw-view dispatch compiles against the fake. Fake
// typed arrays erase to plain Haxe arrays and never instantiate this class.
class ArrayBufferView {
  public var type = TypedArrayType.None;
  public var length:Int = 0;
  public var byteLength:Int = 0;
  public var byteOffset:Int = 0;
  public var buffer:haxe.io.Bytes = null;

  public function new() {}
}

enum abstract TypedArrayType(Int) from Int to Int {
  var None = 0;
  var Int8 = 1;
  var Int16 = 2;
  var Int32 = 3;
  var Uint8 = 4;
  var Uint8Clamped = 5;
  var Uint16 = 6;
  var Uint32 = 7;
  var Float32 = 8;
  var Float64 = 9;
}
