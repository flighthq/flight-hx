package flight._internal;

/** Runtime helpers used by Haxe source emitted by flight-compiler. */
class _StringTools {
  public static inline function codePointAt(value:String, index:Int):Null<Int> {
    #if js return js.Syntax.code("{0}.codePointAt({1})", value, index); #else return value.charCodeAt(index); #end
  }

  public static inline function localeCompare(value:String, other:String, ?locales:Dynamic, ?options:Dynamic):Int {
    #if js return js.Syntax.code("{0}.localeCompare({1}, {2}, {3})", value, other, locales, options); #else return Reflect.compare(value, other); #end
  }

  public static inline function match(value:String, pattern:Dynamic):Dynamic {
    #if js return js.Syntax.code("{0}.match({1})", value, pattern); #else return Std.isOfType(pattern, EReg) ? (cast pattern : EReg).match(value) : null; #end
  }

  public static function padEnd(value:String, length:Int, fill:String = " "):String {
    while (value.length < length) value += fill;
    return value.substr(0, length);
  }

  public static function padStart(value:String, length:Int, fill:String = " "):String {
    while (value.length < length) value = fill + value;
    return value.substr(value.length - length);
  }

  public static function repeat(value:String, count:Int):String {
    final buffer = new StringBuf();
    for (_ in 0...count) buffer.add(value);
    return buffer.toString();
  }

  public static inline function replaceFirst(value:String, pattern:Dynamic, replacement:String):String {
    #if js
    return js.Syntax.code("{0}.replace({1}, {2})", value, pattern, replacement);
    #else
    if (Std.isOfType(pattern, EReg)) return (cast pattern : EReg).replace(value, replacement);
    final source = Std.string(pattern);
    final index = value.indexOf(source);
    return index < 0 ? value : value.substr(0, index) + replacement + value.substr(index + source.length);
    #end
  }

  public static inline function search(value:String, pattern:Dynamic):Int {
    #if js return js.Syntax.code("{0}.search({1})", value, pattern); #else return Std.isOfType(pattern, EReg) && (cast pattern : EReg).match(value) ? (cast pattern : EReg).matchedPos().pos : value.indexOf(Std.string(pattern)); #end
  }

  public static function slice(value:String, start:Int = 0, ?end:Int):String {
    final from = start < 0 ? Std.int(Math.max(value.length + start, 0)) : Std.int(Math.min(start, value.length));
    final until = end == null
      ? value.length
      : end < 0
        ? Std.int(Math.max(value.length + end, 0))
        : Std.int(Math.min(end, value.length));
    return value.substring(from, until);
  }

  public static inline function split(value:String, separator:Dynamic, ?limit:Int):Array<String> {
    #if js
    return js.Syntax.code("{2} == null ? {0}.split({1}) : {0}.split({1}, {2})", value, separator, limit);
    #else
    if (limit == 0) return [];
    final result = separator == null
      ? [value]
      : Std.isOfType(separator, EReg)
        ? (cast separator : EReg).split(value)
        : value.split(Std.string(separator));
    if (limit != null && result.length > limit) result.resize(limit);
    return result;
    #end
  }

  public static inline function trimEnd(value:String):String {
    #if js return js.Syntax.code("{0}.trimEnd()", value); #else return ~/\s+$/u.replace(value, ''); #end
  }

  public static inline function trimStart(value:String):String {
    #if js return js.Syntax.code("{0}.trimStart()", value); #else return ~/^\s+/u.replace(value, ''); #end
  }
}
