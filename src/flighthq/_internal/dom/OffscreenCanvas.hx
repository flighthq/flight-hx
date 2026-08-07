// Maintained host-type declaration; see HTMLCanvasElement.hx for the model.
package flighthq._internal.dom;

#if js
@:native('OffscreenCanvas')
extern class OffscreenCanvas {
  var width:Int;
  var height:Int;
  function new(width:Int, height:Int);
  function getContext(contextId:String, ?attributes:Dynamic):Dynamic;
}
#else
typedef OffscreenCanvas = Dynamic;
#end
