package flighthq._internal.backend;

import flighthq._internal._Runtime;

/**
 * Stable target boundary for `GPUDevice` calls and fields.
 *
 * WebGPU is a browser API with no Haxe extern in this toolchain, so the typed
 * branch issues statically-named direct JS calls (the method name is a compile
 * time literal, so this is not reflection). WebGPU does not exist on native Lime,
 * so that branch fails loudly; the plain-JS bridge keeps reflection.
 *
 * Builder emits `WebGpuDeviceBackend.call(device, '<method>', args)` for the
 * returning `create*` methods and `WebGpuDeviceBackend.field(device, 'queue'|'limits')`.
 */
class WebGpuDeviceBackend {
  public static function call(device:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (device == null) return null;
    #if (js && html5)
    switch (name) {
      case 'createBindGroup': return js.Syntax.code('{0}.createBindGroup(...{1})', device, arguments);
      case 'createBindGroupLayout': return js.Syntax.code('{0}.createBindGroupLayout(...{1})', device, arguments);
      case 'createBuffer': return js.Syntax.code('{0}.createBuffer(...{1})', device, arguments);
      case 'createCommandEncoder': return js.Syntax.code('{0}.createCommandEncoder(...{1})', device, arguments);
      case 'createPipelineLayout': return js.Syntax.code('{0}.createPipelineLayout(...{1})', device, arguments);
      case 'createRenderPipeline': return js.Syntax.code('{0}.createRenderPipeline(...{1})', device, arguments);
      case 'createSampler': return js.Syntax.code('{0}.createSampler(...{1})', device, arguments);
      case 'createShaderModule': return js.Syntax.code('{0}.createShaderModule(...{1})', device, arguments);
      case 'createTexture': return js.Syntax.code('{0}.createTexture(...{1})', device, arguments);
      default:
        throw 'WebGpuDeviceBackend: unmapped device method ' + name;
    }
    #elseif lime
    throw 'WebGPU is not available on this target (no GPUDevice).';
    #else
    return Reflect.callMethod(device, Reflect.field(device, name), arguments);
    #end
  }

  public static function callOptional(device:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (device == null) return _Runtime.UNDEFINED;
    return call(device, name, arguments);
  }

  public static function field(device:Dynamic, name:String):Dynamic {
    if (device == null) return null;
    #if (js && html5)
    switch (name) {
      case 'queue': return js.Syntax.code('{0}.queue', device);
      case 'limits': return js.Syntax.code('{0}.limits', device);
      default:
        throw 'WebGpuDeviceBackend: unmapped device field ' + name;
    }
    #elseif lime
    throw 'WebGPU is not available on this target (no GPUDevice).';
    #else
    return Reflect.field(device, name);
    #end
  }

  public static function setField(device:Dynamic, name:String, value:Dynamic):Dynamic {
    Reflect.setField(device, name, value);
    return value;
  }

  public static function deleteField(device:Dynamic, name:String):Bool {
    return Reflect.deleteField(device, name);
  }
}
