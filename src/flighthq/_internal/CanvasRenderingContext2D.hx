package flighthq._internal;

import flighthq._internal.backend.Canvas2dBackend;

/**
 * Temporary compatibility shim. Generated code still names this type for Canvas 2D
 * access; the implementation now lives in `flighthq._internal.backend.Canvas2dBackend`.
 *
 * Builder: once the generator emits `flighthq._internal.backend.Canvas2dBackend`
 * directly, delete this file. The forwarders are `inline`, so they cost nothing.
 */
class CanvasRenderingContext2D {
  public static inline function call(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    return Canvas2dBackend.call(context, name, arguments);
  }

  public static inline function callOptional(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    return Canvas2dBackend.callOptional(context, name, arguments);
  }

  public static inline function field(context:Dynamic, name:String):Dynamic {
    return Canvas2dBackend.field(context, name);
  }

  public static inline function setField(context:Dynamic, name:String, value:Dynamic):Dynamic {
    return Canvas2dBackend.setField(context, name, value);
  }

  public static inline function deleteField(context:Dynamic, name:String):Bool {
    return Canvas2dBackend.deleteField(context, name);
  }
}
