package lime.utils;

abstract UInt8Array(Array<Int>) {
  public var length(get, never):Int;

  public function new(?length:Int, ?buffer:ArrayBuffer, ?array:Array<Dynamic>, ?view:ArrayBufferView, ?byteOffset:Int, ?viewLength:Int) {
    final size = length == null ? (viewLength == null ? 0 : viewLength) : length;
    this = [for (_ in 0...size) 0];
  }

  inline function get_length():Int return this.length;

  @:arrayAccess public inline function get(index:Int):Int return this[index];

  @:arrayAccess public inline function set(index:Int, value:Int):Int return this[index] = value;
}
