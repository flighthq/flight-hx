// Maintained runtime support for generated Flight Haxe.
package flight._internal;

/** Portable UTF-8 TextEncoder subset. */
@:keep
class _TextEncoder {
  public var encoding(default, never):String = 'utf-8';

  public function new() {}

  public function encode(?source:String):_UInt8Array {
    return new _UInt8Array(haxe.io.Bytes.ofString(source == null ? '' : source));
  }
}
