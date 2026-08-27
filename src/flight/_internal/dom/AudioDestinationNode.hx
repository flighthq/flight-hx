// Maintained host-type declaration. js stays Dynamic (browser
// AudioDestinationNode); native is a nominal marker interface implemented by
// the host audio backend.
package flight._internal.dom;

#if js
typedef AudioDestinationNode = Dynamic;
#else
interface AudioDestinationNode extends AudioNode {}
#end
