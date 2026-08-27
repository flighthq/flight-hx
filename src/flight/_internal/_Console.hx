// Maintained runtime support for generated Flight Haxe.
package flight._internal;

/** Portable console surface used by Flight's default log sinks. */
@:keep
class _Console {
  public function new() {}

  public function debug(value:Dynamic, ?second:Dynamic, ?third:Dynamic, ?fourth:Dynamic):Void print([value, second, third, fourth]);

  public function error(value:Dynamic, ?second:Dynamic, ?third:Dynamic, ?fourth:Dynamic):Void print([value, second, third, fourth]);

  public function info(value:Dynamic, ?second:Dynamic, ?third:Dynamic, ?fourth:Dynamic):Void print([value, second, third, fourth]);

  public function log(value:Dynamic, ?second:Dynamic, ?third:Dynamic, ?fourth:Dynamic):Void print([value, second, third, fourth]);

  public function warn(value:Dynamic, ?second:Dynamic, ?third:Dynamic, ?fourth:Dynamic):Void print([value, second, third, fourth]);

  static function print(values:Array<Dynamic>):Void {
    while (values.length > 0 && values[values.length - 1] == null) values.pop();
    final line = values.map(Std.string).join(' ');
    #if js
    js.Syntax.code("console.log({0})", line);
    #else
    Sys.println(line);
    #end
  }
}
