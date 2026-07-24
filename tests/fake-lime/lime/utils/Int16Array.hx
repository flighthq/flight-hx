package lime.utils;

abstract Int16Array(Array<Int>) {
  public var length(get, never):Int;

  public function new(length:Int) {
    this = [for (_ in 0...length) 0];
  }

  inline function get_length():Int return this.length;

  @:arrayAccess public inline function get(index:Int):Int return this[index];

  @:arrayAccess public inline function set(index:Int, value:Int):Int return this[index] = value;
}
