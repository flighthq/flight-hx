// Maintained runtime support for generated Flight Haxe.
package flight._internal;

/** Portable AbortController paired with `_AbortSignal`. */
@:keep
class _AbortController {
  public final signal:flight._internal.dom.AbortSignal;

  final nativeSignal:_AbortSignal;

  public function new() {
    nativeSignal = new _AbortSignal();
    signal = cast nativeSignal;
  }

  public function abort(?reason:Dynamic):Void nativeSignal.abort(reason);
}
