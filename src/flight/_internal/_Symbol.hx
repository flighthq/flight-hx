package flight._internal;

/** Opaque property keys used for TypeScript `symbol` values. */
abstract _Symbol(Dynamic) from Dynamic to Dynamic {
  public static var iterator(get, never):Dynamic;

  #if !js
  static final shared:Map<String, Dynamic> = [];
  #end

  public inline function new(?description:String) {
    #if js
    this = new js.lib.Symbol(description);
    #else
    this = {description: description};
    #end
  }

  public static inline function create(?description:String):Dynamic {
    return new _Symbol(description);
  }

  public static function forKey(key:String):Dynamic {
    #if js
    return js.lib.Symbol.for_(key);
    #else
    if (!shared.exists(key)) shared.set(key, {key: key});
    return shared.get(key);
    #end
  }

  public static inline function for_(key:String):Dynamic {
    return forKey(key);
  }

  static inline function get_iterator():Dynamic {
    #if js return js.lib.Symbol.iterator; #else return forKey('Symbol.iterator'); #end
  }
}
