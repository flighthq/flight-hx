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
}
