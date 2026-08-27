// Maintained host-type declaration for the standard cancellation primitive.
package flight._internal.dom;

#if js
@:native('AbortController')
extern class AbortController {
  var signal(default, never):AbortSignal;
  function new():Void;
  function abort(?reason:Dynamic):Void;
}
#else
typedef AbortController = flight._internal._AbortController;
#end
