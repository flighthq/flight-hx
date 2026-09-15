package flight._internal;

#if js
@:forward
abstract _DataView<T = Dynamic>(js.lib.DataView) from js.lib.DataView to js.lib.DataView {
  public inline function new(buffer:Dynamic, ?byteOffset:Float, ?byteLength:Float) {
    this = cast js.Syntax.code(
      "{2} != null ? new DataView({0}, {1}, {2}) : {1} != null ? new DataView({0}, {1}) : new DataView({0})",
      buffer,
      byteOffset,
      byteLength,
    );
  }

  public inline function getFloat32(offset:Float, littleEndian:Bool = false):Float {
    return js.Syntax.code("{0}.getFloat32({1}, {2})", this, offset, littleEndian);
  }

  public inline function getFloat64(offset:Float, littleEndian:Bool = false):Float {
    return js.Syntax.code("{0}.getFloat64({1}, {2})", this, offset, littleEndian);
  }

  public inline function getInt8(offset:Float):Float {
    return js.Syntax.code("{0}.getInt8({1})", this, offset);
  }

  public inline function getInt16(offset:Float, littleEndian:Bool = false):Float {
    return js.Syntax.code("{0}.getInt16({1}, {2})", this, offset, littleEndian);
  }

  public inline function getInt32(offset:Float, littleEndian:Bool = false):Float {
    return js.Syntax.code("{0}.getInt32({1}, {2})", this, offset, littleEndian);
  }

  public inline function getUint8(offset:Float):Float {
    return js.Syntax.code("{0}.getUint8({1})", this, offset);
  }

  public inline function getUint16(offset:Float, littleEndian:Bool = false):Float {
    return js.Syntax.code("{0}.getUint16({1}, {2})", this, offset, littleEndian);
  }

  public inline function getUint32(offset:Float, littleEndian:Bool = false):Float {
    return js.Syntax.code("{0}.getUint32({1}, {2})", this, offset, littleEndian);
  }

  public inline function setFloat32(offset:Float, value:Float, littleEndian:Bool = false):Void {
    js.Syntax.code("{0}.setFloat32({1}, {2}, {3})", this, offset, value, littleEndian);
  }

  public inline function setFloat64(offset:Float, value:Float, littleEndian:Bool = false):Void {
    js.Syntax.code("{0}.setFloat64({1}, {2}, {3})", this, offset, value, littleEndian);
  }

  public inline function setInt8(offset:Float, value:Float):Void {
    js.Syntax.code("{0}.setInt8({1}, {2})", this, offset, value);
  }

  public inline function setInt16(offset:Float, value:Float, littleEndian:Bool = false):Void {
    js.Syntax.code("{0}.setInt16({1}, {2}, {3})", this, offset, value, littleEndian);
  }

  public inline function setInt32(offset:Float, value:Float, littleEndian:Bool = false):Void {
    js.Syntax.code("{0}.setInt32({1}, {2}, {3})", this, offset, value, littleEndian);
  }

  public inline function setUint8(offset:Float, value:Float):Void {
    js.Syntax.code("{0}.setUint8({1}, {2})", this, offset, value);
  }

  public inline function setUint16(offset:Float, value:Float, littleEndian:Bool = false):Void {
    js.Syntax.code("{0}.setUint16({1}, {2}, {3})", this, offset, value, littleEndian);
  }

  public inline function setUint32(offset:Float, value:Float, littleEndian:Bool = false):Void {
    js.Syntax.code("{0}.setUint32({1}, {2}, {3})", this, offset, value, littleEndian);
  }
}
#else
#error "DataView-backed transpiled modules require a target runtime implementation."
#end
