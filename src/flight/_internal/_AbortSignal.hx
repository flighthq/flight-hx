// Maintained runtime support for generated Flight Haxe.
package flight._internal;

/** Portable AbortSignal with the event subset used by Flight loaders. */
@:keep
class _AbortSignal {
  public var aborted(default, null):Bool = false;
  public var reason(default, null):Dynamic = null;

  final listeners:Array<{listener:Dynamic, once:Bool}> = [];

  public function new() {}

  public function addEventListener(type:String, listener:Dynamic, ?options:Dynamic):Void {
    if (type != 'abort' || listener == null) return;
    final once = options != null && _Runtime.truthy(_Runtime.field(options, 'once'));
    listeners.push({listener: listener, once: once});
  }

  public function removeEventListener(type:String, listener:Dynamic, ?_options:Dynamic):Void {
    if (type != 'abort' || listener == null) return;
    var index = listeners.length;
    while (index > 0) {
      index--;
      if (sameListener(listeners[index].listener, listener)) listeners.splice(index, 1);
    }
  }

  public function throwIfAborted():Void {
    if (!aborted) return;
    throw reason == null ? new _DOMException('This operation was aborted', 'AbortError') : reason;
  }

  public function abort(reason:Dynamic):Void {
    if (aborted) return;
    aborted = true;
    this.reason = reason == null ? new _DOMException('This operation was aborted', 'AbortError') : reason;
    final pending = listeners.copy();
    for (entry in pending) {
      if (entry.once) removeEventListener('abort', entry.listener);
      // Flight's abort listeners do not consume the Event payload. Calling
      // without it also preserves JavaScript's acceptance of zero-arity
      // listeners on native Haxe targets whose reflection rejects over-apply.
      dispatchListener(entry.listener);
    }
  }

  public static function any(signals:Array<flight._internal.dom.AbortSignal>):flight._internal.dom.AbortSignal {
    final controller = new _AbortController();
    for (candidate in signals) {
      final signal:_AbortSignal = cast candidate;
      if (signal.aborted) {
        controller.abort(signal.reason);
        break;
      }
      signal.addEventListener('abort', function():Void controller.abort(signal.reason), {once: true});
    }
    return cast controller.signal;
  }

  static function sameListener(left:Dynamic, right:Dynamic):Bool {
    return left == right || (Reflect.isFunction(left) && Reflect.isFunction(right) && Reflect.compareMethods(left, right));
  }

  function dispatchListener(listener:Dynamic):Void {
    #if python
    // Python alone rejects an under-applied required argument. Generated
    // Flight handlers never consume the abort Event, so supply a null padding
    // value only when the emitted Python callable declares a parameter.
    var code = Reflect.field(listener, '__code__');
    var bound = false;
    if (code == null) {
      code = Reflect.field(Reflect.field(listener, '__func__'), '__code__');
      bound = code != null;
    }
    if (code != null) {
      var arity = Std.int(Reflect.field(code, 'co_argcount'));
      if (bound && arity > 0) arity--;
      _Runtime.callValue(listener, arity > 0 ? [null] : []);
      return;
    }
    #end
    _Runtime.callValue(listener, []);
  }
}
