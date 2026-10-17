package flight._cpp;

abstract Sprite(Int) to Int {
  @:to public inline function asScene2dNode():Scene2dNode return cast this;
}
