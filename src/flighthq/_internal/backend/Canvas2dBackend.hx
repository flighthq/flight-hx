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
 * - `lime` (native, no DOM): there is no native 2D canvas. These paths are
 *   browser-only (image surfaces, glyph rasterization); fail loudly so a missing
 *   native raster backend surfaces instead of silently drawing nothing.
 * - otherwise (e.g. the plain-JS Vitest bridge, which has no `html5` define): the
 *   context is still a real browser object, so keep reflection.
 */
#if (js && html5)
class Canvas2dBackend {
  public static function call(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (context == null) return null;
    final ctx:js.html.CanvasRenderingContext2D = context;
    switch (name) {
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
      case 'rect': ctx.rect(arguments[0], arguments[1], arguments[2], arguments[3]); return null;
      case 'restore': ctx.restore(); return null;
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
    final ctx:js.html.CanvasRenderingContext2D = context;
    switch (name) {
      case 'canvas': return ctx.canvas;
      case 'imageSmoothingEnabled': return ctx.imageSmoothingEnabled;
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
      case 'lineWidth': ctx.lineWidth = value;
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
#elseif lime
class Canvas2dBackend {
  static inline function unavailable():Dynamic {
    throw 'Canvas2D is not available on this target (no DOM 2D canvas); a native raster backend is required.';
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
