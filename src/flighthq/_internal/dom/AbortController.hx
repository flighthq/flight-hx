// Maintained host-type declaration for the standard cancellation primitive.
package flighthq._internal.dom;

#if js
@:native('AbortController')
extern class AbortController {
  var signal(default, never):AbortSignal;
  function new():Void;
  function abort(?reason:Dynamic):Void;
}
#else
typedef AbortController = flighthq._internal._AbortController;
#end
