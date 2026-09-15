package flight._internal;

#if js
@:forward
abstract _Promise<T>(js.lib.Promise<T>) from js.lib.Promise<T> to js.lib.Promise<T> {
  public inline function new(executor:Dynamic) {
    this = new js.lib.Promise(executor);
  }

  public static inline function resolve<T>(value:Dynamic):_Promise<T> {
    return cast js.lib.Promise.resolve(value);
  }

  public static inline function reject<T>(reason:Dynamic):_Promise<T> {
    return cast js.lib.Promise.reject(reason);
  }

  public static inline function all<T>(values:Array<Dynamic>):_Promise<Array<T>> {
    return cast js.lib.Promise.all(values);
  }

  public static inline function allSettled<T>(values:Array<Dynamic>):_Promise<Array<Dynamic>> {
    return cast js.Syntax.code("Promise.allSettled({0})", values);
  }

  public static inline function race<T>(values:Array<Dynamic>):_Promise<T> {
    return cast js.lib.Promise.race(values);
  }

  public static inline function finallyTask<T>(task:_Promise<T>, onFinally:Dynamic):_Promise<T> {
    return cast (cast task : js.lib.Promise<T>).finally(onFinally);
  }
}
#else
/**
  Small Promises/A+-style carrier for host-free targets. Delivery is immediate because Haxe has no
  portable microtask queue; settlement, chaining, rejection propagation, and thenable adoption are
  otherwise preserved.
**/
class _Promise<T> {
  var state:_PromiseState = Pending;
  var result:Dynamic;
  final fulfilled:Array<Dynamic->Void> = [];
  final rejected:Array<Dynamic->Void> = [];

  public function new(executor:Dynamic) {
    try {
      Reflect.callMethod(null, executor, [settleFulfilled, settleRejected]);
    } catch (error:Dynamic) {
      settleRejected(error);
    }
  }

  public function then(?onFulfilled:Dynamic, ?onRejected:Dynamic):_Promise<Dynamic> {
    var child:_Promise<Dynamic> = null;
    child = new _Promise(function(resolve:Dynamic->Void, reject:Dynamic->Void) {});
    subscribe(
      (value) -> forward(child, onFulfilled, value, false),
      (reason) -> forward(child, onRejected, reason, true),
    );
    return child;
  }

  public function catchError(onRejected:Dynamic):_Promise<Dynamic> {
    return then(null, onRejected);
  }

  public function finally(onFinally:Dynamic):_Promise<T> {
    final child:_Promise<T> = pending();
    subscribe(
      (value) -> runCleanup(child, onFinally, value, false),
      (reason) -> runCleanup(child, onFinally, reason, true),
    );
    return child;
  }

  public static function resolve<T>(value:T):_Promise<T> {
    if (Std.isOfType(value, _Promise)) return cast value;
    final promise = pending();
    promise.settleFulfilled(value);
    return promise;
  }

  public static function reject<T>(reason:Dynamic):_Promise<T> {
    final promise = pending();
    promise.settleRejected(reason);
    return promise;
  }

  public static function all<T>(values:Array<Dynamic>):_Promise<Array<T>> {
    final promise:_Promise<Array<T>> = pending();
    if (values.length == 0) {
      promise.settleFulfilled([]);
      return promise;
    }
    final results:Array<T> = [];
    results.resize(values.length);
    var remaining = values.length;
    for (index in 0...values.length) {
      _Promise.resolve(values[index]).subscribe(
        (value) -> {
          results[index] = cast value;
          remaining -= 1;
          if (remaining == 0) promise.settleFulfilled(results);
        },
        promise.settleRejected,
      );
    }
    return promise;
  }

  public static function allSettled<T>(values:Array<Dynamic>):_Promise<Array<Dynamic>> {
    final promise:_Promise<Array<Dynamic>> = pending();
    if (values.length == 0) {
      promise.settleFulfilled([]);
      return promise;
    }
    final results:Array<Dynamic> = [];
    results.resize(values.length);
    var remaining = values.length;
    final complete = (index:Int, result:Dynamic) -> {
      results[index] = result;
      remaining -= 1;
      if (remaining == 0) promise.settleFulfilled(results);
    };
    for (index in 0...values.length) {
      _Promise.resolve(values[index]).subscribe(
        (value) -> complete(index, {status: 'fulfilled', value: value}),
        (reason) -> complete(index, {status: 'rejected', reason: reason}),
      );
    }
    return promise;
  }

  public static function race<T>(values:Array<Dynamic>):_Promise<T> {
    final promise:_Promise<T> = pending();
    for (value in values) {
      _Promise.resolve(value).subscribe(promise.settleFulfilled, promise.settleRejected);
    }
    return promise;
  }

  public static function finallyTask<T>(task:_Promise<T>, onFinally:Dynamic):_Promise<T> {
    return task.finally(onFinally);
  }

  static function pending<T>():_Promise<T> {
    return new _Promise(function(resolve:Dynamic->Void, reject:Dynamic->Void) {});
  }

  function forward(child:_Promise<Dynamic>, callback:Dynamic, value:Dynamic, rejection:Bool):Void {
    if (callback == null) {
      if (rejection) child.settleRejected(value);
      else child.settleFulfilled(value);
      return;
    }
    try {
      child.settleFulfilled(Reflect.callMethod(null, callback, [value]));
    } catch (error:Dynamic) {
      child.settleRejected(error);
    }
  }

  function runCleanup(child:_Promise<T>, callback:Dynamic, value:Dynamic, rejection:Bool):Void {
    try {
      final cleanup = Reflect.callMethod(null, callback, []);
      _Promise.resolve(cleanup).subscribe(
        (_) -> {
          if (rejection) child.settleRejected(value);
          else child.settleFulfilled(value);
        },
        child.settleRejected,
      );
    } catch (error:Dynamic) {
      child.settleRejected(error);
    }
  }

  function settleFulfilled(value:Dynamic):Void {
    if (state != Pending) return;
    if (value == this) {
      settleRejected('A promise cannot resolve to itself');
      return;
    }
    if (Std.isOfType(value, _Promise)) {
      final promise:_Promise<Dynamic> = cast value;
      promise.subscribe(settleFulfilled, settleRejected);
      return;
    }
    final then = value == null ? null : Reflect.field(value, 'then');
    if (Reflect.isFunction(then)) {
      try {
        Reflect.callMethod(value, then, [settleFulfilled, settleRejected]);
      } catch (error:Dynamic) {
        settleRejected(error);
      }
      return;
    }
    state = Fulfilled;
    result = value;
    flush(fulfilled);
  }

  function settleRejected(reason:Dynamic):Void {
    if (state != Pending) return;
    state = Rejected;
    result = reason;
    flush(rejected);
  }

  function subscribe(onFulfilled:Dynamic->Void, onRejected:Dynamic->Void):Void {
    switch state {
      case Pending:
        fulfilled.push(onFulfilled);
        rejected.push(onRejected);
      case Fulfilled:
        onFulfilled(result);
      case Rejected:
        onRejected(result);
    }
  }

  function flush(callbacks:Array<Dynamic->Void>):Void {
    final pendingCallbacks = callbacks.copy();
    fulfilled.resize(0);
    rejected.resize(0);
    for (callback in pendingCallbacks) callback(result);
  }
}

private enum _PromiseState {
  Pending;
  Fulfilled;
  Rejected;
}
#end
