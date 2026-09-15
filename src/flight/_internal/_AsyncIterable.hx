package flight._internal;

/** Serial async-iteration operation required by flight-haxe-runtime-abi/2. */
abstract _AsyncIterable<T>(Dynamic) from Dynamic to Dynamic {
  public static function forEachAsync<T>(values:_AsyncIterable<T>, callback:T->_Promise<Dynamic>):_Promise<Dynamic> {
    #if js
    return cast js.Syntax.code(
      "(async function(iterable, visit) { for await (const value of iterable) await visit(value); })({0}, {1})",
      values,
      callback,
    );
    #else
    throw "AsyncIterable-backed transpiled modules require a target runtime implementation.";
    #end
  }
}
