// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
#end

class _Async {
  public static macro function make(expression:Expr):Expr {
    if (!Context.defined('js')) return expression;
    return macro jsasync.JSAsync.jsasync($expression);
  }

  public static macro function awaitValue(expression:Expr):Expr {
    if (!Context.defined('js')) return expression;
    return macro jsasync.JSAsyncTools.jsawait(cast $expression);
  }

  public static function create<T>(executor:(T->Void, Dynamic->Void)->Void):_Promise<T> {
    #if js
    return new js.lib.Promise<T>(executor);
    #else
    return new _Promise<T>(executor);
    #end
  }

  public static function flatMap<T, Next>(value:Dynamic, continuation:T->Dynamic):_Promise<Next> {
    #if js
    return cast js.lib.Promise.resolve(value).then(function(result) return continuation(cast result));
    #else
    return cast _Promise.resolve(cast value).then(function(result) return continuation(cast result));
    #end
  }

  public static function protect<T>(action:Void->Dynamic):_Promise<T> {
    try {
      return resolve(action());
    } catch (error:Dynamic) {
      return reject(error);
    }
  }

  public static function recover<T>(value:Dynamic, rejection:Dynamic->Dynamic):_Promise<T> {
    #if js
    return cast js.lib.Promise.resolve(value).catchError(function(error) return rejection(error));
    #else
    return cast _Promise.resolve(cast value).catchError(function(error) return rejection(error));
    #end
  }

  public static function reject<T>(error:Dynamic):_Promise<T> {
    #if js
    return js.lib.Promise.reject(error);
    #else
    return _Promise.reject(error);
    #end
  }

  public static function resolve<T>(value:Dynamic):_Promise<T> {
    #if js
    return cast js.lib.Promise.resolve(value);
    #else
    return cast _Promise.resolve(cast value);
    #end
  }
}
