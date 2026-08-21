// Maintained host-type declaration for UTF-8 encoding.
package flighthq._internal.dom;

#if js
@:native('TextEncoder')
extern class TextEncoder {
  var encoding(default, never):String;
  function new():Void;
  function encode(?source:String):flighthq._internal._UInt8Array;
}
#else
typedef TextEncoder = flighthq._internal._TextEncoder;
#end
