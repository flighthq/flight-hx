// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

#if !js
/**
 * Portable `DataView` over a lime `ArrayBuffer` (haxe.io.Bytes on native).
 *
 * JS semantics: reads and writes default to BIG-endian unless the trailing
 * `littleEndian` flag is true. `haxe.io.Bytes` multi-byte accessors are
 * little-endian on every target, so big-endian requests byte-swap.
 */
// Reached only reflectively through _HostValueLut, so full DCE must not
// strip the constructor or members.
@:keep
class _DataView {
  public final buffer:haxe.io.Bytes;
  public final byteOffset:Int;
  public final byteLength:Int;

  public function new(source:Dynamic, ?byteOffset:Dynamic, ?byteLength:Dynamic) {
    buffer = cast source;
    this.byteOffset = byteOffset == null ? 0 : Std.int(byteOffset);
    this.byteLength = byteLength == null ? buffer.length - this.byteOffset : Std.int(byteLength);
  }

  inline function at(offset:Float):Int {
    return byteOffset + Std.int(offset);
  }

  public function getUint8(offset:Float):Int {
    return buffer.get(at(offset));
  }

  public function getInt8(offset:Float):Int {
    final value = buffer.get(at(offset));
    return value >= 128 ? value - 256 : value;
  }

  public function getUint16(offset:Float, littleEndian:Bool = false):Int {
    final position = at(offset);
    final little = buffer.getUInt16(position);
    return littleEndian ? little : ((little & 0xff) << 8) | (little >> 8);
  }

  public function getInt16(offset:Float, littleEndian:Bool = false):Int {
    final value = getUint16(offset, littleEndian);
    return value >= 32768 ? value - 65536 : value;
  }

  public function getUint32(offset:Float, littleEndian:Bool = false):Float {
    final signed = getInt32(offset, littleEndian);
    return signed < 0 ? signed + 4294967296.0 : signed;
  }

  public function getInt32(offset:Float, littleEndian:Bool = false):Int {
    final position = at(offset);
    final little = buffer.getInt32(position);
    if (littleEndian) return little;
    return ((little & 0xff) << 24) | ((little & 0xff00) << 8) | ((little >>> 8) & 0xff00) | (little >>> 24);
  }

  public function getFloat32(offset:Float, littleEndian:Bool = false):Float {
    if (littleEndian) return buffer.getFloat(at(offset));
    return swappedScratch(at(offset), 4).getFloat(0);
  }

  public function getFloat64(offset:Float, littleEndian:Bool = false):Float {
    if (littleEndian) return buffer.getDouble(at(offset));
    return swappedScratch(at(offset), 8).getDouble(0);
  }

  public function setUint8(offset:Float, value:Float):Void {
    buffer.set(at(offset), Std.int(value) & 0xff);
  }

  public function setInt8(offset:Float, value:Float):Void {
    setUint8(offset, value);
  }

  public function setUint16(offset:Float, value:Float, littleEndian:Bool = false):Void {
    final raw = Std.int(value) & 0xffff;
    buffer.setUInt16(at(offset), littleEndian ? raw : ((raw & 0xff) << 8) | (raw >> 8));
  }

  public function setInt16(offset:Float, value:Float, littleEndian:Bool = false):Void {
    setUint16(offset, value, littleEndian);
  }

  public function setUint32(offset:Float, value:Float, littleEndian:Bool = false):Void {
    setInt32(offset, value, littleEndian);
  }

  public function setInt32(offset:Float, value:Float, littleEndian:Bool = false):Void {
    final raw = _Runtime.toInt32(value);
    final stored = littleEndian ? raw : ((raw & 0xff) << 24) | ((raw & 0xff00) << 8) | ((raw >>> 8) & 0xff00) | (raw >>> 24);
    buffer.setInt32(at(offset), stored);
  }

  public function setFloat32(offset:Float, value:Float, littleEndian:Bool = false):Void {
    if (littleEndian) {
      buffer.setFloat(at(offset), value);
      return;
    }
    final scratch = haxe.io.Bytes.alloc(4);
    scratch.setFloat(0, value);
    for (index in 0...4) buffer.set(at(offset) + index, scratch.get(3 - index));
  }

  public function setFloat64(offset:Float, value:Float, littleEndian:Bool = false):Void {
    if (littleEndian) {
      buffer.setDouble(at(offset), value);
      return;
    }
    final scratch = haxe.io.Bytes.alloc(8);
    scratch.setDouble(0, value);
    for (index in 0...8) buffer.set(at(offset) + index, scratch.get(7 - index));
  }

  function swappedScratch(position:Int, count:Int):haxe.io.Bytes {
    final scratch = haxe.io.Bytes.alloc(count);
    for (index in 0...count) scratch.set(index, buffer.get(position + count - 1 - index));
    return scratch;
  }
}
#end
