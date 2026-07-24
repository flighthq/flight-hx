// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

#if js
typedef _Promise<T> = js.lib.Promise<T>;
#else
class _Promise<T> {
  static inline final PENDING = 0;
  static inline final FULFILLED = 1;
  static inline final REJECTED = 2;

  var handlers:Array<Void->Void> = [];
  var state = PENDING;
  var value:Dynamic;

  public function new(executor:(T->Void, Dynamic->Void)->Void) {
    try {
      executor(resolveInternal, rejectInternal);
    } catch (error:Dynamic) {
      rejectInternal(error);
    }
  }

  public function then<Next>(resolve:T->Next, ?reject:Dynamic->Next):_Promise<Next> {
    return new _Promise<Next>(function(nextResolve, nextReject) {
      handle(function() {
        try {
          if (state == FULFILLED) {
            adopt(resolve(cast value), nextResolve, nextReject);
          } else if (reject != null) {
            adopt(reject(value), nextResolve, nextReject);
          } else {
            nextReject(value);
          }
        } catch (error:Dynamic) {
          nextReject(error);
        }
      });
    });
  }

  public function catchError<Next>(reject:Dynamic->Next):_Promise<Next> {
    return then(function(value) return cast value, reject);
  }

  public static function all<T>(values:Array<_Promise<T>>):_Promise<Array<T>> {
    return new _Promise<Array<T>>(function(resolve, reject) {
      if (values.length == 0) {
        resolve([]);
        return;
      }
      final output:Array<T> = [];
      output.resize(values.length);
      var remaining = values.length;
      for (index in 0...values.length) {
        values[index].then(function(value) {
          output[index] = value;
          remaining--;
          if (remaining == 0) resolve(output);
          return value;
        }, function(error) {
          reject(error);
          return cast null;
        });
      }
    });
  }

  public static function allSettled<T>(values:Array<_Promise<T>>):_Promise<Array<Dynamic>> {
    return new _Promise<Array<Dynamic>>(function(resolve, _) {
      if (values.length == 0) {
        resolve([]);
        return;
      }
      final output:Array<Dynamic> = [];
      output.resize(values.length);
      var remaining = values.length;
      for (index in 0...values.length) {
        values[index].then(function(value) {
          output[index] = {status: 'fulfilled', value: value};
          remaining--;
          if (remaining == 0) resolve(output);
          return value;
        }, function(reason) {
          output[index] = {status: 'rejected', reason: reason};
          remaining--;
          if (remaining == 0) resolve(output);
          return cast null;
        });
      }
    });
  }

  public static function race<T>(values:Array<_Promise<T>>):_Promise<T> {
    return new _Promise<T>(function(resolve, reject) {
      for (value in values) value.then(function(result) {
        resolve(result);
        return result;
      }, function(error) {
        reject(error);
        return cast null;
      });
    });
  }

  public static function reject<T>(error:Dynamic):_Promise<T> {
    return new _Promise<T>(function(_, reject) reject(error));
  }

  public static function resolve<T>(value:T):_Promise<T> {
    if (Std.isOfType(value, _Promise)) return cast value;
    return new _Promise<T>(function(resolve, _) resolve(value));
  }

  static function adopt<Next>(result:Dynamic, resolve:Next->Void, reject:Dynamic->Void):Void {
    if (Std.isOfType(result, _Promise)) {
      final promise:_Promise<Dynamic> = cast result;
      promise.then(function(value) {
        resolve(cast value);
        return value;
      }, function(error) {
        reject(error);
        return cast null;
      });
    } else {
      resolve(cast result);
    }
  }

  function handle(handler:Void->Void):Void {
    if (state == PENDING) {
      handlers.push(handler);
    } else {
      handler();
    }
  }

  function rejectInternal(error:Dynamic):Void {
    settle(REJECTED, error);
  }

  function resolveInternal(result:T):Void {
    if (Std.isOfType(result, _Promise)) {
      final promise:_Promise<Dynamic> = cast result;
      if (promise == this) {
        rejectInternal(new haxe.Exception('A promise cannot resolve to itself.'));
        return;
      }
      promise.then(function(value) {
        settle(FULFILLED, value);
        return value;
      }, function(error) {
        rejectInternal(error);
        return cast null;
      });
      return;
    }
    settle(FULFILLED, result);
  }

  function settle(nextState:Int, result:Dynamic):Void {
    if (state != PENDING) return;
    state = nextState;
    value = result;
    final pending = handlers;
    handlers = [];
    for (handler in pending) handler();
  }
}
#end
