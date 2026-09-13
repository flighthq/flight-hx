package flight._internal;

/** Runtime helpers used by Haxe source emitted by flight-compiler. */
class _StringTools {
  public static inline function replaceFirst(value:String, pattern:EReg, replacement:String):String {
    return pattern.replace(value, replacement);
  }
}
