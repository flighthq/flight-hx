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
  static final declaredFieldsByClass:Map<String, Map<String, Bool>> = [];
  static final frozenObjects:_IdentityMap<Bool> = new _IdentityMap();
  // Native Haxe classes cannot own fields that were not declared at compile
  // time. Preserve JavaScript's object-expando behavior in an identity sidecar
  // so open Entity records can still use nominal classes on hxcpp.
  static final objectFields:_IdentityMap<Dynamic> = new _IdentityMap();
  // JavaScript functions are objects and can own fields. Native Haxe closure
  // values cannot, so retain fields assigned to them behind the same identity.
  static final callableTargets:Array<Dynamic> = [];
  static final callableFields:Array<Dynamic> = [];
  #end

  @:noInline public static function assign(target:Dynamic, sources:haxe.Rest<Dynamic>):Dynamic {
    for (source in sources) {
      if (source == null) continue;
      for (name in keys(source)) setOwnField(target, name, ownField(source, name));
    }
    return target;
  }

  public static function entries(source:Dynamic):Array<Array<Dynamic>> {
    return [for (name in keys(source)) [name, ownField(source, name)]];
  }

  public static inline function fromEntries(entries:Array<Array<Dynamic>>):Dynamic {
    final result:Dynamic = {};
    for (entry in entries) {
      if (entry.length >= 2) Reflect.setField(result, Std.string(entry[0]), entry[1]);
    }
    return result;
  }

  public static inline function create(prototype:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('Object.create({0})', prototype);
    #else
    return {};
    #end
  }

  public static inline function getPrototypeOf(source:Dynamic):Dynamic {
    #if js
    return js.Syntax.code('Object.getPrototypeOf({0})', source);
    #else
    return switch (Type.typeof(source)) {
      case TClass(type): type;
      case TEnum(type): type;
      default: null;
    };
    #end
  }

  public static function hasOwn(source:Dynamic, name:String):Bool {
    #if js
    return js.Syntax.code('Object.prototype.hasOwnProperty.call({0}, {1})', source, name);
    #else
    return source != null && (Reflect.hasField(source, name) || hasAttachedField(source, name));
    #end
  }

  public static function hasInstanceField(source:Dynamic, name:String):Bool {
    #if js
    return false;
    #else
    final sourceClass = Type.getClass(source);
    if (sourceClass == null) return false;
    final className = Type.getClassName(sourceClass);
    var fields = declaredFieldsByClass.get(className);
    if (fields == null) {
      fields = [];
      for (field in Type.getInstanceFields(sourceClass)) fields.set(field, true);
      declaredFieldsByClass.set(className, fields);
    }
    return fields.exists(name);
    #end
  }

  public static function keys(source:Dynamic):Array<String> {
    final result = Reflect.fields(source);
    #if !js
    final extra = objectFields.get(source);
    if (extra != null) {
      for (name in Reflect.fields(extra)) if (result.indexOf(name) < 0) result.push(name);
    }
    final index = callableIndex(source);
    if (index >= 0) {
      final attached = callableFields[index];
      for (name in Reflect.fields(attached)) if (result.indexOf(name) < 0) result.push(name);
    }
    #end
    return result;
  }

  public static function values(source:Dynamic):Array<Dynamic> {
    return [for (name in keys(source)) ownField(source, name)];
  }

  public static inline function readField(source:Dynamic, name:String):Dynamic {
    #if js
    return js.Syntax.code('{0}[{1}]', source, name);
    #else
    return hasAttachedField(source, name) ? attachedField(source, name) : Reflect.field(source, name);
    #end
  }

  public static inline function writeField(target:Dynamic, name:String, value:Dynamic):Dynamic {
    setOwnField(target, name, value);
    return value;
  }

  public static function deleteOwnField(target:Dynamic, name:String):Bool {
    #if js
    return js.Syntax.code('delete {0}[{1}]', target, name);
    #else
    final extra = objectFields.get(target);
    if (extra != null && Reflect.hasField(extra, name)) return Reflect.deleteField(extra, name);
    final callableIndex = callableIndex(target);
    if (callableIndex >= 0 && Reflect.hasField(callableFields[callableIndex], name)) {
      return Reflect.deleteField(callableFields[callableIndex], name);
    }
    return Reflect.deleteField(target, name);
    #end
  }

  public static function hasAttachedField(source:Dynamic, name:String):Bool {
    #if js
    return false;
    #else
    final extra = objectFields.get(source);
    return (extra != null && Reflect.hasField(extra, name)) || hasCallableField(source, name);
    #end
  }

  public static function attachedField(source:Dynamic, name:String):Dynamic {
    #if js
    return null;
    #else
    final extra = objectFields.get(source);
    return extra != null && Reflect.hasField(extra, name) ? Reflect.field(extra, name) : callableField(source, name);
    #end
  }

  @:noInline public static function hasCallableField(source:Dynamic, name:String):Bool {
    #if js
    return false;
    #else
    final index = callableIndex(source);
    return index >= 0 && Reflect.hasField(callableFields[index], name);
    #end
  }

  @:noInline public static function callableField(source:Dynamic, name:String):Dynamic {
    #if js
    return null;
    #else
    final index = callableIndex(source);
    return index < 0 ? null : Reflect.field(callableFields[index], name);
    #end
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
      setOwnField(target, name, Reflect.field(descriptor, 'value'));
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
  static function ownField(source:Dynamic, name:String):Dynamic {
    return hasAttachedField(source, name) ? attachedField(source, name) : Reflect.field(source, name);
  }

  @:noInline static function setOwnField(target:Dynamic, name:String, value:Dynamic):Void {
    if (!Reflect.isFunction(target)) {
      final targetClass = Type.getClass(target);
      if (targetClass != null && !hasInstanceField(target, name)) {
        var extra = objectFields.get(target);
        if (extra == null) {
          extra = {};
          objectFields.set(target, extra);
        }
        Reflect.setField(extra, name, value);
        return;
      }
      Reflect.setField(target, name, value);
      return;
    }
    var index = callableIndex(target);
    if (index < 0) {
      index = callableTargets.length;
      callableTargets.push(target);
      callableFields.push({});
    }
    Reflect.setField(callableFields[index], name, value);
  }

  @:noInline static function callableIndex(target:Dynamic):Int {
    if (!Reflect.isFunction(target)) return -1;
    var index = callableTargets.length;
    while (index > 0) {
      index--;
      if (Reflect.compareMethods(callableTargets[index], target)) return index;
    }
    return -1;
  }

  static function isObjectValue(value:Dynamic):Bool {
    if (value == null) return false;
    return switch (Type.typeof(value)) {
      case TObject | TEnum(_): true;
      case TClass(type): type != String;
      default: false;
    };
  }
  #else
  static inline function ownField(source:Dynamic, name:String):Dynamic {
    return Reflect.field(source, name);
  }

  static inline function setOwnField(target:Dynamic, name:String, value:Dynamic):Void {
    Reflect.setField(target, name, value);
  }
  #end
}
