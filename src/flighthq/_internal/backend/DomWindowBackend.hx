package flighthq._internal.backend;

import flighthq._internal._Runtime;

/**
 * Stable target boundary for the global `window` object.
 *
 * The DOM window is a browser host global with no equivalent on native Lime
 * and (for the newer members here) no complete Haxe extern, so the typed branch
 * issues statically-named direct JS (compile-time literal member names, not
 * reflection); native fails loudly per capability; the plain-JS bridge reflects.
 *
 * Bounded first allowlist — builder emits `DomWindowBackend.call/field(window, name, ...)`;
 * unmapped names hit a loud default so a missing member surfaces instead of
 * silently passing through.
 */
class DomWindowBackend {
  public static function call(obj:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (obj == null) return null;
    #if (js && html5)
    switch (name) {
      case 'confirm': return js.Syntax.code('{0}.confirm(...{1})', obj, arguments);
      case 'matchMedia': return js.Syntax.code('{0}.matchMedia(...{1})', obj, arguments);
      case 'open': return js.Syntax.code('{0}.open(...{1})', obj, arguments);
      case 'prompt': return js.Syntax.code('{0}.prompt(...{1})', obj, arguments);
      case 'showDirectoryPicker': return js.Syntax.code('{0}.showDirectoryPicker(...{1})', obj, arguments);
      case 'showOpenFilePicker': return js.Syntax.code('{0}.showOpenFilePicker(...{1})', obj, arguments);
      case 'showSaveFilePicker': return js.Syntax.code('{0}.showSaveFilePicker(...{1})', obj, arguments);
      case 'getScreenDetails': return js.Syntax.code('{0}.getScreenDetails(...{1})', obj, arguments);
      case 'addEventListener': js.Syntax.code('{0}.addEventListener(...{1})', obj, arguments); return null;
      case 'alert': js.Syntax.code('{0}.alert(...{1})', obj, arguments); return null;
      case 'close': js.Syntax.code('{0}.close(...{1})', obj, arguments); return null;
      case 'focus': js.Syntax.code('{0}.focus(...{1})', obj, arguments); return null;
      case 'moveTo': js.Syntax.code('{0}.moveTo(...{1})', obj, arguments); return null;
      case 'removeEventListener': js.Syntax.code('{0}.removeEventListener(...{1})', obj, arguments); return null;
      case 'resizeTo': js.Syntax.code('{0}.resizeTo(...{1})', obj, arguments); return null;
      default:
        throw 'DomWindowBackend: unmapped window method ' + name;
    }
    #elseif lime
    throw 'DomWindowBackend.' + name + ' is not available on this target (no DOM window).';
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
      case 'alert': return js.Syntax.code('{0}.alert', obj);
      case 'close': return js.Syntax.code('{0}.close', obj);
      case 'confirm': return js.Syntax.code('{0}.confirm', obj);
      case 'devicePixelRatio': return js.Syntax.code('{0}.devicePixelRatio', obj);
      case 'focus': return js.Syntax.code('{0}.focus', obj);
      case 'innerHeight': return js.Syntax.code('{0}.innerHeight', obj);
      case 'innerWidth': return js.Syntax.code('{0}.innerWidth', obj);
      case 'isSecureContext': return js.Syntax.code('{0}.isSecureContext', obj);
      case 'localStorage': return js.Syntax.code('{0}.localStorage', obj);
      case 'matchMedia': return js.Syntax.code('{0}.matchMedia', obj);
      case 'moveTo': return js.Syntax.code('{0}.moveTo', obj);
      case 'open': return js.Syntax.code('{0}.open', obj);
      case 'prompt': return js.Syntax.code('{0}.prompt', obj);
      case 'resizeTo': return js.Syntax.code('{0}.resizeTo', obj);
      case 'screen': return js.Syntax.code('{0}.screen', obj);
      case 'screenX': return js.Syntax.code('{0}.screenX', obj);
      case 'screenY': return js.Syntax.code('{0}.screenY', obj);
      case 'visualViewport': return js.Syntax.code('{0}.visualViewport', obj);
      case 'showDirectoryPicker': return js.Syntax.code('{0}.showDirectoryPicker', obj);
      case 'showOpenFilePicker': return js.Syntax.code('{0}.showOpenFilePicker', obj);
      case 'showSaveFilePicker': return js.Syntax.code('{0}.showSaveFilePicker', obj);
      case 'getScreenDetails': return js.Syntax.code('{0}.getScreenDetails', obj);
      default:
        throw 'DomWindowBackend: unmapped window field ' + name;
    }
    #elseif lime
    throw 'DomWindowBackend.' + name + ' is not available on this target (no DOM window).';
    #else
    return Reflect.field(obj, name);
    #end
  }

  public static function setField(obj:Dynamic, name:String, value:Dynamic):Dynamic {
    #if (js && html5)
    // No settable member is in the bounded window contract; fail loudly if one is routed.
    throw 'DomWindowBackend: unmapped window property ' + name;
    #elseif lime
    throw 'DomWindowBackend.' + name + ' is not available on this target (no DOM window).';
    #else
    Reflect.setField(obj, name, value);
    return value;
    #end
  }

  public static function deleteField(obj:Dynamic, name:String):Bool {
    return Reflect.deleteField(obj, name);
  }
}
