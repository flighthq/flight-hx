// Maintained host-type declaration for the standard DOM error identity.
package flighthq._internal.dom;

#if js
@:native('DOMException')
extern class DOMException {
  var message(default, never):String;
  var name(default, never):String;
}
#else
typedef DOMException = flighthq._internal._DOMException;
#end
