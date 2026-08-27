// Maintained host-type declaration for the standard logging surface.
package flight._internal.dom;

#if js
@:native('Console')
extern class Console {
  function debug(value:Dynamic, rest:haxe.Rest<Dynamic>):Void;
  function error(value:Dynamic, rest:haxe.Rest<Dynamic>):Void;
  function info(value:Dynamic, rest:haxe.Rest<Dynamic>):Void;
  function log(value:Dynamic, rest:haxe.Rest<Dynamic>):Void;
  function warn(value:Dynamic, rest:haxe.Rest<Dynamic>):Void;
}
#else
typedef Console = flight._internal._Console;
#end
