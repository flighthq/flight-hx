package flighthq._internal.backend;

import flighthq._internal._Runtime;

/**
 * Stable target boundary for generated Canvas 2D context access.
 *
 * Mirrors `WebGl2Backend`: generated code names this binding for every Canvas2D
 * call so the implementation can be typed per target without regenerating.
 *
 * - `(js && html5)`: the context is the real browser `CanvasRenderingContext2D`,
 *   so dispatch to the typed `js.html` extern (and the canvas element for the one
 *   `getContext` acquisition that flows through this binding). No reflection.
 * - `lime` (native, no DOM): dispatch to the cairo-backed
 *   `NativeCanvas2dContext`, Lime's bundled rasterizer, so canvas-rasterized
 *   content (strokes, gradients, text) works without a browser.
 * - otherwise (e.g. the plain-JS Vitest bridge, which has no `html5` define): the
 *   context is still a real browser object, so keep reflection.
 */
#if (js && html5)
class Canvas2dBackend {
  public static function call(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (context == null) return null;
    final ctx:js.html.CanvasRenderingContext2D = context;
    switch (name) {
      case 'arc': ctx.arc(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5]); return null;
      case 'beginPath': ctx.beginPath(); return null;
      case 'bezierCurveTo':
        ctx.bezierCurveTo(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5]);
        return null;
      case 'clearRect': ctx.clearRect(arguments[0], arguments[1], arguments[2], arguments[3]); return null;
      case 'clip': ctx.clip(); return null;
      case 'closePath': ctx.closePath(); return null;
      case 'createLinearGradient': return ctx.createLinearGradient(arguments[0], arguments[1], arguments[2], arguments[3]);
      case 'createPattern': return ctx.createPattern(arguments[0], arguments[1]);
      case 'createRadialGradient':
        return ctx.createRadialGradient(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5]);
      case 'drawImage':
        switch (arguments.length) {
          case 3:
            ctx.drawImage(arguments[0], arguments[1], arguments[2]);
          case 5:
            ctx.drawImage(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4]);
          case 9:
            ctx.drawImage(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6],
              arguments[7], arguments[8]);
          default:
            throw 'Canvas2dBackend: unexpected arity for drawImage';
        }
        return null;
      case 'ellipse':
        js.Syntax.code('{0}.ellipse({1}, {2}, {3}, {4}, {5}, {6}, {7}, {8})', context, arguments[0], arguments[1],
          arguments[2], arguments[3], arguments[4], arguments[5], arguments[6], arguments[7]);
        return null;
      case 'fill': ctx.fill(arguments[0]); return null;
      case 'fillRect': ctx.fillRect(arguments[0], arguments[1], arguments[2], arguments[3]); return null;
      case 'fillText': ctx.fillText(arguments[0], arguments[1], arguments[2]); return null;
      case 'getContext':
        // Acquisition boundary: the receiver here is the canvas element, not a 2D context.
        return (context : js.html.CanvasElement).getContext(arguments[0]);
      case 'getContextAttributes':
        // Not present on the Haxe 2D-context extern; call the browser method directly.
        return js.Syntax.code('{0}.getContextAttributes()', context);
      case 'getImageData': return ctx.getImageData(arguments[0], arguments[1], arguments[2], arguments[3]);
      case 'lineTo': ctx.lineTo(arguments[0], arguments[1]); return null;
      case 'measureText': return ctx.measureText(arguments[0]);
      case 'moveTo': ctx.moveTo(arguments[0], arguments[1]); return null;
      case 'putImageData': ctx.putImageData(arguments[0], arguments[1], arguments[2]); return null;
      case 'quadraticCurveTo': ctx.quadraticCurveTo(arguments[0], arguments[1], arguments[2], arguments[3]); return null;
      case 'rect': ctx.rect(arguments[0], arguments[1], arguments[2], arguments[3]); return null;
      case 'restore': ctx.restore(); return null;
      case 'rotate': ctx.rotate(arguments[0]); return null;
      case 'roundRect':
        js.Syntax.code('{0}.roundRect({1}, {2}, {3}, {4}, {5})', context, arguments[0], arguments[1], arguments[2],
          arguments[3], arguments[4]);
        return null;
      // Newish browser API: absent on older engines, so feature-test instead of extern.
      case 'isContextLost':
        return js.Syntax.code("(typeof {0}.isContextLost === 'function' ? {0}.isContextLost() : false)", context);
      case 'save': ctx.save(); return null;
      case 'scale': ctx.scale(arguments[0], arguments[1]); return null;
      case 'setTransform':
        ctx.setTransform(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5]);
        return null;
      case 'stroke': ctx.stroke(); return null;
      case 'strokeRect': ctx.strokeRect(arguments[0], arguments[1], arguments[2], arguments[3]); return null;
      case 'transform':
        ctx.transform(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5]);
        return null;
      case 'translate': ctx.translate(arguments[0], arguments[1]); return null;
      default:
        throw 'Canvas2dBackend: unmapped 2D method ' + name;
    }
  }

  public static function callOptional(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (context == null) return _Runtime.UNDEFINED;
    return call(context, name, arguments);
  }

  public static function field(context:Dynamic, name:String):Dynamic {
    if (context == null) return null;
    final ctx:js.html.CanvasRenderingContext2D = context;
    switch (name) {
      case 'canvas': return ctx.canvas;
      case 'isContextLost':
        return js.Syntax.code("(typeof {0}.isContextLost === 'function' ? {0}.isContextLost.bind({0}) : function() { return false; })", context);
      case 'imageSmoothingEnabled': return ctx.imageSmoothingEnabled;
      case 'roundRect':
        return js.Syntax.code("(typeof {0}.roundRect === 'function' ? {0}.roundRect.bind({0}) : null)", context);
      default:
        throw 'Canvas2dBackend: unmapped 2D field ' + name;
    }
  }

  public static function setField(context:Dynamic, name:String, value:Dynamic):Dynamic {
    final ctx:js.html.CanvasRenderingContext2D = context;
    switch (name) {
      case 'fillStyle': ctx.fillStyle = value;
      case 'strokeStyle': ctx.strokeStyle = value;
      case 'filter': ctx.filter = value;
      case 'font': ctx.font = value;
      case 'globalAlpha': ctx.globalAlpha = value;
      case 'globalCompositeOperation': ctx.globalCompositeOperation = value;
      case 'imageSmoothingEnabled': ctx.imageSmoothingEnabled = value;
      // Not present on the Haxe 2D-context extern; assign the browser property directly.
      case 'imageSmoothingQuality': js.Syntax.code('{0}.imageSmoothingQuality = {1}', context, value);
      case 'lineCap': ctx.lineCap = cast value;
      case 'lineJoin': ctx.lineJoin = cast value;
      case 'lineWidth': ctx.lineWidth = value;
      case 'miterLimit': ctx.miterLimit = value;
      case 'textAlign': ctx.textAlign = value;
      case 'textBaseline': ctx.textBaseline = value;
      default:
        throw 'Canvas2dBackend: unmapped 2D property ' + name;
    }
    return value;
  }

  public static function deleteField(context:Dynamic, name:String):Bool {
    return Reflect.deleteField(context, name);
  }
}
#elseif (lime && lime_cairo)
class Canvas2dBackend {
  public static function call(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (context == null) return null;
    if (name == 'getContext') {
      // Acquisition boundary: the receiver here is the canvas stand-in.
      return (context : NativeScratchCanvas).getContext(arguments[0]);
    }
    final ctx:NativeCanvas2dContext = context;
    switch (name) {
      case 'arc': ctx.arc(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5]); return null;
      case 'bezierCurveTo':
        ctx.bezierCurveTo(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5]);
        return null;
      case 'closePath': ctx.closePath(); return null;
      case 'quadraticCurveTo': ctx.quadraticCurveTo(arguments[0], arguments[1], arguments[2], arguments[3]); return null;
      case 'rotate': ctx.rotate(arguments[0]); return null;
      case 'scale': ctx.scale(arguments[0], arguments[1]); return null;
      case 'beginPath': ctx.beginPath(); return null;
      case 'clearRect': ctx.clearRect(arguments[0], arguments[1], arguments[2], arguments[3]); return null;
      case 'clip': ctx.clip(); return null;
      case 'createLinearGradient': return ctx.createLinearGradient(arguments[0], arguments[1], arguments[2], arguments[3]);
      case 'createPattern': return ctx.createPattern(arguments[0], arguments[1]);
      case 'createRadialGradient':
        return ctx.createRadialGradient(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5]);
      case 'drawImage':
        switch (arguments.length) {
          case 3:
            ctx.drawImage(arguments[0], arguments[1], arguments[2]);
          case 5:
            ctx.drawImage(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4]);
          case 9:
            ctx.drawImage(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6],
              arguments[7], arguments[8]);
          default:
            throw 'Canvas2dBackend: unexpected arity for drawImage';
        }
        return null;
      case 'ellipse':
        ctx.ellipse(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6],
          arguments[7]);
        return null;
      case 'fill': ctx.fill(arguments[0]); return null;
      case 'fillRect': ctx.fillRect(arguments[0], arguments[1], arguments[2], arguments[3]); return null;
      case 'fillText': ctx.fillText(arguments[0], arguments[1], arguments[2]); return null;
      case 'getContextAttributes': return ctx.getContextAttributes();
      case 'getImageData': return ctx.getImageData(arguments[0], arguments[1], arguments[2], arguments[3]);
      case 'lineTo': ctx.lineTo(arguments[0], arguments[1]); return null;
      case 'measureText': return ctx.measureText(arguments[0]);
      case 'moveTo': ctx.moveTo(arguments[0], arguments[1]); return null;
      case 'putImageData': ctx.putImageData(arguments[0], arguments[1], arguments[2]); return null;
      case 'rect': ctx.rect(arguments[0], arguments[1], arguments[2], arguments[3]); return null;
      case 'restore': ctx.restore(); return null;
      case 'roundRect': ctx.roundRect(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4]); return null;
      // A cairo surface context has no loss mechanism; report never-lost.
      case 'isContextLost': return false;
      case 'save': ctx.save(); return null;
      case 'setTransform':
        ctx.setTransform(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5]);
        return null;
      case 'stroke': ctx.stroke(); return null;
      case 'strokeRect': ctx.strokeRect(arguments[0], arguments[1], arguments[2], arguments[3]); return null;
      case 'transform':
        ctx.transform(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5]);
        return null;
      case 'translate': ctx.translate(arguments[0], arguments[1]); return null;
      default:
        throw 'Canvas2dBackend: unmapped 2D method ' + name;
    }
  }

  public static function callOptional(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (context == null) return _Runtime.UNDEFINED;
    return call(context, name, arguments);
  }

  public static function field(context:Dynamic, name:String):Dynamic {
    if (context == null) return null;
    final ctx:NativeCanvas2dContext = context;
    switch (name) {
      case 'canvas': return ctx.canvas;
      case 'isContextLost': return function():Dynamic return false;
      case 'imageSmoothingEnabled': return ctx.imageSmoothingEnabled;
      case 'roundRect': return Reflect.field(ctx, name);
      default:
        throw 'Canvas2dBackend: unmapped 2D field ' + name;
    }
  }

  public static function setField(context:Dynamic, name:String, value:Dynamic):Dynamic {
    final ctx:NativeCanvas2dContext = context;
    switch (name) {
      case 'fillStyle': ctx.fillStyle = value;
      case 'strokeStyle': ctx.strokeStyle = value;
      case 'filter': ctx.filter = Std.string(value);
      case 'font': ctx.font = Std.string(value);
      case 'globalAlpha': ctx.globalAlpha = value;
      case 'globalCompositeOperation': ctx.globalCompositeOperation = Std.string(value);
      case 'imageSmoothingEnabled': ctx.imageSmoothingEnabled = value == true;
      case 'imageSmoothingQuality': ctx.imageSmoothingQuality = Std.string(value);
      case 'lineCap': ctx.lineCap = Std.string(value);
      case 'lineJoin': ctx.lineJoin = Std.string(value);
      case 'lineWidth': ctx.lineWidth = value;
      case 'miterLimit': ctx.miterLimit = value;
      case 'textAlign': ctx.textAlign = Std.string(value);
      case 'textBaseline': ctx.textBaseline = Std.string(value);
      default:
        throw 'Canvas2dBackend: unmapped 2D property ' + name;
    }
    return value;
  }

  public static function deleteField(context:Dynamic, name:String):Bool {
    return Reflect.deleteField(context, name);
  }
}
#elseif lime
class Canvas2dBackend {
  static inline function unavailable():Dynamic {
    throw 'Canvas2D requires Lime\'s cairo feature on this target (build without lime_cairo).';
  }

  public static function call(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    return unavailable();
  }

  public static function callOptional(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    return _Runtime.UNDEFINED;
  }

  public static function field(context:Dynamic, name:String):Dynamic {
    return unavailable();
  }

  public static function setField(context:Dynamic, name:String, value:Dynamic):Dynamic {
    return unavailable();
  }

  public static function deleteField(context:Dynamic, name:String):Bool {
    return false;
  }
}
#else
class Canvas2dBackend {
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
#end
