// Maintained host-type declaration; see HTMLCanvasElement.hx for the model.
package flight._internal.dom;

#if js
@:native('ImageData')
extern class ImageData {
  var width(default, never):Int;
  var height(default, never):Int;
  var data(default, never):flight._internal._UInt8ClampedArray;
  var colorSpace(default, never):String;
  function new(width:Int, height:Int);
}
#else
typedef ImageData = Dynamic;
#end
