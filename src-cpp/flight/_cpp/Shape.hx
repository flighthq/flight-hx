package flight._cpp;

abstract Shape(Int) to Int {
  @:to public inline function asScene2dNode():Scene2dNode return cast this;
}
