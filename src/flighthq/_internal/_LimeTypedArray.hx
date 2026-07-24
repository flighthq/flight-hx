// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

#if lime
/**
 * Keeps JavaScript-shaped typed-array behavior while owning storage that Lime
 * can pass to native graphics APIs as an `ArrayBufferView`.
 */
class _LimeTypedArray {
  public final nativeView:Dynamic;
  public var length(default, null):Int;

  final kind:String;

  public function new(kind:String, source:Dynamic = 0) {
    this.kind = kind;
    final sourceArray = Std.isOfType(source, _LimeTypedArray) ? (cast source : _LimeTypedArray) : null;
    length = Std.isOfType(source, Int) || Std.isOfType(source, Float)
      ? Std.int(source)
      : sourceArray == null
        ? _Runtime.iterable(source).length
        : sourceArray.length;
    nativeView = createView(kind, length);
    if (sourceArray != null) {
      for (index in 0...length) setValue(index, sourceArray.get(index));
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
      default:
        throw 'Unsupported Lime typed-array kind: ' + kind;
    };
  }

  public function set(source:Dynamic, offset:Float = 0):Void {
    final start = Std.int(offset);
    final sourceArray = Std.isOfType(source, _LimeTypedArray) ? (cast source : _LimeTypedArray) : null;
    if (sourceArray != null) {
      for (index in 0...sourceArray.length) setValue(start + index, sourceArray.get(index));
      return;
    }
    final values = _Runtime.iterable(source);
    for (index in 0...values.length) setValue(start + index, values[index]);
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
      default:
        throw 'Unsupported Lime typed-array kind: ' + kind;
    };
  }

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

  static function createView(kind:String, length:Int):Dynamic {
    return switch (kind) {
      case 'float32': new lime.utils.Float32Array(length);
      case 'int16': new lime.utils.Int16Array(length);
      case 'uint16': new lime.utils.UInt16Array(length);
      default: throw 'Unsupported Lime typed-array kind: ' + kind;
    };
  }
}
#end
