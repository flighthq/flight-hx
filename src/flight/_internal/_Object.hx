package flight._internal;

/** ECMAScript Object operations used by compiler-emitted Haxe. */
class _Object {
  public static var prototype(get, never):Dynamic;

  public static function assign<T>(target:T, ...sources:Dynamic):T {
    for (source in sources) {
      if (source == null) continue;
      for (field in Reflect.fields(source)) Reflect.setField(target, field, Reflect.field(source, field));
    }
    return target;
  }

  public static inline function create(prototype:Dynamic):Dynamic {
    #if js return js.Syntax.code("Object.create({0})", prototype); #else return {}; #end
  }

  public static function defineProperties<T>(target:T, descriptors:Dynamic):T {
    #if js
    return js.Syntax.code("Object.defineProperties({0}, {1})", target, descriptors);
    #else
    for (field in Reflect.fields(descriptors)) {
      final descriptor = Reflect.field(descriptors, field);
      if (Reflect.hasField(descriptor, 'value')) Reflect.setField(target, field, Reflect.field(descriptor, 'value'));
    }
    return target;
    #end
  }

  public static inline function defineProperty<T>(target:T, key:Dynamic, descriptor:Dynamic):T {
    #if js return js.Syntax.code("Object.defineProperty({0}, {1}, {2})", target, key, descriptor); #else
    if (Reflect.hasField(descriptor, 'value')) Reflect.setField(target, Std.string(key), Reflect.field(descriptor, 'value'));
    return target;
    #end
  }

  public static function entries(value:Dynamic):Array<Array<Dynamic>> {
    return [for (key in keys(value)) [key, Reflect.field(value, key)]];
  }

  public static inline function is(left:Dynamic, right:Dynamic):Bool {
    #if js
    return js.Syntax.code("Object.is({0}, {1})", left, right);
    #else
    if (Std.isOfType(left, Float) && Std.isOfType(right, Float)) {
      final leftNumber:Float = left;
      final rightNumber:Float = right;
      if (Math.isNaN(leftNumber) && Math.isNaN(rightNumber)) return true;
      if (leftNumber == 0 && rightNumber == 0) return 1 / leftNumber == 1 / rightNumber;
    }
    return left == right;
    #end
  }

  public static inline function freeze<T>(value:T):T {
    #if js return js.Syntax.code("Object.freeze({0})", value); #else return value; #end
  }

  public static inline function hasOwn(value:Dynamic, key:Dynamic):Bool {
    #if js return js.Syntax.code("Object.prototype.hasOwnProperty.call({0}, {1})", value, key); #else return Reflect.hasField(value, Std.string(key)); #end
  }

  public static inline function isFrozen(value:Dynamic):Bool {
    #if js return js.Syntax.code("Object.isFrozen({0})", value); #else return false; #end
  }

  public static function keys(value:Dynamic):Array<String> {
    return Reflect.fields(value);
  }

  public static inline function values(value:Dynamic):Array<Dynamic> {
    #if js return js.Syntax.code("Object.values({0})", value); #else return [for (key in keys(value)) Reflect.field(value, key)]; #end
  }

  public static function structuredClone<T>(value:T):T {
    #if js
    return js.Syntax.code("structuredClone({0})", value);
    #else
    return haxe.Unserializer.run(haxe.Serializer.run(value));
    #end
  }

  static inline function get_prototype():Dynamic {
    #if js return js.Syntax.code("Object.prototype"); #else return {}; #end
  }
}
