package flighthq._internal;

/**
 * Portable binding for the ECMAScript Object operations used by generated code.
 *
 * Keeping these named operations here prevents generated modules from depending
 * on either Haxe Reflect or a JavaScript-only global Object value.
 */
class DynamicObject {
  public static function assign(target:Dynamic, sources:haxe.Rest<Dynamic>):Dynamic {
    for (source in sources) {
      if (source == null) continue;
      for (name in Reflect.fields(source)) Reflect.setField(target, name, Reflect.field(source, name));
    }
    return target;
  }

  public static inline function entries(source:Dynamic):Array<Array<Dynamic>> {
    return [for (name in Reflect.fields(source)) [name, Reflect.field(source, name)]];
  }

  public static inline function keys(source:Dynamic):Array<String> {
    return Reflect.fields(source);
  }

  public static inline function values(source:Dynamic):Array<Dynamic> {
    return [for (name in Reflect.fields(source)) Reflect.field(source, name)];
  }

  public static inline function freeze(source:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('Object.freeze({0})', source);
    #else
    return source;
    #end
  }

  public static function defineProperty(target:Dynamic, name:String, descriptor:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('Object.defineProperty({0}, {1}, {2})', target, name, descriptor);
    #else
    if (descriptor != null && Reflect.hasField(descriptor, 'value')) {
      Reflect.setField(target, name, Reflect.field(descriptor, 'value'));
    }
    return target;
    #end
  }

  public static inline function field(name:String):Dynamic {
    #if js
    return js.Syntax.code('Object[{0}]', name);
    #else
    return null;
    #end
  }
}
