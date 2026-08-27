// Maintained host-type declaration. js stays Dynamic (browser
// StereoPannerNode); native is a nominal interface implemented by the host
// audio backend.
package flight._internal.dom;

#if js
typedef StereoPannerNode = Dynamic;
#else
interface StereoPannerNode extends AudioNode {
  var pan(default, never):AudioParam;
}
#end
