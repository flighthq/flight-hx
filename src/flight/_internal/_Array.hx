package flight._internal;

/** ECMAScript Array construction and members that do not map directly to Haxe Array. */
@:forward
abstract _Array<T>(Array<T>) from Array<T> to Array<T> {
  public inline function new(?length:Int) {
    #if js
    this = length == null ? [] : js.Syntax.code("new Array({0})", length);
    #else
    this = [];
    if (length != null) this.resize(length);
    #end
  }

  public static inline function isArray(value:Dynamic):Bool {
    #if js
    return js.Syntax.code("Array.isArray({0})", value);
    #else
    return Std.isOfType(value, Array);
    #end
  }

  public static inline function from<T>(value:Dynamic, ?map:Dynamic):Array<T> {
    #if js
    return js.Syntax.code("{1} == null ? Array.from({0}) : Array.from({0}, {1})", value, map);
    #else
    final result:Array<T> = [];
    final append = (entry:Dynamic, index:Int) -> result.push(map == null ? cast entry : cast map(entry, index));
    if (Std.isOfType(value, Array)) {
      final values:Array<Dynamic> = cast value;
      for (index in 0...values.length) append(values[index], index);
      return result;
    }
    final length:Dynamic = Reflect.field(value, 'length');
    if (length != null) {
      for (index in 0...Std.int(length)) append(_Js.getProperty(value, index), index);
      return result;
    }
    final iteratorFactory = Reflect.field(value, 'iterator');
    if (Reflect.isFunction(iteratorFactory)) {
      final iterator:Iterator<Dynamic> = Reflect.callMethod(value, iteratorFactory, []);
      var index = 0;
      while (iterator.hasNext()) {
        append(iterator.next(), index);
        index += 1;
      }
    }
    return result;
    #end
  }

  public static inline function at<T>(values:Array<T>, index:Int):Null<T> {
    final resolved = index < 0 ? values.length + index : index;
    return resolved < 0 || resolved >= values.length ? null : values[resolved];
  }

  public static function copyWithin<T>(values:Array<T>, target:Int, start:Int, ?end:Int):Array<T> {
    #if js
    return js.Syntax.code("{0}.copyWithin({1}, {2}, {3})", values, target, start, end);
    #else
    final length = values.length;
    final to = normalizeIndex(target, length);
    final from = normalizeIndex(start, length);
    final until = end == null ? length : normalizeIndex(end, length);
    final copied = values.slice(from, until);
    for (index in 0...copied.length) {
      final destination = to + index;
      if (destination >= length) break;
      values[destination] = copied[index];
    }
    return values;
    #end
  }

  public static function entries<T>(values:Array<T>):Dynamic {
    #if js
    return js.Syntax.code("{0}.entries()", values);
    #else
    return [for (index in 0...values.length) [index, values[index]]].iterator();
    #end
  }

  public static function fill<T>(values:Array<T>, value:T, start:Int = 0, ?end:Int):Array<T> {
    final length = values.length;
    var index = normalizeIndex(start, length);
    final until = end == null ? length : normalizeIndex(end, length);
    while (index < until) {
      values[index] = value;
      index += 1;
    }
    return values;
  }

  public static function findIndex<T>(values:Array<T>, predicate:Dynamic):Int {
    for (index in 0...values.length) {
      if (predicate(values[index], index, values)) return index;
    }
    return -1;
  }

  public static function flat(values:Array<Dynamic>, depth:Int = 1):Array<Dynamic> {
    if (depth <= 0) return values.copy();
    final result:Array<Dynamic> = [];
    for (value in values) {
      if (isArray(value)) _ArrayTools.pushMany(result, flat(cast value, depth - 1));
      else result.push(value);
    }
    return result;
  }

  public static function flatMap<T>(values:Array<T>, callback:Dynamic):Array<Dynamic> {
    final result:Array<Dynamic> = [];
    for (index in 0...values.length) {
      final value:Dynamic = callback(values[index], index, values);
      if (isArray(value)) _ArrayTools.pushMany(result, cast value);
      else result.push(value);
    }
    return result;
  }

  public static function sort<T>(values:Array<T>, ?compare:Dynamic):Array<T> {
    if (compare == null) {
      values.sort((left, right) -> Reflect.compare(Std.string(left), Std.string(right)));
    } else {
      values.sort((left, right) -> Std.int(compare(left, right)));
    }
    return values;
  }

  static inline function normalizeIndex(index:Int, length:Int):Int {
    return index < 0 ? Std.int(Math.max(length + index, 0)) : Std.int(Math.min(index, length));
  }
}
