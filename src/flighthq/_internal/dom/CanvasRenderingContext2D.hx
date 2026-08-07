// Maintained host-type declaration; see HTMLCanvasElement.hx for the model.
// The js member list mirrors the Canvas2D surface Flight's corpus reaches —
// which is, by construction, the same surface NativeCanvas2dContext implements
// for the native backends. A member missing here is a compile error whose fix
// is adding it (and, when the native backfill lands, implementing it there).
package flighthq._internal.dom;

#if js
@:native('CanvasRenderingContext2D')
extern class CanvasRenderingContext2D {
  var canvas(default, never):HTMLCanvasElement;
  var fillStyle:Dynamic;
  var strokeStyle:Dynamic;
  var globalAlpha:Float;
  var globalCompositeOperation:String;
  var font:String;
  var textAlign:String;
  var textBaseline:String;
  var imageSmoothingEnabled:Bool;
  var imageSmoothingQuality:String;
  var filter:String;
  var lineCap:String;
  var lineJoin:String;
  var lineWidth:Float;
  var miterLimit:Float;
  function beginPath():Void;
  function closePath():Void;
  function moveTo(x:Float, y:Float):Void;
  function lineTo(x:Float, y:Float):Void;
  function rect(x:Float, y:Float, w:Float, h:Float):Void;
  function bezierCurveTo(c1x:Float, c1y:Float, c2x:Float, c2y:Float, x:Float, y:Float):Void;
  function quadraticCurveTo(cx:Float, cy:Float, x:Float, y:Float):Void;
  function arc(x:Float, y:Float, radius:Float, startAngle:Float, endAngle:Float, ?anticlockwise:Bool):Void;
  function ellipse(x:Float, y:Float, radiusX:Float, radiusY:Float, rotation:Float, startAngle:Float, endAngle:Float,
    ?anticlockwise:Bool):Void;
  function roundRect(x:Float, y:Float, width:Float, height:Float, radius:Dynamic):Void;
  function fill(?fillRule:Dynamic):Void;
  function stroke():Void;
  function clip():Void;
  function fillRect(x:Float, y:Float, w:Float, h:Float):Void;
  function strokeRect(x:Float, y:Float, w:Float, h:Float):Void;
  function clearRect(x:Float, y:Float, w:Float, h:Float):Void;
  function save():Void;
  function restore():Void;
  function scale(x:Float, y:Float):Void;
  function rotate(angle:Float):Void;
  function translate(x:Float, y:Float):Void;
  function transform(a:Float, b:Float, c:Float, d:Float, e:Float, f:Float):Void;
  function setTransform(a:Float, b:Float, c:Float, d:Float, e:Float, f:Float):Void;
  function createLinearGradient(x0:Float, y0:Float, x1:Float, y1:Float):Dynamic;
  function createRadialGradient(x0:Float, y0:Float, r0:Float, x1:Float, y1:Float, r1:Float):Dynamic;
  function createPattern(image:Dynamic, repetition:String):Dynamic;
  function drawImage(image:Dynamic, ?a:Float, ?b:Float, ?c:Float, ?d:Float, ?e:Float, ?f:Float, ?g:Float,
    ?h:Float):Void;
  function fillText(text:String, x:Float, y:Float, ?maxWidth:Float):Void;
  function strokeText(text:String, x:Float, y:Float, ?maxWidth:Float):Void;
  function measureText(text:String):Dynamic;
  function getImageData(x:Float, y:Float, w:Float, h:Float):ImageData;
  function putImageData(imageData:ImageData, x:Float, y:Float):Void;
  function createImageData(width:Int, height:Int):ImageData;
  function getContextAttributes():Dynamic;
  function setLineDash(segments:Array<Float>):Void;
  function getLineDash():Array<Float>;
}
#else
typedef CanvasRenderingContext2D = Dynamic;
#end
