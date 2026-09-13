package flight._internal;

/** Opaque property keys used for TypeScript `symbol` values. */
class _Symbol {
  #if !js
  static final shared:Map<String, Dynamic> = [];
  #end

  public static function create(?description:String):Dynamic {
    #if js
    return new js.lib.Symbol(description);
    #else
    return {description: description};
    #end
  }

  public static function for_(key:String):Dynamic {
    #if js
    return js.lib.Symbol.for_(key);
    #else
    if (!shared.exists(key)) shared.set(key, {key: key});
    return shared.get(key);
    #end
  }
}
