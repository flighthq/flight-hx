package flighthq._internal.backend;

import flighthq._internal._Runtime;

/**
 * Stable target boundary for the global `navigator` object.
 *
 * The DOM navigator is a browser host global with no equivalent on native Lime
 * and (for the newer members here) no complete Haxe extern, so the typed branch
 * issues statically-named direct JS (compile-time literal member names, not
 * reflection); native fails loudly per capability; the plain-JS bridge reflects.
 *
 * Bounded first allowlist — builder emits `DomNavigatorBackend.call/field(navigator, name, ...)`;
 * unmapped names hit a loud default so a missing member surfaces instead of
 * silently passing through.
 */
class DomNavigatorBackend {
  public static function call(obj:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (obj == null) return null;
    #if (js && html5)
    switch (name) {
      case 'getGamepads': return js.Syntax.code('{0}.getGamepads(...{1})', obj, arguments);
      case 'share': return js.Syntax.code('{0}.share(...{1})', obj, arguments);
      case 'vibrate': return js.Syntax.code('{0}.vibrate(...{1})', obj, arguments);
      case 'getBattery': return js.Syntax.code('{0}.getBattery(...{1})', obj, arguments);
      default:
        throw 'DomNavigatorBackend: unmapped navigator method ' + name;
    }
    #elseif lime
    throw 'DomNavigatorBackend.' + name + ' is not available on this target (no DOM navigator).';
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
      case 'clipboard': return js.Syntax.code('{0}.clipboard', obj);
      case 'connection': return js.Syntax.code('{0}.connection', obj);
      case 'geolocation': return js.Syntax.code('{0}.geolocation', obj);
      case 'getBattery': return js.Syntax.code('{0}.getBattery', obj);
      case 'getGamepads': return js.Syntax.code('{0}.getGamepads', obj);
      case 'gpu': return js.Syntax.code('{0}.gpu', obj);
      case 'language': return js.Syntax.code('{0}.language', obj);
      case 'languages': return js.Syntax.code('{0}.languages', obj);
      case 'maxTouchPoints': return js.Syntax.code('{0}.maxTouchPoints', obj);
      case 'mediaDevices': return js.Syntax.code('{0}.mediaDevices', obj);
      case 'mediaSession': return js.Syntax.code('{0}.mediaSession', obj);
      case 'permissions': return js.Syntax.code('{0}.permissions', obj);
      case 'platform': return js.Syntax.code('{0}.platform', obj);
      case 'share': return js.Syntax.code('{0}.share', obj);
      case 'storage': return js.Syntax.code('{0}.storage', obj);
      case 'vibrate': return js.Syntax.code('{0}.vibrate', obj);
      case 'virtualKeyboard': return js.Syntax.code('{0}.virtualKeyboard', obj);
      case 'wakeLock': return js.Syntax.code('{0}.wakeLock', obj);
      default:
        throw 'DomNavigatorBackend: unmapped navigator field ' + name;
    }
    #elseif lime
    throw 'DomNavigatorBackend.' + name + ' is not available on this target (no DOM navigator).';
    #else
    return Reflect.field(obj, name);
    #end
  }

  public static function setField(obj:Dynamic, name:String, value:Dynamic):Dynamic {
    #if (js && html5)
    // No settable member is in the bounded navigator contract; fail loudly if one is routed.
    throw 'DomNavigatorBackend: unmapped navigator property ' + name;
    #elseif lime
    throw 'DomNavigatorBackend.' + name + ' is not available on this target (no DOM navigator).';
    #else
    Reflect.setField(obj, name, value);
    return value;
    #end
  }

  public static function deleteField(obj:Dynamic, name:String):Bool {
    return Reflect.deleteField(obj, name);
  }
}
