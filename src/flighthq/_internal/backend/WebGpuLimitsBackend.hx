package flighthq._internal.backend;

import flighthq._internal._Runtime;

/**
 * Stable target boundary for `GPUSupportedLimits` field reads.
 *
 * The limits object flows from both `GPUDevice.limits` and `GPUAdapter.limits`,
 * so it gets its own backend rather than overloading `WebGpuDeviceBackend` with a
 * foreign receiver type. WebGPU has no Haxe extern here, so the typed branch reads
 * the field with a statically-named direct JS access (not reflection); native
 * fails loudly (WebGPU is browser-only); the bridge reflects.
 *
 * Builder emits `WebGpuLimitsBackend.field(limits, '<name>')`.
 */
class WebGpuLimitsBackend {
  public static function field(limits:Dynamic, name:String):Dynamic {
    if (limits == null) return null;
    #if (js && html5)
    switch (name) {
      case 'minUniformBufferOffsetAlignment': return js.Syntax.code('{0}.minUniformBufferOffsetAlignment', limits);
      case 'maxTextureDimension2D': return js.Syntax.code('{0}.maxTextureDimension2D', limits);
      case 'maxBindGroups': return js.Syntax.code('{0}.maxBindGroups', limits);
      default:
        throw 'WebGpuLimitsBackend: unmapped limit ' + name;
    }
    #elseif lime
    throw 'WebGPU is not available on this target (no GPUSupportedLimits).';
    #else
    return Reflect.field(limits, name);
    #end
  }

  public static function call(limits:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    #if lime
    throw 'WebGPU is not available on this target (no GPUSupportedLimits).';
    #else
    return Reflect.callMethod(limits, Reflect.field(limits, name), arguments);
    #end
  }

  public static function callOptional(limits:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (limits == null) return _Runtime.UNDEFINED;
    return call(limits, name, arguments);
  }

  public static function setField(limits:Dynamic, name:String, value:Dynamic):Dynamic {
    Reflect.setField(limits, name, value);
    return value;
  }

  public static function deleteField(limits:Dynamic, name:String):Bool {
    return Reflect.deleteField(limits, name);
  }
}
