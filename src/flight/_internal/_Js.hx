package flight._internal;

/** JavaScript coercion and operator semantics explicitly elected by flight-compiler. */
class _Js {
  public static inline function add(left:Dynamic, right:Dynamic):Dynamic {
    #if js return js.Syntax.code("{0} + {1}", left, right); #else return addPortable(left, right); #end
  }

  public static inline function bitwiseAnd(left:Dynamic, right:Dynamic):Int {
    #if js return js.Syntax.code("{0} & {1}", left, right); #else return Std.int(left) & Std.int(right); #end
  }

  public static inline function bitwiseNot(value:Dynamic):Int {
    #if js return js.Syntax.code("~{0}", value); #else return ~Std.int(value); #end
  }

  public static inline function bitwiseOr(left:Dynamic, right:Dynamic):Int {
    #if js return js.Syntax.code("{0} | {1}", left, right); #else return Std.int(left) | Std.int(right); #end
  }

  public static inline function bitwiseXor(left:Dynamic, right:Dynamic):Int {
    #if js return js.Syntax.code("{0} ^ {1}", left, right); #else return Std.int(left) ^ Std.int(right); #end
  }

  public static inline function deleteProperty(target:Dynamic, key:Dynamic):Bool {
    #if js return js.Syntax.code("delete {0}[{1}]", target, key); #else return Reflect.deleteField(target, Std.string(key)); #end
  }

  public static inline function divide(left:Dynamic, right:Dynamic):Float {
    #if js return js.Syntax.code("{0} / {1}", left, right); #else return toNumber(left) / toNumber(right); #end
  }

  public static inline function getProperty(target:Dynamic, key:Dynamic):Dynamic {
    #if js return js.Syntax.code("{0}[{1}]", target, key); #else return Reflect.field(target, Std.string(key)); #end
  }

  public static inline function greaterThan(left:Dynamic, right:Dynamic):Bool {
    #if js return js.Syntax.code("{0} > {1}", left, right); #else return Reflect.compare(left, right) > 0; #end
  }

  public static inline function greaterThanOrEqual(left:Dynamic, right:Dynamic):Bool {
    #if js return js.Syntax.code("{0} >= {1}", left, right); #else return Reflect.compare(left, right) >= 0; #end
  }

  public static inline function inOperator(key:Dynamic, target:Dynamic):Bool {
    #if js return js.Syntax.code("{0} in {1}", key, target); #else return Reflect.hasField(target, Std.string(key)); #end
  }

  public static inline function instanceOf(value:Dynamic, constructor:Dynamic):Bool {
    #if js return js.Syntax.code("{0} instanceof {1}", value, constructor); #else return Std.isOfType(value, constructor); #end
  }

  public static inline function lessThan(left:Dynamic, right:Dynamic):Bool {
    #if js return js.Syntax.code("{0} < {1}", left, right); #else return Reflect.compare(left, right) < 0; #end
  }

  public static inline function lessThanOrEqual(left:Dynamic, right:Dynamic):Bool {
    #if js return js.Syntax.code("{0} <= {1}", left, right); #else return Reflect.compare(left, right) <= 0; #end
  }

  public static inline function looseEqual(left:Dynamic, right:Dynamic):Bool {
    #if js return js.Syntax.code("{0} == {1}", left, right); #else return left == right; #end
  }

  public static inline function multiply(left:Dynamic, right:Dynamic):Float {
    #if js return js.Syntax.code("{0} * {1}", left, right); #else return toNumber(left) * toNumber(right); #end
  }

  public static inline function power(left:Dynamic, right:Dynamic):Float {
    #if js return js.Syntax.code("{0} ** {1}", left, right); #else return Math.pow(toNumber(left), toNumber(right)); #end
  }

  public static inline function remainder(left:Dynamic, right:Dynamic):Float {
    #if js return js.Syntax.code("{0} % {1}", left, right); #else return toNumber(left) % toNumber(right); #end
  }

  public static inline function setProperty(target:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js return js.Syntax.code("{0}[{1}] = {2}", target, key, value); #else Reflect.setField(target, Std.string(key), value); return value; #end
  }

  public static inline function shiftLeft(left:Dynamic, right:Dynamic):Int {
    #if js return js.Syntax.code("{0} << {1}", left, right); #else return Std.int(left) << Std.int(right); #end
  }

  public static inline function shiftRight(left:Dynamic, right:Dynamic):Int {
    #if js return js.Syntax.code("{0} >> {1}", left, right); #else return Std.int(left) >> Std.int(right); #end
  }

  public static inline function shiftRightUnsigned(left:Dynamic, right:Dynamic):Int {
    #if js return js.Syntax.code("{0} >>> {1}", left, right); #else return Std.int(left) >>> Std.int(right); #end
  }

  public static inline function strictEqual(left:Dynamic, right:Dynamic):Bool {
    #if js return js.Syntax.code("{0} === {1}", left, right); #else return left == right; #end
  }

  public static inline function subtract(left:Dynamic, right:Dynamic):Float {
    #if js return js.Syntax.code("{0} - {1}", left, right); #else return toNumber(left) - toNumber(right); #end
  }

  public static inline function toNumber(value:Dynamic):Float {
    #if js
    return js.Syntax.code("Number({0})", value);
    #else
    if (value == null) return 0;
    if (value == true) return 1;
    if (value == false) return 0;
    return Std.parseFloat(Std.string(value));
    #end
  }

  public static inline function truthy(value:Dynamic):Bool {
    #if js
    return js.Syntax.code("Boolean({0})", value);
    #else
    if (value == null || value == false || value == 0 || value == "") return false;
    return !(Std.isOfType(value, Float) && Math.isNaN(cast value));
    #end
  }

  public static inline function typeOf(value:Dynamic):String {
    #if js
    return js.Syntax.code("typeof {0}", value);
    #else
    if (value == null) return "object";
    if (Reflect.isFunction(value)) return "function";
    if (Std.isOfType(value, Bool)) return "boolean";
    if (Std.isOfType(value, Int) || Std.isOfType(value, Float)) return "number";
    if (Std.isOfType(value, String)) return "string";
    return "object";
    #end
  }

  static function addPortable(left:Dynamic, right:Dynamic):Dynamic {
    return Std.isOfType(left, String) || Std.isOfType(right, String)
      ? Std.string(left) + Std.string(right)
      : toNumber(left) + toNumber(right);
  }
}
