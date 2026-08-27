// Maintained host-type declaration. js stays Dynamic (browser GainNode);
// native is a nominal interface implemented by the host audio backend.
package flight._internal.dom;

#if js
typedef GainNode = Dynamic;
#else
interface GainNode extends AudioNode {
  var gain(default, never):AudioParam;
}
#end
