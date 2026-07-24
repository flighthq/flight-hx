package flighthq._internal;

/**
 * Stable target boundary for generated WebGL2 context access.
 *
 * Generated code names the WebGL binding here instead of using the general
 * dynamic-object runtime. The implementation can replace reflection with typed
 * target calls incrementally without regenerating any translated Flight source.
 */
class WebGl2RenderingContext {
  public static inline function call(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    #if !js
    if (context == null) return null;
    #end
    return Reflect.callMethod(context, Reflect.field(context, name), arguments);
  }

  public static inline function callOptional(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (context == null) return _Runtime.UNDEFINED;
    final callable = Reflect.field(context, name);
    return callable == null ? _Runtime.UNDEFINED : Reflect.callMethod(context, callable, arguments);
  }

  public static inline function field(context:Dynamic, name:String):Dynamic {
    return context == null ? null : Reflect.field(context, name);
  }

  public static inline function setField(context:Dynamic, name:String, value:Dynamic):Dynamic {
    Reflect.setField(context, name, value);
    return value;
  }

  public static inline function deleteField(context:Dynamic, name:String):Bool {
    return Reflect.deleteField(context, name);
  }
}
