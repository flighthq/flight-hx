// Maintained host-type declaration; see HTMLCanvasElement.hx for the model.
package flight._internal.dom;

#if js
@:native('OffscreenCanvas')
extern class OffscreenCanvas {
  var width:Int;
  var height:Int;
  function new(width:Int, height:Int);
  function getContext(contextId:String, ?attributes:Dynamic):Dynamic;
  function convertToBlob(?options:Dynamic):Dynamic;
}
#else
typedef OffscreenCanvas = Dynamic;
#end
