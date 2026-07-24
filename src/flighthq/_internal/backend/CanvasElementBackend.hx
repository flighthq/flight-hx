package flighthq._internal.backend;

import flighthq._internal._Runtime;

/**
 * Structural view of the members every canvas-like value shares.
 *
 * The value Flight receives as its render-target `canvas` is duck-typed: a real
 * `HTMLCanvasElement`/`OffscreenCanvas` in a browser host, but the example
 * `_GlCanvas` adapter under Lime. All of them expose `getContext`, `width`, and
 * `height`, so a structural type dispatches those typed on every target — direct
 * property access on JS, no reflection — without forcing a shared supertype.
 */
typedef CanvasLike = {
  function getContext(contextId:String, ?options:Dynamic):Dynamic;
  var width:Int;
  var height:Int;
}

/**
 * Stable target boundary for canvas *element* access (distinct from the 2D
 * drawing context in `Canvas2dBackend`).
 *
 * `getContext`/`width`/`height` are shared by real canvases and the Lime adapter,
 * so they are typed through `CanvasLike` on all targets. The remaining operations
 * (`toDataURL`, `convertToBlob`, `getBoundingClientRect`, event listeners) only
 * ever target real browser canvases, so they are typed under `(js && html5)`,
 * fail loudly on native (no DOM canvas), and fall back to reflection on the
 * plain-JS bridge where the receiver is still a real DOM object.
 */
class CanvasElementBackend {
  public static function call(canvas:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (canvas == null) return null;
    if (name == 'getContext') {
      final el:CanvasLike = canvas;
      return arguments.length > 1 ? el.getContext(arguments[0], arguments[1]) : el.getContext(arguments[0]);
    }
    #if (js && html5)
    switch (name) {
      case 'toDataURL':
        final el:js.html.CanvasElement = canvas;
        return switch (arguments.length) {
          case 0: el.toDataURL();
          case 1: el.toDataURL(arguments[0]);
          default: el.toDataURL(arguments[0], arguments[1]);
        };
      case 'convertToBlob':
        // OffscreenCanvas.convertToBlob; not in every Haxe extern, call directly.
        return arguments.length > 0
          ? js.Syntax.code('{0}.convertToBlob({1})', canvas, arguments[0])
          : js.Syntax.code('{0}.convertToBlob()', canvas);
      case 'getBoundingClientRect':
        return (canvas : js.html.Element).getBoundingClientRect();
      case 'addEventListener':
        (canvas : js.html.EventTarget).addEventListener(arguments[0], arguments[1]);
        return null;
      case 'removeEventListener':
        (canvas : js.html.EventTarget).removeEventListener(arguments[0], arguments[1]);
        return null;
      default:
        throw 'CanvasElementBackend: unmapped canvas method ' + name;
    }
    #elseif lime
    throw 'CanvasElementBackend.' + name + ' is not available on native (no DOM canvas element).';
    #else
    return Reflect.callMethod(canvas, Reflect.field(canvas, name), arguments);
    #end
  }

  public static function callOptional(canvas:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (canvas == null) return _Runtime.UNDEFINED;
    return call(canvas, name, arguments);
  }

  public static function field(canvas:Dynamic, name:String):Dynamic {
    if (canvas == null) return null;
    switch (name) {
      case 'width': return (canvas : CanvasLike).width;
      case 'height': return (canvas : CanvasLike).height;
      default:
        #if (js && html5)
        throw 'CanvasElementBackend: unmapped canvas field ' + name;
        #elseif lime
        throw 'CanvasElementBackend.' + name + ' is not available on native (no DOM canvas element).';
        #else
        return Reflect.field(canvas, name);
        #end
    }
  }

  public static function setField(canvas:Dynamic, name:String, value:Dynamic):Dynamic {
    switch (name) {
      case 'width': (canvas : CanvasLike).width = value;
      case 'height': (canvas : CanvasLike).height = value;
      default:
        #if (js && html5)
        throw 'CanvasElementBackend: unmapped canvas property ' + name;
        #elseif lime
        throw 'CanvasElementBackend.' + name + ' is not available on native (no DOM canvas element).';
        #else
        Reflect.setField(canvas, name, value);
        #end
    }
    return value;
  }

  public static function deleteField(canvas:Dynamic, name:String):Bool {
    return Reflect.deleteField(canvas, name);
  }
}
