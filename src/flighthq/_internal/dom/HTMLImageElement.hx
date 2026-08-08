// Maintained host-type declaration; see HTMLCanvasElement.hx for the model.
package flighthq._internal.dom;

#if js
@:native('HTMLImageElement')
extern class HTMLImageElement {
  var width:Float;
  var height:Float;
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
