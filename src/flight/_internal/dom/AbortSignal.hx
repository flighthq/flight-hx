// Maintained host-type declaration for the standard cancellation primitive.
package flight._internal.dom;

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
typedef AbortSignal = flight._internal._AbortSignal;
#end
