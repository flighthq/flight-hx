// Maintained host-type declaration for UTF-8 encoding.
package flight._internal.dom;

#if js
@:native('TextEncoder')
extern class TextEncoder {
  var encoding(default, never):String;
  function new():Void;
  function encode(?source:String):flight._internal._UInt8Array;
}
#else
typedef TextEncoder = flight._internal._TextEncoder;
#end
