// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

#if lime
/**
 * Keeps JavaScript-shaped typed-array behavior while owning storage that Lime
 * can pass to native graphics APIs as an `ArrayBufferView`.
 */
// Reached reflectively through _Runtime.callProperty when generated code calls
// typed-array members on Dynamic-typed receivers, so full DCE must not strip
// any member (the established pattern for reflectively-reached runtime classes).
@:keep
class _LimeTypedArray {
  #if neko
  // Generated modules allocate typed-array scratch values during static initialization. Make
  // FPHelper initialize first so those writes cannot observe its thread-local helpers as null.
  static final __fpHelperReady = haxe.io.FPHelper.floatToI32(0.0);
  #end

  public final nativeView:Dynamic;
  public var length(default, null):Int;

  final kind:String;

  public function new(kind:String, source:Dynamic = 0, ?byteOffset:Int, ?viewLength:Int) {
    this.kind = kind;
    final sourceArray = Std.isOfType(source, _LimeTypedArray) ? (cast source : _LimeTypedArray) : null;
    if (Std.isOfType(source, haxe.io.Bytes)) {
      nativeView = createBufferView(kind, cast source, byteOffset == null ? 0 : byteOffset, viewLength);
      length = arrayBufferView(nativeView).length;
      return;
    }
    length = Std.isOfType(source, Int) || Std.isOfType(source, Float)
      ? Std.int(source)
      : sourceArray == null
        ? _Runtime.iterable(source).length
        : sourceArray.length;
    nativeView = createView(kind, length);
    if (sourceArray != null) {
      set(sourceArray);
    } else if (!Std.isOfType(source, Int) && !Std.isOfType(source, Float)) {
      final values = _Runtime.iterable(source);
      for (index in 0...values.length) setValue(index, values[index]);
    }
  }

  public function fill(value:Dynamic, start = 0, ?end:Int):_LimeTypedArray {
    final stop = end == null ? length : end;
    for (index in start...stop) setValue(index, value);
    return this;
  }

  public function get(index:Int):Dynamic {
    return switch (kind) {
      case 'float32':
        final values:lime.utils.Float32Array = cast nativeView;
        values[index];
      case 'int16':
        final values:lime.utils.Int16Array = cast nativeView;
        values[index];
      case 'uint16':
        final values:lime.utils.UInt16Array = cast nativeView;
        values[index];
      case 'uint8', 'uint8clamped':
        final values:lime.utils.UInt8Array = cast nativeView;
        values[index];
      case 'int8':
        final values:lime.utils.Int8Array = cast nativeView;
        values[index];
      case 'int32':
        final values:lime.utils.Int32Array = cast nativeView;
        values[index];
      case 'uint32':
        // Lime stores 32-bit words as signed Int; present JavaScript's
        // unsigned value range.
        final values:lime.utils.UInt32Array = cast nativeView;
        final word:Int = values[index];
        word < 0 ? word + 4294967296.0 : (word : Float);
      case 'float64':
        final values:lime.utils.Float64Array = cast nativeView;
        values[index];
      default:
        throw 'Unsupported Lime typed-array kind: ' + kind;
    };
  }

  public function set(source:Dynamic, offset:Float = 0):Void {
    final start = Std.int(offset);
    final sourceArray = Std.isOfType(source, _LimeTypedArray) ? (cast source : _LimeTypedArray) : null;
    if (sourceArray != null) {
      if (blitCompatible(kind, sourceArray.kind) && blitFrom(arrayBufferView(sourceArray.nativeView), start)) return;
      for (index in 0...sourceArray.length) setValue(start + index, sourceArray.get(index));
      return;
    }
    if (Std.isOfType(source, lime.utils.ArrayBufferView)) {
      final view:lime.utils.ArrayBufferView = cast source;
      final sourceKind = typeToKind(view.type);
      if (sourceKind != null && blitCompatible(kind, sourceKind) && blitFrom(view, start)) return;
      for (index in 0...view.length) setValue(start + index, readRaw(view, index));
      return;
    }
    final values = _Runtime.iterable(source);
    for (index in 0...values.length) setValue(start + index, values[index]);
  }

  /** Byte-level copy from a Lime view into this array's storage, replacing the
   * element-by-element loop where the JavaScript `set` conversion is
   * bit-preserving. On the interpreter targets the per-element path costs
   * seconds for megapixel copies (the spritesheet strip held its window black
   * past the smoke gate); `Bytes.blit` is native. Returns false when the
   * source does not fit, so callers keep the loop's out-of-range behavior. */
  function blitFrom(view:lime.utils.ArrayBufferView, start:Int):Bool {
    // The fake-Lime test stand-in erases typed arrays to plain Haxe arrays, so
    // byte-level storage only exists when the backing really is a Lime view.
    if (!Std.isOfType(nativeView, lime.utils.ArrayBufferView) || !Std.isOfType((view : Dynamic), lime.utils.ArrayBufferView)) return false;
    final target = arrayBufferView(nativeView);
    final bytesPerElement = elementByteSize(kind);
    final targetByteStart = target.byteOffset + start * bytesPerElement;
    if (start < 0 || targetByteStart + view.byteLength > target.byteOffset + target.byteLength) return false;
    final targetBytes:haxe.io.Bytes = target.buffer;
    final sourceBytes:haxe.io.Bytes = view.buffer;
    targetBytes.blit(targetByteStart, sourceBytes, view.byteOffset, view.byteLength);
    return true;
  }

  /** True when a raw byte copy from `sourceKind` storage into `targetKind`
   * storage produces the same elements as JavaScript's per-element `set`
   * conversion. Same-size integer conversions truncate mod 2^n, which is
   * exactly a bit copy; a clamped destination clamps instead, so it only
   * accepts sources already confined to 0..255; floats only match their own
   * width. */
  static function blitCompatible(targetKind:String, sourceKind:String):Bool {
    return switch (targetKind) {
      case 'int8', 'uint8': sourceKind == 'int8' || sourceKind == 'uint8' || sourceKind == 'uint8clamped';
      case 'uint8clamped': sourceKind == 'uint8' || sourceKind == 'uint8clamped';
      case 'int16', 'uint16': sourceKind == 'int16' || sourceKind == 'uint16';
      case 'int32', 'uint32': sourceKind == 'int32' || sourceKind == 'uint32';
      case 'float32': sourceKind == 'float32';
      case 'float64': sourceKind == 'float64';
      default: false;
    };
  }

  static function typeToKind(type:lime.utils.ArrayBufferView.TypedArrayType):Null<String> {
    return switch (type) {
      case lime.utils.ArrayBufferView.TypedArrayType.Int8: 'int8';
      case lime.utils.ArrayBufferView.TypedArrayType.Uint8: 'uint8';
      case lime.utils.ArrayBufferView.TypedArrayType.Uint8Clamped: 'uint8clamped';
      case lime.utils.ArrayBufferView.TypedArrayType.Int16: 'int16';
      case lime.utils.ArrayBufferView.TypedArrayType.Uint16: 'uint16';
      case lime.utils.ArrayBufferView.TypedArrayType.Int32: 'int32';
      case lime.utils.ArrayBufferView.TypedArrayType.Uint32: 'uint32';
      case lime.utils.ArrayBufferView.TypedArrayType.Float32: 'float32';
      case lime.utils.ArrayBufferView.TypedArrayType.Float64: 'float64';
      default: null;
    };
  }

  static function elementByteSize(kind:String):Int {
    return switch (kind) {
      case 'int8', 'uint8', 'uint8clamped': 1;
      case 'int16', 'uint16': 2;
      case 'int32', 'uint32', 'float32': 4;
      case 'float64': 8;
      default: throw 'Unsupported Lime typed-array kind: ' + kind;
    };
  }

  public function setValue(index:Int, value:Dynamic):Dynamic {
    return switch (kind) {
      case 'float32':
        final values:lime.utils.Float32Array = cast nativeView;
        values[index] = cast value;
      case 'int16':
        final values:lime.utils.Int16Array = cast nativeView;
        values[index] = (Std.int(value) << 16) >> 16;
      case 'uint16':
        final values:lime.utils.UInt16Array = cast nativeView;
        values[index] = Std.int(value) & 0xffff;
      case 'uint8':
        final values:lime.utils.UInt8Array = cast nativeView;
        values[index] = Std.int(value) & 0xff;
      case 'uint8clamped':
        final values:lime.utils.UInt8Array = cast nativeView;
        final rounded = Math.round(value);
        values[index] = rounded < 0 ? 0 : rounded > 255 ? 255 : Std.int(rounded);
      case 'int8':
        final values:lime.utils.Int8Array = cast nativeView;
        values[index] = (_Runtime.toInt32(value) << 24) >> 24;
      case 'int32':
        final values:lime.utils.Int32Array = cast nativeView;
        values[index] = _Runtime.toInt32(value);
      case 'uint32':
        final values:lime.utils.UInt32Array = cast nativeView;
        values[index] = _Runtime.toInt32(value);
      case 'float64':
        final values:lime.utils.Float64Array = cast nativeView;
        values[index] = (value : Float);
      default:
        throw 'Unsupported Lime typed-array kind: ' + kind;
    };
  }

  @:keep
  public function subarray(?begin:Int, ?end:Int):_LimeTypedArray {
    final start = begin == null ? 0 : begin;
    final stop = end == null ? length : end;
    final result = new _LimeTypedArray(kind, stop - start);
    for (index in start...stop) result.setValue(index - start, get(index));
    return result;
  }

  public function toArray():Array<Dynamic> {
    return [for (index in 0...length) get(index)];
  }

  public static inline function unwrap(value:Dynamic):Dynamic {
    return Std.isOfType(value, _LimeTypedArray) ? (cast value : _LimeTypedArray).nativeView : value;
  }

  /** Element read from a raw Lime `ArrayBufferView` (as produced by
   * `lime.utils.UInt8Array` and friends in host code), keyed on its
   * `TypedArrayType` so the element width and sign are honored. */
  public static function readRaw(view:lime.utils.ArrayBufferView, index:Int):Dynamic {
    return switch (view.type) {
      case lime.utils.ArrayBufferView.TypedArrayType.Int8: (cast view : lime.utils.Int8Array)[index];
      case lime.utils.ArrayBufferView.TypedArrayType.Int16: (cast view : lime.utils.Int16Array)[index];
      case lime.utils.ArrayBufferView.TypedArrayType.Int32: (cast view : lime.utils.Int32Array)[index];
      case lime.utils.ArrayBufferView.TypedArrayType.Uint8, lime.utils.ArrayBufferView.TypedArrayType.Uint8Clamped:
        (cast view : lime.utils.UInt8Array)[index];
      case lime.utils.ArrayBufferView.TypedArrayType.Uint16: (cast view : lime.utils.UInt16Array)[index];
      case lime.utils.ArrayBufferView.TypedArrayType.Uint32: (cast view : lime.utils.UInt32Array)[index];
      case lime.utils.ArrayBufferView.TypedArrayType.Float32: (cast view : lime.utils.Float32Array)[index];
      case lime.utils.ArrayBufferView.TypedArrayType.Float64: (cast view : lime.utils.Float64Array)[index];
      default: throw 'Unsupported Lime ArrayBufferView type: ' + view.type;
    };
  }

  /** Element write to a raw Lime `ArrayBufferView`; see `readRaw`. */
  public static function writeRaw(view:lime.utils.ArrayBufferView, index:Int, value:Dynamic):Dynamic {
    return switch (view.type) {
      case lime.utils.ArrayBufferView.TypedArrayType.Int8: (cast view : lime.utils.Int8Array)[index] = Std.int(value);
      case lime.utils.ArrayBufferView.TypedArrayType.Int16: (cast view : lime.utils.Int16Array)[index] = Std.int(value);
      case lime.utils.ArrayBufferView.TypedArrayType.Int32: (cast view : lime.utils.Int32Array)[index] = Std.int(value);
      case lime.utils.ArrayBufferView.TypedArrayType.Uint8, lime.utils.ArrayBufferView.TypedArrayType.Uint8Clamped:
        (cast view : lime.utils.UInt8Array)[index] = Std.int(value);
      case lime.utils.ArrayBufferView.TypedArrayType.Uint16: (cast view : lime.utils.UInt16Array)[index] = Std.int(value);
      case lime.utils.ArrayBufferView.TypedArrayType.Uint32: (cast view : lime.utils.UInt32Array)[index] = Std.int(value);
      case lime.utils.ArrayBufferView.TypedArrayType.Float32: (cast view : lime.utils.Float32Array)[index] = value;
      case lime.utils.ArrayBufferView.TypedArrayType.Float64: (cast view : lime.utils.Float64Array)[index] = value;
      default: throw 'Unsupported Lime ArrayBufferView type: ' + view.type;
    };
  }

  static function createView(kind:String, length:Int):Dynamic {
    return switch (kind) {
      case 'float32': new lime.utils.Float32Array(length);
      case 'int16': new lime.utils.Int16Array(length);
      case 'uint16': new lime.utils.UInt16Array(length);
      case 'uint8', 'uint8clamped': new lime.utils.UInt8Array(length);
      case 'int8': new lime.utils.Int8Array(length);
      case 'int32': new lime.utils.Int32Array(length);
      case 'uint32': new lime.utils.UInt32Array(length);
      case 'float64': new lime.utils.Float64Array(length);
      default: throw 'Unsupported Lime typed-array kind: ' + kind;
    };
  }

  static function createBufferView(kind:String, buffer:lime.utils.ArrayBuffer, byteOffset:Int, length:Null<Int>):Dynamic {
    return switch (kind) {
      case 'float32': new lime.utils.Float32Array(null, buffer, null, null, byteOffset, length);
      case 'int16': new lime.utils.Int16Array(null, buffer, null, null, byteOffset, length);
      case 'uint16': new lime.utils.UInt16Array(null, buffer, null, null, byteOffset, length);
      case 'uint8', 'uint8clamped': new lime.utils.UInt8Array(null, buffer, null, null, byteOffset, length);
      case 'int8': new lime.utils.Int8Array(null, buffer, null, null, byteOffset, length);
      case 'int32': new lime.utils.Int32Array(null, buffer, null, null, byteOffset, length);
      case 'uint32': new lime.utils.UInt32Array(null, buffer, null, null, byteOffset, length);
      case 'float64': new lime.utils.Float64Array(null, buffer, null, null, byteOffset, length);
      default: throw 'Unsupported Lime typed-array kind: ' + kind;
    };
  }

  static inline function arrayBufferView(value:Dynamic):lime.utils.ArrayBufferView {
    return cast value;
  }
}
#end
