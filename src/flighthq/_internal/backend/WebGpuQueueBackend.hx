package flighthq._internal.backend;

import flighthq._internal._Runtime;

/**
 * Stable target boundary for `GPUQueue` calls (all void).
 *
 * WebGPU is a browser API with no Haxe extern here, so the typed branch issues
 * statically-named direct JS calls; native fails loudly; the bridge reflects.
 *
 * Builder emits `WebGpuQueueBackend.call(queue, '<method>', args)`.
 */
class WebGpuQueueBackend {
  public static function call(queue:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (queue == null) return null;
    #if (js && html5)
    switch (name) {
      case 'copyExternalImageToTexture': js.Syntax.code('{0}.copyExternalImageToTexture(...{1})', queue, arguments);
      case 'submit': js.Syntax.code('{0}.submit(...{1})', queue, arguments);
      case 'writeBuffer': js.Syntax.code('{0}.writeBuffer(...{1})', queue, arguments);
      case 'writeTexture': js.Syntax.code('{0}.writeTexture(...{1})', queue, arguments);
      default:
        throw 'WebGpuQueueBackend: unmapped queue method ' + name;
    }
    return null;
    #elseif lime
    throw 'WebGPU is not available on this target (no GPUQueue).';
    #else
    return Reflect.callMethod(queue, Reflect.field(queue, name), arguments);
    #end
  }

  public static function callOptional(queue:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (queue == null) return _Runtime.UNDEFINED;
    return call(queue, name, arguments);
  }

  public static function field(queue:Dynamic, name:String):Dynamic {
    return queue == null ? null : Reflect.field(queue, name);
  }

  public static function setField(queue:Dynamic, name:String, value:Dynamic):Dynamic {
    Reflect.setField(queue, name, value);
    return value;
  }

  public static function deleteField(queue:Dynamic, name:String):Bool {
    return Reflect.deleteField(queue, name);
  }
}
