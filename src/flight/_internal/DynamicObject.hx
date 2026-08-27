package flight._internal;

import Math as HxMath;

/**
 * Portable binding for the ECMAScript Object operations used by generated code.
 *
 * Keeping these named operations here prevents generated modules from depending
 * on either Haxe Reflect or a JavaScript-only global Object value.
 */
class DynamicObject {
  #if !js
  static final frozenObjects:_IdentityMap<Bool> = new _IdentityMap();
  #end

  public static function assign(target:Dynamic, sources:haxe.Rest<Dynamic>):Dynamic {
    for (source in sources) {
      if (source == null) continue;
      for (name in Reflect.fields(source)) Reflect.setField(target, name, Reflect.field(source, name));
    }
    return target;
  }

  public static inline function entries(source:Dynamic):Array<Array<Dynamic>> {
    return [for (name in Reflect.fields(source)) [name, Reflect.field(source, name)]];
  }

  public static inline function keys(source:Dynamic):Array<String> {
    return Reflect.fields(source);
  }

  public static inline function values(source:Dynamic):Array<Dynamic> {
    return [for (name in Reflect.fields(source)) Reflect.field(source, name)];
  }

  public static inline function freeze(source:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('Object.freeze({0})', source);
    #else
    if (isObjectValue(source)) frozenObjects.set(source, true);
    return source;
    #end
  }

  public static function defineProperty(target:Dynamic, name:String, descriptor:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('Object.defineProperty({0}, {1}, {2})', target, name, descriptor);
    #else
    if (descriptor != null && Reflect.hasField(descriptor, 'value')) {
      Reflect.setField(target, name, Reflect.field(descriptor, 'value'));
    }
    return target;
    #end
  }

  public static function defineProperties(target:Dynamic, descriptors:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('Object.defineProperties({0}, {1})', target, descriptors);
    #else
    if (descriptors != null) {
      for (name in Reflect.fields(descriptors)) defineProperty(target, name, Reflect.field(descriptors, name));
    }
    return target;
    #end
  }

  public static inline function isFrozen(source:Dynamic):Bool {
    #if js
    return js.Syntax.code('Object.isFrozen({0})', source);
    #else
    return !isObjectValue(source) || frozenObjects.exists(source);
    #end
  }

  public static function is(left:Float, right:Float):Bool {
    #if js
    return js.Syntax.code('Object.is({0}, {1})', left, right);
    #else
    if (HxMath.isNaN(left)) return HxMath.isNaN(right);
    if (left == 0 && right == 0) {
      #if cpp
      final leftBits = haxe.io.FPHelper.doubleToI64(left);
      final leftHigh = leftBits.high;
      final leftLow = leftBits.low;
      final rightBits = haxe.io.FPHelper.doubleToI64(right);
      return leftHigh == rightBits.high && leftLow == rightBits.low;
      #else
      return HxMath.atan2(left, -1.0) == HxMath.atan2(right, -1.0);
      #end
    }
    return left == right;
    #end
  }

  public static inline function field(name:String):Dynamic {
    #if js
    return js.Syntax.code('Object[{0}]', name);
    #else
    return null;
    #end
  }

  #if !js
  static function isObjectValue(value:Dynamic):Bool {
    if (value == null) return false;
    return switch (Type.typeof(value)) {
      case TObject | TEnum(_): true;
      case TClass(type): type != String;
      default: false;
    };
  }
  #end
}
