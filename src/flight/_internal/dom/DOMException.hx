// Maintained host-type declaration for the standard DOM error identity.
package flight._internal.dom;

#if js
@:native('DOMException')
extern class DOMException {
  var message(default, never):String;
  var name(default, never):String;
}
#else
typedef DOMException = flight._internal._DOMException;
#end
