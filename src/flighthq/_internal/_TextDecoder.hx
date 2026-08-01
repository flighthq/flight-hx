// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

/** Portable subset of TextDecoder used by document importers. */
class _TextDecoder {
  public function new(?_label:Dynamic, ?_options:Dynamic) {}

  public function decode(source:Dynamic):String {
    final values = _Runtime.iterable(source);
    final bytes = haxe.io.Bytes.alloc(values.length);
    for (index in 0...values.length) bytes.set(index, Std.int(values[index]) & 0xff);
    return bytes.toString();
  }
}
