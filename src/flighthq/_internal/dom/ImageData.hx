// Maintained host-type declaration; see HTMLCanvasElement.hx for the model.
package flighthq._internal.dom;

#if js
@:native('ImageData')
extern class ImageData {
  var width(default, never):Int;
  var height(default, never):Int;
  var data(default, never):flighthq._internal._UInt8ClampedArray;
  function new(width:Int, height:Int);
}
#else
typedef ImageData = Dynamic;
#end
