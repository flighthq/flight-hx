package lime.utils;

abstract Float32Array(Array<Float>) {
  public var length(get, never):Int;

  public function new(length:Int) {
    this = [for (_ in 0...length) 0.0];
  }

  inline function get_length():Int return this.length;

  @:arrayAccess public inline function get(index:Int):Float return this[index];

  @:arrayAccess public inline function set(index:Int, value:Float):Float return this[index] = value;
}
