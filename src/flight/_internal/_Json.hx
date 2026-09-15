package flight._internal;

/** ECMAScript JSON namespace. */
class _Json {
  public static inline function parse(value:String, ?reviver:Dynamic):Dynamic {
    #if js return js.Syntax.code("JSON.parse({0}, {1})", value, reviver); #else return haxe.Json.parse(value); #end
  }

  public static inline function stringify(value:Dynamic, ?replacer:Dynamic, ?space:Dynamic):String {
    #if js return js.Syntax.code("JSON.stringify({0}, {1}, {2})", value, replacer, space); #else return haxe.Json.stringify(value); #end
  }
}
