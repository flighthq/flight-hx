package flighthq._internal.backend;

import flighthq._internal._Runtime;

/**
 * Stable target boundary for `GPUCanvasContext` calls.
 *
 * WebGPU is a browser API with no Haxe extern here, so the typed branch issues
 * statically-named direct JS calls; native fails loudly; the bridge reflects.
 *
 * Builder emits `WebGpuCanvasContextBackend.call(context, 'configure'|'getCurrentTexture', args)`.
 */
class WebGpuCanvasContextBackend {
  public static function call(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (context == null) return null;
    #if (js && html5)
    switch (name) {
      case 'configure':
        js.Syntax.code('{0}.configure(...{1})', context, arguments);
        return null;
      case 'getCurrentTexture':
        return js.Syntax.code('{0}.getCurrentTexture()', context);
      default:
        throw 'WebGpuCanvasContextBackend: unmapped context method ' + name;
    }
    #elseif lime
    throw 'WebGPU is not available on this target (no GPUCanvasContext).';
    #else
    return Reflect.callMethod(context, Reflect.field(context, name), arguments);
    #end
  }

  public static function callOptional(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (context == null) return _Runtime.UNDEFINED;
    return call(context, name, arguments);
  }

  public static function field(context:Dynamic, name:String):Dynamic {
    return context == null ? null : Reflect.field(context, name);
  }

  public static function setField(context:Dynamic, name:String, value:Dynamic):Dynamic {
    Reflect.setField(context, name, value);
    return value;
  }

  public static function deleteField(context:Dynamic, name:String):Bool {
    return Reflect.deleteField(context, name);
  }
}
