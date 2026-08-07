// Maintained host-type declaration; see HTMLCanvasElement.hx for the model.
package flighthq._internal.dom;

#if js
@:native('HTMLImageElement')
extern class HTMLImageElement {
  var width:Int;
  var height:Int;
  var naturalWidth(default, never):Int;
  var naturalHeight(default, never):Int;
  var src:String;
  var complete(default, never):Bool;
  var crossOrigin:String;
  var decoding:String;
  function decode():Dynamic;
}
#else
typedef HTMLImageElement = Dynamic;
#end
