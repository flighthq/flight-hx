// Maintained host-type declaration for the standard cancellation primitive.
package flighthq._internal.dom;

#if js
@:native('AbortSignal')
extern class AbortSignal {
  var aborted(default, never):Bool;
  var reason(default, never):Dynamic;
  function addEventListener(type:String, listener:Dynamic, ?options:Dynamic):Void;
  function removeEventListener(type:String, listener:Dynamic, ?options:Dynamic):Void;
  function throwIfAborted():Void;
}
#else
typedef AbortSignal = flighthq._internal._AbortSignal;
#end
