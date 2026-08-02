// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

class _Async {
  public static function all<T>(values:Dynamic):_Promise<Array<T>> {
    final promises:Array<_Promise<T>> = cast _Runtime.iterable(values);
    #if js
    return cast js.lib.Promise.all(cast promises);
    #else
    return _Promise.all(promises);
    #end
  }

  public static function allSettled<T>(values:Dynamic):_Promise<Array<Dynamic>> {
    final promises:Array<_Promise<T>> = cast _Runtime.iterable(values);
    #if js
    return cast js.Syntax.code('Promise.allSettled({0})', promises);
    #else
    return _Promise.allSettled(promises);
    #end
  }

  public static function create<T>(executor:Dynamic):_Promise<T> {
    #if js
    return new js.lib.Promise<T>(cast executor);
    #else
    return new _Promise<T>(cast executor);
    #end
  }

  public static function flatMap<T, Next>(value:Dynamic, continuation:T->Dynamic):_Promise<Next> {
    #if js
    return cast js.lib.Promise.resolve(value).then(function(result) return continuation(cast result));
    #else
    return cast _Promise.resolve(cast value).then(function(result) return continuation(cast result));
    #end
  }

  public static function isPromise(value:Dynamic):Bool {
    #if js
    return js.Syntax.code('{0} instanceof Promise', value);
    #else
    return Std.isOfType(value, _Promise);
    #end
  }

  public static function continueFlow(value:Dynamic, continuation:Void->Dynamic):Dynamic {
    return mapImmediate(value, function(outcome:Dynamic) {
      return outcome == null ? continuation() : outcome;
    });
  }

  public static function continueIteration(value:Dynamic, continuation:Void->Dynamic):Dynamic {
    return mapImmediate(value, function(outcome:Dynamic) {
      final kind = outcome == null ? null : Reflect.field(outcome, 'kind');
      return outcome == null || kind == 'continue' ? continuation() : outcome;
    });
  }

  public static function finishFlow<T>(value:Dynamic):_Promise<T> {
    return cast resolve(mapImmediate(value, function(outcome:Dynamic) {
      return outcome == null ? null : Reflect.field(outcome, 'value');
    }));
  }

  public static function finalizeFlow(value:Dynamic, cleanup:Void->Dynamic):Dynamic {
    final settled:Dynamic = isPromise(value)
      ? recover(flatMap(value, function(outcome:Dynamic) {
          return {fulfilled: true, outcome: outcome};
        }), function(error) {
          return {error: error, fulfilled: false};
        })
      : {fulfilled: true, outcome: value};
    return mapImmediate(settled, function(result:Dynamic) {
      return mapImmediate(protect(cleanup), function(cleanupOutcome:Dynamic) {
        if (cleanupOutcome != null) return cleanupOutcome;
        return Reflect.field(result, 'fulfilled')
          ? Reflect.field(result, 'outcome')
          : reject(Reflect.field(result, 'error'));
      });
    });
  }

  public static function flowBreak():Dynamic {
    return {kind: 'break'};
  }

  public static function flowContinue():Dynamic {
    return {kind: 'continue'};
  }

  public static function flowNormal():Dynamic {
    return null;
  }

  public static function flowReturn(value:Dynamic):Dynamic {
    return {kind: 'return', value: value};
  }

  public static function protect<T>(action:Void->Dynamic):Dynamic {
    try {
      return action();
    } catch (error:Dynamic) {
      return reject(error);
    }
  }

  public static function recover<T>(value:Dynamic, rejection:Dynamic):Dynamic {
    if (!isPromise(value)) return value;
    #if js
    return cast js.lib.Promise.resolve(value).catchError(function(error) return rejection(error));
    #else
    return cast _Promise.resolve(cast value).catchError(function(error) return rejection(error));
    #end
  }

  public static function race<T>(values:Dynamic):_Promise<T> {
    final promises:Array<_Promise<T>> = cast _Runtime.iterable(values);
    #if js
    return cast js.lib.Promise.race(cast promises);
    #else
    return _Promise.race(promises);
    #end
  }

  public static function repeatFlow(iteration:Void->Dynamic):Dynamic {
    #if js
    while (true) {
      final outcome = protect(iteration);
      if (isPromise(outcome)) {
        return flatMap(outcome, function(result:Dynamic) return continueRepeatFlow(result, iteration));
      }
      final kind = outcome == null ? null : Reflect.field(outcome, 'kind');
      if (outcome == null || kind == 'continue') continue;
      return kind == 'break' ? flowNormal() : outcome;
    }
    #else
    return create(function(resolve, reject) {
      var advancing = false;
      var queued = false;
      var advance:Void->Void = null;
      final handleOutcome = function(outcome:Dynamic) {
        final kind = outcome == null ? null : Reflect.field(outcome, 'kind');
        if (outcome == null || kind == 'continue') {
          if (advancing) queued = true; else advance();
        } else if (kind == 'break') {
          resolve(null);
        } else {
          resolve(outcome);
        }
      };
      advance = function() {
        if (advancing) {
          queued = true;
          return;
        }
        advancing = true;
        do {
          queued = false;
          final outcome = protect(iteration);
          if (isPromise(outcome)) {
            final promise:_Promise<Dynamic> = cast outcome;
            promise.then(function(result) {
              handleOutcome(result);
              return result;
            }, function(error) {
              reject(error);
              return cast null;
            });
          } else {
            handleOutcome(outcome);
          }
        } while (queued);
        advancing = false;
      };
      advance();
    });
    #end
  }

  static function continueRepeatFlow(outcome:Dynamic, iteration:Void->Dynamic):Dynamic {
    final kind = outcome == null ? null : Reflect.field(outcome, 'kind');
    if (outcome == null || kind == 'continue') return repeatFlow(iteration);
    return kind == 'break' ? flowNormal() : outcome;
  }

  static function mapImmediate(value:Dynamic, continuation:Dynamic->Dynamic):Dynamic {
    return isPromise(value) ? flatMap(value, continuation) : continuation(value);
  }

  public static function reject<T>(error:Dynamic):_Promise<T> {
    #if js
    return js.lib.Promise.reject(error);
    #else
    return _Promise.reject(error);
    #end
  }

  public static function resolve<T>(value:Dynamic = null):_Promise<T> {
    #if js
    return cast js.lib.Promise.resolve(value);
    #else
    return cast _Promise.resolve(cast value);
    #end
  }
}
