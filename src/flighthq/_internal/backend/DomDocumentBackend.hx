package flighthq._internal.backend;

import flighthq._internal._Runtime;

/**
 * Stable target boundary for the global `document` object.
 *
 * The DOM document is a browser host global with no equivalent on native Lime
 * and (for the newer members here) no complete Haxe extern, so the typed branch
 * issues statically-named direct JS (compile-time literal member names, not
 * reflection); native fails loudly per capability; the plain-JS bridge reflects.
 *
 * Bounded first allowlist — builder emits `DomDocumentBackend.call/field(document, name, ...)`;
 * unmapped names hit a loud default so a missing member surfaces instead of
 * silently passing through.
 */
class DomDocumentBackend {
  public static function call(obj:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (obj == null) return null;
    #if (js && html5)
    switch (name) {
      case 'createElement': return js.Syntax.code('{0}.createElement(...{1})', obj, arguments);
      case 'createTextNode': return js.Syntax.code('{0}.createTextNode(...{1})', obj, arguments);
      case 'exitFullscreen': return js.Syntax.code('{0}.exitFullscreen(...{1})', obj, arguments);
      case 'getElementById': return js.Syntax.code('{0}.getElementById(...{1})', obj, arguments);
      case 'hasFocus': return js.Syntax.code('{0}.hasFocus(...{1})', obj, arguments);
      case 'querySelector': return js.Syntax.code('{0}.querySelector(...{1})', obj, arguments);
      case 'addEventListener': js.Syntax.code('{0}.addEventListener(...{1})', obj, arguments); return null;
      case 'removeEventListener': js.Syntax.code('{0}.removeEventListener(...{1})', obj, arguments); return null;
      case 'exitPointerLock': js.Syntax.code('{0}.exitPointerLock(...{1})', obj, arguments); return null;
      default:
        throw 'DomDocumentBackend: unmapped document method ' + name;
    }
    #elseif lime
    throw 'DomDocumentBackend.' + name + ' is not available on this target (no DOM document).';
    #else
    return Reflect.callMethod(obj, Reflect.field(obj, name), arguments);
    #end
  }

  public static function callOptional(obj:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (obj == null) return _Runtime.UNDEFINED;
    return call(obj, name, arguments);
  }

  public static function field(obj:Dynamic, name:String):Dynamic {
    if (obj == null) return null;
    #if (js && html5)
    switch (name) {
      case 'body': return js.Syntax.code('{0}.body', obj);
      case 'createElement': return js.Syntax.code('{0}.createElement', obj);
      case 'documentElement': return js.Syntax.code('{0}.documentElement', obj);
      case 'exitPointerLock': return js.Syntax.code('{0}.exitPointerLock', obj);
      case 'fonts': return js.Syntax.code('{0}.fonts', obj);
      case 'head': return js.Syntax.code('{0}.head', obj);
      case 'hidden': return js.Syntax.code('{0}.hidden', obj);
      case 'pointerLockElement': return js.Syntax.code('{0}.pointerLockElement', obj);
      case 'title': return js.Syntax.code('{0}.title', obj);
      default:
        throw 'DomDocumentBackend: unmapped document field ' + name;
    }
    #elseif lime
    throw 'DomDocumentBackend.' + name + ' is not available on this target (no DOM document).';
    #else
    return Reflect.field(obj, name);
    #end
  }

  public static function setField(obj:Dynamic, name:String, value:Dynamic):Dynamic {
    #if (js && html5)
    switch (name) {
      case 'title': js.Syntax.code('{0}.title = {1}', obj, value);
      default:
        throw 'DomDocumentBackend: unmapped document property ' + name;
    }
    return value;
    #elseif lime
    throw 'DomDocumentBackend.' + name + ' is not available on this target (no DOM document).';
    #else
    Reflect.setField(obj, name, value);
    return value;
    #end
  }

  public static function deleteField(obj:Dynamic, name:String):Bool {
    return Reflect.deleteField(obj, name);
  }
}
