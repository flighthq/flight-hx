// Maintained host-type declaration. The generator maps the TS `lib.dom` type
// of the same name straight here; this file is the single documented answer to
// "what Haxe type supports HTMLCanvasElement", and its js branch declares
// exactly the members Flight's corpus uses — a missing member is a compile
// error whose fix is adding it here. Non-js targets start as Dynamic
// (today's semantics) and are backfilled per platform.
package flighthq._internal.dom;

#if js
@:native('HTMLCanvasElement')
extern class HTMLCanvasElement {
  var width:Int;
  var height:Int;
  var style(default, never):CSSStyleDeclaration;
  function getContext(contextId:String, ?attributes:Dynamic):Dynamic;
  function toDataURL(?type:String, ?quality:Dynamic):String;
  function addEventListener(type:String, listener:Dynamic, ?options:Dynamic):Void;
  function removeEventListener(type:String, listener:Dynamic, ?options:Dynamic):Void;
}
#else
typedef HTMLCanvasElement = Dynamic;
#end
