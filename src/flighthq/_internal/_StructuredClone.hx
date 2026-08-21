// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

/** Portable structured clone for Flight's plain, acyclic snapshot contract.
 * Shared references and cycles are retained so the primitive also remains
 * well-defined for the guard paths that diagnose unsupported state shapes.
 */
class _StructuredClone {
  public static function clone<T>(source:T):T {
    return cast cloneValue(source, new _IdentityMap<Dynamic>());
  }

  static function cloneValue(source:Dynamic, seen:_IdentityMap<Dynamic>):Dynamic {
    if (source == null) return null;
    switch (Type.typeof(source)) {
      case TBool | TInt | TFloat | TClass(String) | TEnum(_):
        return source;
      case TFunction:
        throw new _DOMException('Functions cannot be cloned', 'DataCloneError');
      default:
    }

    if (seen.exists(source)) return seen.get(source);

    if (Std.isOfType(source, haxe.io.Bytes)) {
      final input:haxe.io.Bytes = cast source;
      final output = haxe.io.Bytes.alloc(input.length);
      output.blit(0, input, 0, input.length);
      seen.set(source, output);
      return output;
    }
    if (Std.isOfType(source, _Date)) {
      final output = new _Date((cast source : _Date).getTime());
      seen.set(source, output);
      return output;
    }
    if (Std.isOfType(source, EReg)) {
      // Haxe's EReg exposes neither its source nor its flags. RegExp is outside
      // Flight's supported snapshot shape and the guard reports it; retaining
      // the immutable matcher is preferable to fabricating a different one.
      seen.set(source, source);
      return source;
    }
    if (Std.isOfType(source, _Map)) {
      final input:_Map<Dynamic, Dynamic> = cast source;
      final output = new _Map<Dynamic, Dynamic>();
      seen.set(source, output);
      for (entry in input.entries()) output.set(cloneValue(entry[0], seen), cloneValue(entry[1], seen));
      return output;
    }
    if (Std.isOfType(source, _Set)) {
      final input:_Set<Dynamic> = cast source;
      final output = new _Set<Dynamic>();
      seen.set(source, output);
      for (entry in input.values()) output.add(cloneValue(entry, seen));
      return output;
    }
    #if (lime && !js)
    if (Std.isOfType(source, _LimeTypedArray)) {
      final output = (cast source : _LimeTypedArray).copy();
      seen.set(source, output);
      return output;
    }
    #end
    if (Std.isOfType(source, Array)) {
      final input:Array<Dynamic> = cast source;
      final output:Array<Dynamic> = [];
      seen.set(source, output);
      for (entry in input) output.push(cloneValue(entry, seen));
      return output;
    }

    final sourceClass = Type.getClass(source);
    final output:Dynamic = sourceClass == null ? {} : createClassClone(sourceClass);
    seen.set(source, output);
    for (field in Reflect.fields(source)) Reflect.setField(output, field, cloneValue(Reflect.field(source, field), seen));
    return output;
  }

  static function createClassClone(sourceClass:Class<Dynamic>):Dynamic {
    try {
      return Type.createEmptyInstance(sourceClass);
    } catch (_:Dynamic) {
      return {};
    }
  }
}
