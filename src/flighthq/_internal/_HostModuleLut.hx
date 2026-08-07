package flighthq._internal;

/**
 * Standard-toolkit lookup for values imported from non-Flight modules.
 *
 * Generated code names the module specifier and imported binding. The
 * transpiler does not implement module loading or silently replace the value
 * with an unrelated Haxe type; a target toolkit owns that policy here.
 */
class _HostModuleLut {
  public static function get(specifier:String, imported:String):Dynamic {
    #if js
    final module:Dynamic = js.Syntax.code('require({0})', specifier);
    if (imported == '*') return module;
    if (imported == 'default') {
      final defaultValue = Reflect.field(module, 'default');
      return defaultValue == null ? module : defaultValue;
    }
    return Reflect.field(module, imported);
    #else
    throw 'Host module LUT key is not implemented on this target: ' + specifier + '#' + imported;
    #end
  }
}
